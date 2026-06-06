# Outlets API

Endpoint ini direncanakan untuk aplikasi Flutter POS agar dapat mengambil daftar outlet yang dapat diakses user/device.

## Endpoint

- Method: `GET`
- URL: `/api/outlets`
- Header:
  - `Accept: application/json`
  - `Authorization: Bearer {access_token}`

## Status

Belum diimplementasikan. Detail request, response, filter, dan aturan sync akan ditulis saat endpoint mulai dikerjakan.

## Aturan Awal

- API hanya mengirim outlet aktif yang dapat diakses user.
- Akun system/platform internal tanpa business tenant dapat menerima semua outlet aktif lintas tenant untuk maintenance/development.
- User tenant dengan role `admin` atau `owner` menerima outlet aktif pada merchant miliknya.
- Role lain menerima outlet aktif berdasarkan relasi akses outlet `outlet_user`.
- Relasi tenant owner/admin berasal dari `users.business_id`, bukan dari pilihan business di payload outlet.
- Outlet selalu memiliki `business_id` karena outlet adalah bagian dari satu merchant/tenant.
- Role akses outlet memakai master role umum; batas tenant tetap divalidasi dari user dan outlet.
- Response memakai `uuid`, bukan id internal.
