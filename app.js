'use strict';
const express = require('express');
const mysql = require('mysql2/promise');
const crypto = require('crypto');
const fs = require('fs');
const path = require('path');

const PORT = process.env.PORT || 3002;
const WEB = '/var/lib/apisekolah/web';
const ADMIN_KEY = (() => { try { return fs.readFileSync(path.join(WEB, '.adminkey'), 'utf8').trim(); } catch (e) { return ''; } })();
const SESSION_SECRET = (() => { try { return fs.readFileSync(path.join(WEB, '.sesskey'), 'utf8').trim(); } catch (e) { const s = crypto.randomBytes(32).toString('hex'); fs.writeFileSync(path.join(WEB, '.sesskey'), s); return s; } })();

const pool = mysql.createPool({ user: 'apisekolah', database: 'sekolah', charset: 'utf8mb4', socketPath: '/var/run/mysqld/mysqld.sock', waitForConnections: true, connectionLimit: 15, timezone: 'Z' });

const app = express();
app.disable('etag');
app.set('trust proxy', true);
app.use(express.json());
app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PATCH, DELETE');
  res.header('Access-Control-Allow-Headers', 'Content-Type, X-API-Key, X-Admin-Key, Authorization');
  if (req.method === 'OPTIONS') return res.sendStatus(200);
  next();
});

// ---------- session ----------
function sign(v) { return v + '.' + crypto.createHmac('sha256', SESSION_SECRET).update(v).digest('hex').slice(0, 32); }
function unsign(signed) { if (!signed || signed.indexOf('.') < 0) return null; const [v, h] = signed.split('.'); return crypto.createHmac('sha256', SESSION_SECRET).update(v).digest('hex').slice(0, 32) === h ? v : null; }
function parseCookies(req) { const o = {}; (req.headers.cookie || '').split(';').forEach(c => { const i = c.indexOf('='); if (i > 0) o[c.slice(0, i).trim()] = decodeURIComponent(c.slice(i + 1)); }); return o; }
function setSession(res, uid) { res.setHeader('Set-Cookie', `sess=${sign(String(uid))}; Path=/; HttpOnly; SameSite=Lax; Max-Age=2592000`); }
function clearSession(res) { res.setHeader('Set-Cookie', 'sess=; Path=/; HttpOnly; Max-Age=0'); }
function makeHash(pw) { const salt = crypto.randomBytes(16).toString('hex'); return { salt, hash: crypto.scryptSync(pw, salt, 64).toString('hex') }; }
function verifyPw(pw, salt, hash) { return crypto.scryptSync(pw, salt, 64).toString('hex') === hash; }

// ---------- stats + activity ----------
const stats = { total: 0, byEndpoint: {}, start: Date.now() };
async function logActivity(rec) { try { await pool.query('INSERT INTO activity_log (user_id, api_key_id, api_key, ip, method, path, status, ms, sekolah_id) VALUES (?,?,?,?,?,?,?,?,?)', [rec.userId || null, rec.apiKeyId || null, rec.apiKey || null, rec.ip || null, rec.method || null, (rec.path || '').slice(0, 300), rec.status || null, rec.ms || null, rec.sekolahId || null]); } catch (e) {} }
app.use((req, res, next) => {
  const t0 = Date.now(); const ip = (req.ip || '').replace('::ffff:', '');
  res.on('finish', () => {
    stats.total++; stats.byEndpoint[req.originalUrl.split('?')[0]] = (stats.byEndpoint[req.originalUrl.split('?')[0]] || 0) + 1;
    if (req.header('X-API-Key') || (req.sessionUser && req.sessionUser.id)) logActivity({ userId: req.sessionUser ? req.sessionUser.id : null, apiKey: req.header('X-API-Key'), ip, method: req.method, path: req.originalUrl, status: res.statusCode, ms: Date.now() - t0, sekolahId: req.params && req.params.id ? req.params.id : null });
  });
  next();
});
app.use(async (req, res, next) => {
  const c = parseCookies(req); const uid = unsign(c.sess); req.sessionUser = null;
  if (uid) { try { const [r] = await pool.query('SELECT id, email, nama, role, is_active FROM users WHERE id = ?', [uid]); if (r[0] && r[0].is_active) req.sessionUser = r[0]; } catch (e) {} }
  next();
});
function requireUser(req, res, next) { if (!req.sessionUser) return res.status(401).json({ error: 'Login diperlukan' }); next(); }
function requireAdmin(req, res, next) { if (req.sessionUser && req.sessionUser.role === 'admin') return next(); if (req.header('X-Admin-Key') === ADMIN_KEY) return next(); return res.status(403).json({ error: 'Forbidden' }); }

// ---------- API key auth ----------
const keyCache = new Map();
async function getKey(k) { if (!k) return null; if (keyCache.has(k)) return keyCache.get(k); const [r] = await pool.query('SELECT id, rate_limit_per_min, is_active FROM api_keys WHERE api_key = ?', [k]); const row = r[0] || null; keyCache.set(k, row); setTimeout(() => keyCache.delete(k), 60000); return row; }
const hit = new Map();
function rateOK(k, lim) { const n = Date.now(); const w = (hit.get(k) || []).filter(t => n - t < 60000); w.push(n); hit.set(k, w); return w.length <= lim; }
function requireKey(req, res, next) {
  const ak = req.header('X-API-Key');
  getKey(ak).then(row => {
    if (!row || !row.is_active) return res.status(401).json({ error: 'API key tidak valid' });
    if (!rateOK(ak, row.rate_limit_per_min)) return res.status(429).json({ error: 'Rate limit terlampaui' });
    pool.query('UPDATE api_keys SET total_requests = total_requests + 1, last_used_at = NOW() WHERE api_key = ?', [ak]).catch(() => {});
    next();
  }).catch(e => res.status(500).json({ error: e.message }));
}

// ---------- auth routes ----------
app.post('/login', async (req, res) => {
  const { email, password } = req.body || {};
  if (!email || !password) return res.status(400).json({ error: 'email & password wajib' });
  const [rows] = await pool.query('SELECT * FROM users WHERE email = ?', [email.trim().toLowerCase()]);
  const u = rows[0];
  if (!u || !u.is_active || !verifyPw(password, u.password_salt, u.password_hash)) return res.status(401).json({ error: 'Email atau password salah' });
  setSession(res, u.id);
  res.json({ ok: true, user: { id: u.id, email: u.email, nama: u.nama, role: u.role } });
});
app.post('/logout', (req, res) => { clearSession(res); res.json({ ok: true }); });
app.get('/me', requireUser, (req, res) => res.json({ user: { id: req.sessionUser.id, email: req.sessionUser.email, nama: req.sessionUser.nama, role: req.sessionUser.role } }));
(async () => { try { const [r] = await pool.query('SELECT COUNT(*) AS c FROM users'); if (r[0].c === 0) { const { salt, hash } = makeHash(process.env.ADMIN_PASS || 'Admin#2026!'); await pool.query('INSERT INTO users (email, password_hash, password_salt, nama, role) VALUES (?,?,?,?,?)', ['admin@apisekolah.id', hash, salt, 'Administrator', 'admin']); console.log('[seed] admin admin@apisekolah.id / ' + (process.env.ADMIN_PASS || 'Admin#2026!')); } } catch (e) { console.error('seed', e.message); } })();

// ---------- user management ----------
app.get('/admin/users', requireAdmin, async (req, res) => { const [r] = await pool.query('SELECT id, email, nama, role, is_active, created_at FROM users ORDER BY created_at DESC'); res.json(r); });
app.post('/admin/users', requireAdmin, async (req, res) => { const { email, password, nama, role } = req.body || {}; if (!email || !password) return res.status(400).json({ error: 'email & password wajib' }); const { salt, hash } = makeHash(password); try { const [r] = await pool.query('INSERT INTO users (email, password_hash, password_salt, nama, role) VALUES (?,?,?,?,?)', [email.trim().toLowerCase(), hash, salt, nama || null, role === 'admin' ? 'admin' : 'user']); res.json({ id: r.insertId, message: 'user dibuat' }); } catch (e) { res.status(400).json({ error: e.message }); } });
app.patch('/admin/users/:id', requireAdmin, async (req, res) => { const { is_active, role, password, nama } = req.body || {}; const s = [], p = []; if (nama !== undefined) { s.push('nama = ?'), p.push(nama); } if (is_active !== undefined) { s.push('is_active = ?'), p.push(is_active ? 1 : 0); } if (role !== undefined) { s.push('role = ?'), p.push(role === 'admin' ? 'admin' : 'user'); } if (password) { const { salt, hash } = makeHash(password); s.push('password_hash = ?'), p.push(hash); s.push('password_salt = ?'), p.push(salt); } if (!s.length) return res.status(400).json({ error: 'nothing' }); p.push(req.params.id); await pool.query(`UPDATE users SET ${s.join(', ')} WHERE id = ?`, p); res.json({ message: 'updated' }); });
app.delete('/admin/users/:id', requireAdmin, async (req, res) => { await pool.query('DELETE FROM users WHERE id = ?', [req.params.id]); res.json({ message: 'deleted' }); });

// ---------- api key management ----------
app.get('/admin/keys', requireAdmin, async (req, res) => { const me = req.sessionUser; const w = (me && me.role !== 'admin') ? 'WHERE user_id = ' + me.id : ''; const [r] = await pool.query(`SELECT id, user_id, api_key, name, owner_email, rate_limit_per_min, is_active, total_requests, last_used_at, created_at FROM api_keys ${w} ORDER BY created_at DESC`); res.json(r); });
app.post('/admin/keys', requireAdmin, async (req, res) => { const { name, owner_email, rate_limit_per_min } = req.body || {}; if (!owner_email) return res.status(400).json({ error: 'owner_email wajib' }); const uid = (req.sessionUser && req.sessionUser.role !== 'admin') ? req.sessionUser.id : null; const key = 'sk_' + crypto.randomBytes(24).toString('hex'); await pool.query('INSERT INTO api_keys (api_key, name, owner_email, rate_limit_per_min, user_id) VALUES (?,?,?,?,?)', [key, name || null, owner_email, INT(rate_limit_per_min, 60), uid]); res.json({ api_key: key, message: 'API key dibuat' }); });
app.patch('/admin/keys/:id', requireAdmin, async (req, res) => { const { is_active, rate_limit_per_min } = req.body || {}; const me = req.sessionUser; const s = [], p = []; if (is_active !== undefined) { s.push('is_active = ?'), p.push(is_active ? 1 : 0); } if (rate_limit_per_min !== undefined) { s.push('rate_limit_per_min = ?'), p.push(INT(rate_limit_per_min, 60)); } if (!s.length) return res.status(400).json({ error: 'nothing' }); let w = 'WHERE id = ?'; p.push(req.params.id); if (me && me.role !== 'admin') w = 'AND user_id = ' + me.id + ' ' + w; await pool.query(`UPDATE api_keys SET ${s.join(', ')} ${w}`, p); res.json({ message: 'updated' }); });
app.delete('/admin/keys/:id', requireAdmin, async (req, res) => { const me = req.sessionUser; let w = 'WHERE id = ?'; const p = [req.params.id]; if (me && me.role !== 'admin') w = 'AND user_id = ' + me.id + ' ' + w; await pool.query(`DELETE FROM api_keys ${w}`, p); res.json({ message: 'deleted' }); });

function INT(v, d) { const n = parseInt(v, 10); return Number.isFinite(n) ? n : d; }
function LIKE(v) { return `%${v}%`; }

// ---------- API v1 ----------
const v1 = express.Router();
// ---------- response cache (in-memory TTL) ----------
const CACHE_TTL = 120000; // 2 menit
const respCache = new Map();
function cacheKey(req){ return req.method + ' ' + req.originalUrl.split('?')[0] + '?' + (req.originalUrl.split('?')[1] || ''); }
v1.use((req, res, next) => {
  if (req.method !== 'GET') return next();
  const k = cacheKey(req);
  const hit = respCache.get(k);
  if (hit && Date.now() - hit.t < CACHE_TTL) {
    stats.cacheHits = (stats.cacheHits || 0) + 1;
    res.set('X-Cache', 'HIT');
    return res.json(hit.body);
  }
  stats.cacheMiss = (stats.cacheMiss || 0) + 1;
  const origJson = res.json.bind(res);
  res.json = function(body){
    if (res.statusCode < 400) respCache.set(k, { t: Date.now(), body });
    return origJson(body);
  };
  next();
});


v1.get('/', (req, res) => res.json({ name: 'API Data Sekolah Indonesia', version: '2.3.0', base: '/api/v1', auth: 'Header X-API-Key', endpoints: { 'sekolah': 'GET list/filter (npsn, nama, q, kode_provinsi, kode_kabupaten, kode_kecamatan, nama_provinsi, nama_kabupaten, nama_kecamatan, bentuk_pendidikan, status_sekolah, akreditasi)', 'sekolah/:id': 'GET detail lengkap', 'wilayah/provinsi': 'GET', 'wilayah/kabupaten': 'GET?kode_provinsi=', 'wilayah/kecamatan': 'GET?kode_kabupaten=' } }));

// build WHERE for sekolah list from query
function buildWhere(q) {
  const where = [], params = [];
  if (q.kode_provinsi) { where.push('kode_provinsi_kemendagri = ?'), params.push(String(q.kode_provinsi).replace('.', '')); }
  if (q.kode_kabupaten) { where.push('kode_kabupaten_kemendagri = ?'), params.push(String(q.kode_kabupaten)); }
  if (q.kode_kecamatan) { where.push('kode_kecamatan = ?'), params.push(String(q.kode_kecamatan).replace('.', '')); }
  if (q.npsn) { where.push('npsn = ?'), params.push(q.npsn); }
  if (q.nama) { where.push('nama LIKE ?'), params.push(LIKE(q.nama)); }
  if (q.nama_provinsi) { where.push('nama_provinsi_dikdasmen LIKE ?'), params.push(LIKE(q.nama_provinsi)); }
  if (q.nama_kabupaten) { where.push('nama_kabupaten_dikdasmen LIKE ?'), params.push(LIKE(q.nama_kabupaten)); }
  if (q.nama_kecamatan) { where.push('nama_kecamatan LIKE ?'), params.push(LIKE(q.nama_kecamatan)); }
  if (q.bentuk_pendidikan) { where.push('bentuk_pendidikan = ?'), params.push(q.bentuk_pendidikan); }
  if (q.status_sekolah) { where.push('status_sekolah = ?'), params.push(q.status_sekolah); }
  if (q.akreditasi) { where.push('akreditasi = ?'), params.push(q.akreditasi); }
  if (q.q) { where.push('(nama LIKE ? OR npsn LIKE ?)'), params.push(LIKE(q.q), LIKE(q.q)); }
  return { where, params };
}

// Datatables server-side endpoint: /api/v1/sekolah/dt
// Menerima param standar DataTables: draw, start, length, search[value], order[0][column/dir], columns[i][data]
v1.get('/sekolah/dt', async (req, res) => {
  try {
    const q = req.query;
    const draw = parseInt(q.draw, 10) || 1;
    const start = Math.max(0, parseInt(q.start, 10) || 0);
    const length = Math.min(100, Math.max(1, parseInt(q.length, 10) || 20));
    const search = (q.search && q.search.value) ? q.search.value : '';
    // sortable columns (index -> column name in view)
    const sortable = { 0:'sekolah_id', 1:'npsn', 2:'nama', 3:'bentuk_pendidikan', 4:'status_sekolah', 5:'akreditasi', 6:'kode_kabupaten_kemendagri', 7:'nama_kecamatan_kemendagri' };
    let orderBy = 'nama';
    try {
      const oc = parseInt((q.order && q.order[0] && q.order[0].column) || '2', 10);
      const dir = ((q.order && q.order[0] && q.order[0].dir) === 'desc') ? 'DESC' : 'ASC';
      if (sortable[oc]) orderBy = sortable[oc] + ' ' + dir;
    } catch (e) {}
    const where = [], params = [];
    if (search) { where.push('(nama LIKE ? OR npsn LIKE ?)'), params.push(LIKE(search), LIKE(search)); }
    if (q.kode_provinsi) { where.push('kode_provinsi_kemendagri = ?'), params.push(String(q.kode_provinsi).replace('.', '')); }
    if (q.kode_kabupaten) { where.push('kode_kabupaten_kemendagri = ?'), params.push(String(q.kode_kabupaten)); }
    if (q.kode_kecamatan) { where.push('kode_kecamatan = ?'), params.push(String(q.kode_kecamatan).replace('.', '')); }
    if (q.nama_provinsi) { where.push('nama_provinsi_dikdasmen LIKE ?'), params.push(LIKE(q.nama_provinsi)); }
    if (q.nama_kabupaten) { where.push('nama_kabupaten_dikdasmen LIKE ?'), params.push(LIKE(q.nama_kabupaten)); }
    if (q.bentuk_pendidikan) { where.push('bentuk_pendidikan = ?'), params.push(q.bentuk_pendidikan); }
    if (q.status_sekolah) { where.push('status_sekolah = ?'), params.push(q.status_sekolah); }
    if (q.akreditasi) { where.push('akreditasi = ?'), params.push(q.akreditasi); }
    const w = where.length ? 'WHERE ' + where.join(' AND ') : '';
    const [[{ total }]] = await pool.query(`SELECT COUNT(*) AS total FROM v_sekolah_search ${w}`, params);
    const [rows] = await pool.query(`SELECT * FROM v_sekolah_search ${w} ORDER BY ${orderBy} LIMIT ? OFFSET ?`, [...params, length, start]);
    res.json({ draw, recordsTotal: total, recordsFiltered: total, data: rows });
  } catch (e) { console.error(e); res.status(500).json({ error: e.message }); }
});


v1.get('/sekolah', async (req, res) => {
  try {
    const q = req.query; const page = Math.max(1, INT(q.page, 1)); const size = Math.min(100, Math.max(1, INT(q.size, 20))); const off = (page - 1) * size;
    const { where, params } = buildWhere(q);
    const w = where.length ? 'WHERE ' + where.join(' AND ') : '';
    const [[{ total }]] = await pool.query(`SELECT COUNT(*) AS total FROM v_sekolah_search ${w}`, params);
    const [rows] = await pool.query(`SELECT * FROM v_sekolah_search ${w} ORDER BY nama LIMIT ? OFFSET ?`, [...params, size, off]);
    res.json({ success: true, message: 'Get Data Success', page, size, total, count: rows.length, data: rows });
  } catch (e) { console.error(e); res.status(500).json({ error: e.message }); }
});
v1.get('/sekolah/:id', async (req, res) => {
  try {
    const [[s]] = await pool.query('SELECT * FROM sekolah WHERE sekolah_id = ?', [req.params.id]);
    if (!s) return res.status(404).json({ error: 'not found' });
    const [ruang] = await pool.query('SELECT * FROM sekolah_ruang WHERE sekolah_id = ?', [req.params.id]);
    const [ptk] = await pool.query('SELECT * FROM sekolah_ptk WHERE sekolah_id = ?', [req.params.id]);
    const [kurikulum] = await pool.query('SELECT * FROM sekolah_kurikulum WHERE sekolah_id = ?', [req.params.id]);
    const [rasio] = await pool.query('SELECT * FROM sekolah_rasio WHERE sekolah_id = ?', [req.params.id]);
    const [foto] = await pool.query('SELECT * FROM sekolah_foto WHERE sekolah_id = ?', [req.params.id]);
    res.json({ success: true, message: 'Get Data Success', data: { sekolah: s, ruang, ptk, kurikulum, rasio, foto } });
  } catch (e) { console.error(e); res.status(500).json({ error: e.message }); }
});
v1.get('/wilayah/provinsi', async (req, res) => { const [r] = await pool.query('SELECT DISTINCT kode_provinsi_mendagri AS kode, nama_provinsi_mendagri AS nama FROM wilayah WHERE kode_provinsi_mendagri IS NOT NULL ORDER BY nama'); res.json(r); });
v1.get('/wilayah/kabupaten', async (req, res) => { const kp = req.query.kode_provinsi; const p = []; let w = ''; if (kp) { w = 'AND kode_provinsi_mendagri = ?', p.push(String(kp).replace('.', '')); } const [r] = await pool.query(`SELECT DISTINCT kode_kabupaten_mendagri AS kode, nama_kabupaten_mendagri AS nama FROM wilayah WHERE kode_kabupaten_mendagri IS NOT NULL ${w} ORDER BY nama`, p); res.json(r); });
v1.get('/wilayah/kecamatan', async (req, res) => { const kk = req.query.kode_kabupaten; if (!kk) return res.status(400).json({ error: 'kode_kabupaten required' }); const [r] = await pool.query('SELECT DISTINCT kode_kecamatan_mendagri AS kode, nama_kecamatan_mendagri AS nama FROM wilayah WHERE kode_kabupaten_mendagri = ? AND kode_kecamatan_mendagri IS NOT NULL ORDER BY nama', [kk]); res.json(r); });
app.use('/api/v1', requireKey, v1);

// ---------- stats / monitoring ----------
app.get('/api/stats', (req, res) => { res.set('Cache-Control', 'no-store'); res.json({ uptime_detik: Math.floor((Date.now() - stats.start) / 1000), total_request: stats.total, cache_hits: stats.cacheHits || 0, cache_miss: stats.cacheMiss || 0, cache_size: respCache.size, req_per_min: Math.round(stats.total / Math.max(1, (Date.now() - stats.start) / 60000)), top_endpoint: Object.entries(stats.byEndpoint).sort((a, b) => b[1] - a[1]).slice(0, 10) }); });
app.get('/api/scrape-status', async (req, res) => { res.set('Cache-Control', 'no-store'); try { const [p] = await pool.query('SELECT status, COUNT(*) AS j FROM scrape_progress GROUP BY status'); const [[{ total }]] = await pool.query('SELECT COUNT(*) AS total FROM sekolah'); const o = { total_sekolah: total, status: {} }; for (const r of p) o.status[r.status] = r.j; o.selesai = o.status.done || 0; o.total_kabupaten = Object.values(o.status).reduce((a, b) => a + b, 0); o.persen = o.total_kabupaten ? Math.round(o.selesai / o.total_kabupaten * 100) : 0; res.json(o); } catch (e) { res.status(500).json({ error: e.message }); } });
app.get('/api/activity', requireAdmin, async (req, res) => { const lim = Math.min(200, Math.max(1, INT(req.query.limit, 50))); const [r] = await pool.query('SELECT a.*, u.email FROM activity_log a LEFT JOIN users u ON a.user_id = u.id ORDER BY a.id DESC LIMIT ?', [lim]); res.json(r); });

// ---------- Swagger ----------
const SWAGGER_UI = `<!DOCTYPE html><html><head><link rel="stylesheet" href="https://unpkg.com/swagger-ui-dist@5/swagger-ui.css"><title>API Sekolah - Docs</title></head><body><div id="swagger-ui"></div><script src="https://unpkg.com/swagger-ui-dist@5/swagger-ui-bundle.js"></script><script>window.onload=function(){window.ui=SwaggerUIBundle({url:'/api-docs.json',dom_id:'#swagger-ui'});};</script></body></html>`;
const OPENAPI = require('./openapi.json');
app.get('/api-docs', (req, res) => res.type('html').send(SWAGGER_UI));
app.get('/api-docs.json', (req, res) => res.json(OPENAPI));

// ---------- pages ----------
app.get('/', (req, res) => res.sendFile(path.join(WEB, 'login.html')));
app.get('/datatables-demo', (req, res) => res.sendFile(path.join(WEB, 'datatables-example.html')));
app.get('/dashboard', (req, res) => res.sendFile(path.join(WEB, 'dashboard.html')));

app.listen(PORT, '127.0.0.1', () => console.log(`API Sekolah on 127.0.0.1:${PORT}`));
