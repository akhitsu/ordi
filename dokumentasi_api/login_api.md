# Login API Kasir

Endpoint ini dipakai aplikasi Flutter POS untuk login user kasir dan mencatat perangkat yang berhasil login. Token API dibuat memakai Laravel Sanctum.

## Endpoint

- Method: `POST`
- URL: `/api/login`
- Header:
  - `Accept: application/json`
  - `Content-Type: application/json`

## Request Body

```json
{
  "email": "admin@ordi.test",
  "password": "password",
  "device_uuid": "9b8b7f0e-5b5a-4ad8-85de-b9f0c18d7c40",
  "device_name": "Samsung A15 Kasir 1",
  "platform": "android",
  "app_version": "1.0.0"
}
```

Field:

- `email` wajib, format email.
- `password` wajib.
- `device_uuid` wajib, UUID stabil yang dibuat dan disimpan oleh aplikasi Flutter untuk perangkat tersebut.
- `device_name` wajib, nama perangkat yang mudah dikenali admin.
- `platform` opsional, contoh `android` atau `ios`.
- `app_version` opsional, versi aplikasi mobile.

Fixture development:

- `admin@ordi.test` / `password` adalah tenant owner untuk `Ordi Demo Merchant`; gunakan ini untuk skenario normal POS/admin merchant.
- `platform@ordi.test` / `password` adalah akun system/platform internal dengan `business = null`; gunakan hanya untuk kebutuhan lintas tenant/development.

## Response Sukses

Status: `200 OK`

```json
{
  "token_type": "Bearer",
  "access_token": "1|plain-text-token-sanctum",
  "user": {
    "uuid": "7efb1d57-6f70-4e2d-a271-920c2e4e2a0f",
    "name": "Admin Ordi",
    "email": "admin@ordi.test",
    "role": "admin",
    "business": {
      "uuid": "46cf1f39-7bc3-4624-a2ab-1fdb22a0ad1d",
      "name": "Ordi Demo Merchant",
      "timezone": "Asia/Jakarta"
    }
  },
  "device": {
    "uuid": "9b8b7f0e-5b5a-4ad8-85de-b9f0c18d7c40",
    "name": "Samsung A15 Kasir 1",
    "platform": "android",
    "app_version": "1.0.0",
    "last_seen_at": "2026-06-05T10:00:00.000000Z"
  },
  "outlets": [
    {
      "uuid": "395b829b-bc64-4629-92f5-855b7c3cf521",
      "name": "Outlet Utama",
      "code": "MAIN",
      "role": null
    }
  ]
}
```

Aturan outlet:

- Akun system/platform internal dengan `business` bernilai `null` dapat menerima semua outlet aktif lintas tenant untuk maintenance/development.
- User tenant dengan role `admin` atau `owner` menerima outlet aktif pada merchant miliknya.
- Role selain `admin` dan `owner` menerima outlet aktif dari relasi `outlet_user`.
- Relasi tenant utama user tenant disimpan di `users.business_id`, sedangkan akses outlet operasional tetap berada di `outlet_user`.
- Role berasal dari master `roles` tetap seperti `owner`, `admin`, dan `cashier`; role bukan batas tenant.
- Jika tidak ada outlet aktif, login tetap sukses dan `outlets` berisi array kosong.

## Response Error

Status: `401 Unauthorized`

```json
{
  "message": "Email atau password tidak sesuai.",
  "errors": {
    "email": [
      "Email atau password tidak sesuai."
    ]
  }
}
```

Status: `403 Forbidden`

```json
{
  "message": "User tidak aktif."
}
```

```json
{
  "message": "Device tidak aktif."
}
```

Status: `422 Unprocessable Entity`

```json
{
  "message": "The device uuid field is required.",
  "errors": {
    "device_uuid": [
      "The device uuid field is required."
    ]
  }
}
```

## Catatan Flutter Offline-First

- Flutter harus membuat `device_uuid` sekali, lalu menyimpannya permanen di storage lokal perangkat.
- Simpan `access_token`, data `user`, data `device`, dan daftar `outlets` dari response login ke database/storage lokal.
- Kirim token pada request API berikutnya dengan header `Authorization: Bearer {access_token}`.
- Saat login ulang dari device yang sama, token Sanctum lama untuk device tersebut dicabut dan diganti token baru.
- Perangkat tidak menyimpan outlet tunggal di server. Outlet aktif transaksi dipilih di aplikasi mobile dari daftar `outlets`.
