# Roadmap API Kasir POS

## Ringkasan

API tahap awal difokuskan untuk aplikasi kasir Flutter POS. Web admin tetap memakai Laravel Blade dan session auth sebagai backoffice untuk mengelola master data, sedangkan API dipakai kasir untuk login, pull master data, push transaksi, dan sync offline-first.

Dokumen ini menjadi aturan global API. Detail setiap endpoint dibuat sebagai dokumen terpisah di folder `dokumentasi_api`.

## Prinsip Endpoint

- Semua endpoint berada di prefix `/api`.
- Endpoint API tidak memakai segmen atau kata `mobile` pada path.
- Konteks aplikasi POS Flutter ditentukan dari token, device, role, dan payload request.
- Nama endpoint memakai resource bisnis yang stabil, misalnya `POST /api/login`, `GET /api/payment-methods`, dan `POST /api/sales`.
- API publik memakai `uuid` untuk relasi dan referensi data. ID internal database tidak dikirim sebagai kontrak API.
- Endpoint pull master data memakai method `GET`.
- Endpoint push data dari kasir memakai method `POST`.
- Business atau merchant adalah tenant boundary. Owner/admin tenant hanya dapat menerima data merchant miliknya, sedangkan akun system/platform internal dapat lintas tenant untuk maintenance/development.

## Auth dan Device

- Auth API memakai Bearer token dari Laravel Sanctum.
- Token login dibuat untuk pasangan user dan device.
- Request setelah login mengirim header `Authorization: Bearer {access_token}`.
- Device dikenali dari `device_uuid` yang dibuat sekali oleh aplikasi Flutter dan disimpan permanen di storage lokal.
- Server dapat menolak user tidak aktif atau device tidak aktif dengan status `403 Forbidden`.
- Saat login ulang dari device yang sama, token lama untuk device tersebut dicabut dan diganti token baru.
- Konteks tenant user tenant diambil dari `users.business_id`.
- Akses operasional per outlet diambil dari relasi `outlet_user`, terutama untuk role selain owner/admin tenant.
- Fixture development utama adalah `admin@ordi.test` / `password` sebagai owner tenant `Ordi Demo Merchant`.
- Fixture `platform@ordi.test` / `password` adalah akun system/platform internal dengan `business_id = null` dan hanya dipakai untuk kebutuhan lintas tenant/development.
- Role API berasal dari master `roles` tetap seperti `owner`, `admin`, dan `cashier`; tenant scoping tetap memakai `users.business_id`, `outlets.business_id`, dan `outlet_user`.

## Standar Response

Response sukses untuk collection memakai bentuk:

```json
{
  "data": []
}
```

Response sukses untuk aksi yang menghasilkan data tunggal dapat memakai bentuk:

```json
{
  "data": {}
}
```

Response error memakai bentuk:

```json
{
  "message": "Pesan error.",
  "errors": {}
}
```

Catatan:

- `message` dipakai untuk pesan utama.
- `errors` dipakai untuk detail validasi field.
- Metadata sync seperti `revision`, `updated_at`, `sync_status`, atau `server_received_at` boleh ditambahkan jika endpoint membutuhkan informasi offline-first.
- Format waktu memakai ISO 8601.

## Standar Error

- `401 Unauthorized`: token tidak ada, token tidak valid, atau kredensial login salah.
- `403 Forbidden`: user, device, outlet, atau akses tidak aktif/ditolak.
- `404 Not Found`: resource tidak ditemukan atau tidak dapat diakses user.
- `409 Conflict`: konflik sync, duplikasi idempotency key dengan payload berbeda, atau konflik revision.
- `422 Unprocessable Entity`: validasi request gagal.
- `500 Internal Server Error`: error server yang tidak terduga.

## Offline-First

- Data penting yang dibuat atau disync oleh kasir wajib memiliki `uuid`.
- Data sync memakai `revision` atau `version` untuk mendeteksi perubahan.
- Data dari kasir menyimpan sumber device jika relevan.
- Push transaksi dan pembayaran wajib idempotent agar request ulang tidak membuat data dobel.
- Request push transaksi memakai idempotency key.
- Server menjadi sumber kebenaran untuk master data.
- Konflik master data diselesaikan dengan menarik data terbaru dari server.

## Prioritas Implementasi

### Fase 1: Auth dan Bootstrap Kasir

- `POST /api/login` untuk login user dan register/update device.
- `POST /api/owners/register` untuk onboarding owner baru beserta merchant dan outlet pertama.

Dokumen endpoint:

- `login_api.md`
- `owner_register_api.md`

### Fase 2: Pull Master Data

- `GET /api/outlets` untuk daftar outlet yang dapat diakses user/device.
- `GET /api/menu-categories` untuk kategori menu.
- `GET /api/menu-items` untuk menu dan harga.
- `GET /api/payment-methods` untuk metode pembayaran aktif.

Dokumen endpoint:

- `outlets_api.md`
- `menu_categories_api.md`
- `menu_items_api.md`
- `payment_methods_api.md`

### Fase 3: Push Transaksi

- `POST /api/sales` untuk push transaksi.
- `POST /api/payments` untuk push pembayaran.
- Item transaksi dikirim bersama payload transaksi, kecuali nanti diputuskan perlu endpoint terpisah.

Dokumen endpoint:

- `sales_api.md`
- `payments_api.md`

### Fase 4: Sync Support

- `GET /api/sync/status` untuk cek status sync.
- Mekanisme sync mencakup idempotency, revision, dan conflict handling.

Dokumen endpoint:

- `sync_status_api.md`

### Fase 5: Void dan Refund

- Endpoint void/refund dibuat setelah alur detail transaksi dan otorisasi void/refund dirancang.

## Catatan Implementasi Saat Ini

- Dokumentasi menetapkan endpoint login sebagai `POST /api/login`.
- Route Laravel login API yang sudah ada perlu diselaraskan ke dokumentasi ini pada tahap implementasi endpoint.
- API admin JSON belum diprioritaskan karena admin masih memakai Blade dan session auth.
- Endpoint register owner adalah API onboarding tenant, bukan API admin JSON umum.
- Register owner membuat relasi langsung `businesses -> users.business_id`, outlet pertama dengan `outlets.business_id`, dan akses owner pada `outlet_user`.
- Contoh data API memakai merchant `Ordi Demo Merchant` dengan outlet demo `Outlet Utama`, `Warung Nasi Ordi`, dan `Coffee Shop Ordi`.
