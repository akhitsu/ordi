# Roadmad Mobile Ordi POS

## Summary

- Project mobile dibangun sebagai Flutter POS offline-first untuk handphone dan tablet/pad.
- Stack utama: Flutter, Drift SQLite, Riverpod, dan Dio.
- MVP pertama mencakup login, pull master data, transaksi sales/payment offline, dan sync saat online.
- Backend API mengikuti kontrak di folder `dokumentasi_api/`, termasuk tenant boundary `business/merchant`.

## Architecture

- `core`: konfigurasi aplikasi, theme, responsive helper, dan utility error/result.
- `data`: Drift database, Dio API client, DTO/model mapper, dan repository.
- `features`: auth, owner registration, master data, outlet selection, menu catalog, cart/checkout, payment, cashier recap, dan sync UI.
- `sync`: antrean transaksi pending, retry, status `pending/synced/failed`, dan sync metadata.
- `tenant`: konteks merchant aktif dari `user.business` saat login dan fallback nullable untuk platform admin global.

## Technology Decisions

- Drift SQLite menjadi local database utama karena domain POS bersifat relasional dan butuh query laporan/sync yang jelas.
- Riverpod menjadi dependency injection dan state management utama.
- Dio menjadi HTTP client utama dengan interceptor header JSON, Bearer token, error mapping, dan `Idempotency-Key`.
- Default `API_BASE_URL` adalah `https://ordi.web.id/api`, dan bisa dioverride lewat `--dart-define=API_BASE_URL=...` untuk staging atau local development.
- UI dibuat responsif dari awal: phone memakai layout single-column, tablet memakai layout split menu/cart.
- Multi-owner/multi-tenant mengikuti backend: user tenant dibatasi oleh `users.business_id`, sedangkan platform admin global dapat memiliki `business = null`.

## UI Standards

- Setiap halaman wajib memakai struktur Flutter standar: `Scaffold`, `appBar` jika ada header halaman, `body`, dan `bottomNavigationBar` hanya untuk halaman yang memang memakai navigasi bawah.
- Setiap `body` halaman wajib dilindungi `SafeArea`. Jika halaman memakai `AppBar`, gunakan `SafeArea(top: false, ...)` pada body agar area atas tidak dobel.
- Komponen yang fixed di bawah layar wajib mempertimbangkan safe area bawah, baik melalui `SafeArea` langsung atau dengan ditempatkan di area Scaffold yang sesuai.
- Jangan membuat header/app bar custom sebagai widget terpisah jika `AppBar` standar sudah cukup. Custom widget hanya dibuat untuk bagian yang benar-benar reusable atau kompleks.
- Pecah widget seperlunya: list item, card berulang, filter berulang, dan action bar boleh dipisah; layout halaman utama tetap mudah dibaca di file page.
- Ukuran UI mengikuti proporsi mobile standar dan desain referensi. Hindari memperbesar padding, tinggi card, icon, atau font tanpa alasan desain yang jelas.

## Roadmap Phases

### Phase 0: Project Foundation

- Tambah dependency Drift, Riverpod, Dio, connectivity, secure storage, UUID, dan path provider.
- Hindari `device_info_plus` sementara karena plugin tersebut masih memicu peringatan Kotlin Gradle Plugin pada build Android.
- Rapikan struktur folder awal.
- Hapus counter template Flutter.
- Buat theme dasar dan responsive shell untuk phone/tablet.

### Phase 1: Auth and Bootstrap

- Generate `device_uuid` sekali dan simpan permanen.
- Login ke `POST /api/login` via Dio.
- Simpan token, user, business, device, dan outlets ke local database/storage.
- Item login yang disimpan lokal:
  - `access_token` dan `token_type` untuk Bearer auth.
  - `user.uuid`, `user.name`, `user.email`, `user.role`, dan `user.business`.
  - `business.uuid`, `business.name`, dan `business.timezone` jika user tenant memiliki business.
  - `device.uuid`, `device.name`, `device.platform`, `device.app_version`, dan `device.last_seen_at`.
  - daftar `outlets` yang dikirim server, termasuk `uuid`, `name`, `code`, dan `role`.
  - `device_uuid` permanen dari aplikasi, disimpan terpisah agar stabil lintas login ulang.
- Pilih outlet aktif dari daftar outlet yang tersedia.
- Untuk tenant owner/admin, business aktif berasal dari response `user.business`.
- Untuk platform admin global, business boleh `null`; outlet/master data harus tetap difilter berdasarkan outlet yang server kirim.

### Phase 2: Master Data Offline

- Pull data dari `GET /api/outlets`, `GET /api/menu-categories`, `GET /api/menu-items`, `GET /api/payment-methods`, dan `GET /api/dining-tables`.
- `GET /api/outlets` dipakai sebagai sumber master outlet final; outlet dari login tetap dipakai untuk bootstrap awal.
- Outlet sync mendukung `business_uuid`, `updated_after`, dan `include_inactive`; incremental sync tidak menghapus outlet lokal yang tidak ikut dalam response parsial.
- Simpan master data lokal berdasarkan `uuid`, `revision`, dan `updated_at`.
- Simpan `business_uuid` lokal jika tersedia atau dapat diturunkan dari session tenant aktif.
- Tampilkan katalog menu dari Drift agar tetap berjalan saat offline.

### Phase 3: POS Sales Offline-First

- Cart lokal mengikuti outlet aktif.
- Saat checkout, buat `sale.uuid`, `sale_item.uuid`, `payment.uuid`, dan `idempotency_key`.
- Simpan transaksi lokal dulu dengan status `pending`.
- Payment mendukung satu pembayaran atau split payment, satu request untuk satu baris payment.
- Simpan `business_uuid` transaksi jika session tenant aktif memilikinya.
- Tampilkan status transaksi `pending`, `synced`, atau `failed`.

### Phase 4: Sync Sales

- Jalankan sync saat koneksi kembali, app resume, atau user menekan tombol sync manual.
- Retry transaksi dan payment memakai payload dan `Idempotency-Key` yang sama.
- Tandai transaksi `synced` saat server menerima data.
- Tandai transaksi `failed` dan simpan pesan error saat validasi/server menolak.

### Phase 5: Polish and Next Backend Contracts

- Tambah onboarding owner dengan `POST /api/owners/register` setelah UI register tenant diprioritaskan.
- Sambungkan service payment ke UI checkout setelah desain alur pembayaran final.
- Tambah laporan lokal sederhana.
- Tambah void/refund setelah API tersedia.
- Perkuat conflict handling berdasarkan revisi master data.

## API Scope

- `POST /api/login`
- `POST /api/owners/register`
- `GET /api/outlets`
- `GET /api/dining-tables`
- `GET /api/menu-categories`
- `GET /api/menu-items`
- `GET /api/payment-methods`
- `POST /api/shifts/open`
- `POST /api/shifts/{cashierRecapUuid}/close`
- `GET /api/shifts`
- `GET /api/shifts/{cashierRecapUuid}`
- `POST /api/sales`
- `POST /api/payments`
- `GET /api/sync/status`

## Test Plan

- Unit test Dio API client dan error mapper.
- Unit test mapper DTO API ke entity lokal.
- Unit test repository login, pull master data, dan insert/update by `uuid`.
- Unit test cart total: subtotal, discount, tax/service placeholder, grand total.
- Unit test sales dan payment payload idempotent: retry data yang sama menghasilkan payload dan key sama.
- Widget test layout phone dan tablet untuk catalog/cart.
- Integration test awal: login fake API, pull master data, buat sale offline, sync sukses.

## Current Progress

- Phase 0 foundation sudah berjalan.
- Dependency utama sudah dideklarasikan di `pubspec.yaml`.
- Struktur foundation awal dibuat untuk core config, theme, responsive shell, Dio provider, dan Drift schema.
- Auth login sudah memakai `POST /api/login`, menyimpan token, user, business, device, dan outlet dari response login ke Drift.
- Outlet service sudah tersedia untuk `GET /api/outlets` dengan sinkronisasi master outlet dan business ke Drift.
- Cashier recap service sudah tersedia untuk `POST /api/shifts/open`, `POST /api/shifts/{cashierRecapUuid}/close`, `GET /api/shifts`, dan `GET /api/shifts/{cashierRecapUuid}`.
- Halaman kasir sudah punya layar `Kasir`, `Rekap Kasir`, `Riwayat Rekap`, dan `Cetak Ulang Rekap` dengan widget terpisah, compact, dan reusable.
- Master data service sudah tersedia untuk menu categories, menu items, payment methods, dan dining tables, termasuk penyimpanan ke Drift.
- Menu categories dan menu items sudah tersimpan di tabel lokal `menu_categories` dan `menu_items`, dan layar transaksi memakai cache lokal sebagai fallback saat offline.
- Sales service sudah tersedia untuk `POST /api/sales`.
- Payment service sudah tersedia untuk `POST /api/payments` sesuai kontrak final split payment dan idempotency.
- Sync status service sudah tersedia untuk `GET /api/sync/status`.
- Owner registration service sudah tersedia untuk `POST /api/owners/register`.
- UI katalog, checkout payment, dan sync worker masih tahap berikutnya.

## Assumptions

- Payment push masuk MVP karena `payments_api.md` sudah final.
- Server tetap menjadi sumber kebenaran master data.
- Business/merchant adalah batas tenant utama; local database menyimpan `business_uuid` nullable untuk mendukung tenant user dan platform admin global.
- Jika API master data belum mengirim business per row, aplikasi menurunkan business dari session tenant aktif dan tetap mempercayai filter akses dari server.
- Outlet lokal menyimpan `address`, `phone`, `is_active`, `revision`, dan `updated_at` sesuai shape baru `GET /api/outlets`.
- Data transaksi dari kasir wajib disimpan lokal sebelum push ke server.
- Idempotency key untuk transaksi/payment yang sama tidak boleh berubah saat retry.
