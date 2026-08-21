# API Data Sekolah Indonesia

API terbuka untuk mencari data sekolah seluruh Indonesia, menggabungkan kode & nama
wilayah **Kemendagri** (administrasi) dan **Kemendikbud/Dikdasmen** (pendidikan) supaya
join dan pencarian antar sumber data tidak ambigu.

Base URL (produksi): `https://apisekolah.subuhkreatif.my.id`

---

## Fitur

- Pencarian sekolah: by **NPSN**, **nama**, **kata kunci bebas (q)**, kode/nama wilayah.
- Filter: provinsi, kabupaten, kecamatan (kode Kemendagri maupun Dikdasmen), bentuk & status pendidikan, akreditasi.
- Detail sekolah lengkap: ruang, PTK (pendidik & tenaga kependidikan), kurikulum, rasio, foto.
- Response JSON rapi dengan label jelas sumber data (`*_kemendagri` vs `*_dikdasmen`).
- Dashboard admin: manajemen user, manajemen API key (rate-limit & usage), dokumentasi, activity log, monitoring.
- **Swagger UI** interaktif di `/api-docs` untuk coba request/response langsung.

---

## Endpoint API

Semua endpoint di bawah **wajib header** `X-API-Key: sk_xxx`. Tanpa key → `401`.

Base: `/api/v1`

| Method | Endpoint | Keterangan |
|--------|----------|------------|
| GET | `/sekolah` | List + filter sekolah |
| GET | `/sekolah/:id` | Detail lengkap (ruang, ptk, kurikulum, rasio, foto) |
| GET | `/wilayah/provinsi` | List provinsi |
| GET | `/wilayah/kabupaten?kode_provinsi=31` | List kabupaten dalam provinsi |
| GET | `/wilayah/kecamatan?kode_kabupaten=32.71` | List kecamatan dalam kabupaten |

### Filter `/sekolah`

| Param | Contoh | Keterangan |
|-------|--------|------------|
| `npsn` | `40604924` | Exact match |
| `nama` | `CONTOH` | LIKE nama sekolah |
| `q` | `CONTOH` | Cari di nama ATAU npsn |
| `kode_provinsi` | `31` | Kode Kemendagri 2 digit |
| `kode_kabupaten` | `32.71` | Kode Kemendagri (bisa `32.71` atau `3271`) |
| `kode_kecamatan` | `327104` | Kode Kemendagri 6 digit |
| `nama_provinsi` | `Jawa Barat` | LIKE nama provinsi (Dikdasmen) |
| `nama_kabupaten` | `Bogor` | LIKE nama kabupaten (Dikdasmen) |
| `nama_kecamatan` | `Barat` | LIKE nama kecamatan |
| `bentuk_pendidikan` | `SMA` | SD/SMP/SMA/SMK/dst |
| `status_sekolah` | `NEGERI` | NEGERI / SWASTA |
| `akreditasi` | `A` | A/B/C |
| `page`, `size` | `page=1&size=20` | Pagination (size max 100) |

### Contoh request

```bash
curl "https://apisekolah.subuhkreatif.my.id/api/v1/sekolah?kode_kabupaten=32.71&bentuk_pendidikan=SMA&size=5" \
  -H "X-API-Key: sk_xxxxxxxxxxxxxxxxxxxxxxxx"
```

### Contoh response

```json
{
  "success": true,
  "message": "Get Data Success",
  "total": 1383,
  "page": 1,
  "size": 5,
  "count": 5,
  "data": [
    {
      "sekolah_id": "C7C3B2A6-34EC-4BA7-8EDE-B3EDB0B94F38",
      "npsn": "70001234",
      "nama": "SDN CONTOH",
      "bentuk_pendidikan": "SD",
      "status_sekolah": "NEGERI",
      "akreditasi": "A",
      "alamat_jalan": "Jl. Contoh",
      "rt": "01",
      "rw": "02",
      "nama_dusun": "Sukamaju",
      "kode_pos": "16110",
      "email": "sdncontoh@gmail.com",
      "telepon": "02155667788",
      "yayasan": "Yayasan Contoh",
      "web": "https://sdncontoh.sch.id",
      "kode_provinsi_kemendagri": "32",
      "nama_provinsi_kemendagri": "Jawa Barat",
      "kode_kabupaten_kemendagri": "32.71",
      "nama_kabupaten_kemendagri": "Kota Bogor",
      "kode_kecamatan_kemendagri": "327106",
      "nama_kecamatan_kemendagri": "Tanah Sareal",
      "kode_provinsi_dikdasmen": "3271",
      "nama_provinsi_dikdasmen": "Prov. Jawa Barat",
      "kode_kabupaten_dikdasmen": "3271",
      "nama_kabupaten_dikdasmen": "Kota Bogor",
      "kode_kecamatan_dikdasmen": null,
      "nama_kecamatan_dikdasmen": null,
      "lintang": "-6.5",
      "bujur": "106.7"
    }
  ]
}
```

> Field yang tidak punya data akan bernilai `null`. Semua kode/nama wilayah memiliki
> suffix `_kemendagri` (sumber administrasi) atau `_dikdasmen` (sumber pendidikan) agar
> tidak rancu.

### Detail sekolah (`/sekolah/:id`)

```json
{
  "success": true,
  "data": {
    "sekolah": { "...": "kolom seperti di atas" },
    "ruang": [ { "...": "data ruang kelas" } ],
    "ptk": [ { "...": "data pendidik & tenaga kependidikan" } ],
    "kurikulum": [ { "...": "data kurikulum" } ],
    "rasio": [ { "...": "data rasio" } ],
    "foto": [ { "...": "data foto sekolah" } ]
  }
}
```

---

## Dokumentasi Interaktif (Swagger)

Buka `https://apisekolah.subuhkreatif.my.id/api-docs` (atau lokal `http://localhost:3002/api-docs`).
Klik **Authorize** lalu masukkan API key Anda untuk mencoba seluruh endpoint langsung dari browser.

---

## Instalasi (Development)

### Prasyarat
- Node.js 18+ (disarankan via NVM)
- MySQL 8+ (atau MariaDB 10.6+) dengan socket `/var/run/mysqld/mysqld.sock`
- Database `sekolah` dengan tabel sesuai struktur di bawah

### Langkah
```bash
git clone https://github.com/jeffnst/apisekolah.git
cd apisekolah
npm install

# 1. Siapkan database & import sampel
mysql -u root -p -e "CREATE DATABASE sekolah CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;"
mysql -u root -p sekolah < sample_data/sample_data.sql

# 2. Buat user aplikasi (auth_socket) — agar app jalan tanpa password DB di kode
mysql -u root -p -e "CREATE USER IF NOT EXISTS 'apisekolah'@'localhost' IDENTIFIED WITH auth_socket;"
mysql -u root -p -e "GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, INDEX, DROP ON sekolah.* TO 'apisekolah'@'localhost';"

# 3. Jalankan
npm start
# API tersedia di http://127.0.0.1:3002
```

Buka `http://127.0.0.1:3002/dashboard` untuk login admin.

> Password admin default (hanya untuk dev/test): `Admin#2026!`
> **Ganti segera** lewat tab User di dashboard.

---

## Struktur Tabel (ringkas)

| Tabel | Isi |
|-------|-----|
| `sekolah` | Data utama sekolah (554.626 row). Field kemendagri: `kode_provinsi_kemendagri`, `kode_kabupaten` (5-digit), `kode_kecamatan_kemendagri`, `nama_provinsi_kemendagri`, `nama_kabupaten_kemendagri`, `nama_kecamatan_kemendagri`. Field kontak: `email`, `nomor_telepon` (alias `telepon`), `yayasan`, `website` (alias `web`). |
| `v_sekolah_search` | VIEW untuk API list — menggabungkan `sekolah` + `wilayah_dikdasmen`. |
| `wilayah` | Wilayah administrasi Kemendagri (prov/kab/kec) lengkap dengan kode & nama mendagri. |
| `wilayah_dikdasmen` | Pemetaan kode wilayah versi Dikdasmen. |
| `desa` | Data desa (sumber backfill kecamatan). |
| `kabupaten` | Referensi kabupaten. |
| `sekolah_ruang`, `sekolah_ptk`, `sekolah_kurikulum`, `sekolah_rasio`, `sekolah_foto` | Relasi 1-N ke `sekolah` (detail). |
| `kecamatan_missing` | Tabel bantu untuk melengkapi kecamatan yg tak ada di `desa`. |
| `users` | User login dashboard (password scrypt + salt). |
| `api_keys` | API key per aplikasi (rate-limit, usage counter). |
| `activity_log` | Log tiap request API. |
| `scrape_progress` | Status pengisian data per kabupaten. |

### Catatan kolasi (penting!)
Tabel `sekolah` & `desa` menggunakan `utf8mb4_general_ci`, sedangkan `wilayah` menggunakan
`utf8mb4_0900_ai_ci`. **JOIN antar keduanya wajib pakai `COLLATE utf8mb4_0900_ai_ci`**
(jika tidak, MySQL error "Illegal mix of collations").

---

## Deployment (Production)

Contoh konfigurasi systemd (`/etc/systemd/system/apisekolah.service`):

```ini
[Unit]
Description=API Sekolah
After=network.target mysql.service

[Service]
User=apisekolah
WorkingDirectory=/var/lib/apisekolah/web
ExecStart=/opt/node/bin/node /var/lib/apisekolah/web/app.js
Restart=on-failure
Environment=PORT=3002

[Install]
WantedBy=multi-user.target
```

```bash
sudo systemctl daemon-reload
sudo systemctl enable --now apisekolah
```

Lalu proxy lewat Nginx + SSL ke `127.0.0.1:3002` (lihat `sites-available/apisekolah.subuhkreatif.my.id`).

---

## Keamanan

- API key dikirim via header `X-API-Key`, bukan di URL.
- Dashboard butuh login (session cookie); pembuatan key/role user butuh hak admin.
- File `.adminkey` (admin key) & `.sesskey` (session secret) **di-gitignore** — jangan commit.
- Ganti password admin & admin key setelah deploy.

---

## Integrasi dengan DataTables (jQuery)

API menyediakan endpoint **server-side** yang langsung kompatibel dengan
[DataTables.js](https://datatables.net): `GET /api/v1/sekolah/dt`.

Format respons mengikuti standar DataTables:

```json
{ "draw": 1, "recordsTotal": 308, "recordsFiltered": 308, "data": [ ... ] }
```

Parameter yang diterima: `draw`, `start`, `length`, `search[value]` (cari nama/npsn),
`order[0][column]` & `order[0][dir]`, plus filter `kode_kabupaten`, `kode_kecamatan`,
`bentuk_pendidikan`, `status_sekolah`, `akreditasi`, `nama_provinsi`, `nama_kabupaten`.

### Contoh frontend

File `datatables-example.html` (lihat di repo) sudah jadi demo lengkap. Cara pakai intinya:

```html
<table id="t" class="display"><thead><tr>
  <th>NPSN</th><th>Nama</th><th>Bentuk</th><th>Status</th><th>Akreditasi</th><th>Kab</th><th>Kecamatan</th>
</tr></thead></table>

<script>
$('#t').DataTable({
  processing: true, serverSide: true,
  ajax: {
    url: '/api/v1/sekolah/dt',
    beforeSend: function(xhr){ xhr.setRequestHeader('X-API-Key', 'sk_xxx'); }
  },
  columns: [
    { data: 'npsn' }, { data: 'nama' }, { data: 'bentuk_pendidikan' },
    { data: 'status_sekolah' }, { data: 'akreditasi' },
    { data: 'kode_kabupaten_kemendagri' }, { data: 'nama_kecamatan_kemendagri' }
  ]
});
</script>
```

Buka demo langsung: `https://apisekolah.subuhkreatif.my.id/datatables-demo`
(masukkan API key Anda di kolom yang disediakan).

## Lisensi

Untuk keperluan internal/pembelajaran. Sesuaikan lisensi sesuai kebutuhan Anda.
