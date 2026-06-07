# Shifts Open API

Endpoint ini dipakai aplikasi Flutter POS untuk membuka shift kasir sebelum transaksi dikirim ke server.

## Endpoint

- Method: `POST`
- URL: `/api/shifts/open`
- Header:
  - `Accept: application/json`
  - `Content-Type: application/json`
  - `Authorization: Bearer {access_token}`

## Request Body

```json
{
  "device_uuid": "33333333-3333-4333-8333-333333333333",
  "opened_at": "2026-06-07T08:00:00+07:00",
  "outlet_uuids": [
    "395b829b-bc64-4629-92f5-855b7c3cf521",
    "7ce43f28-555f-4fba-8f29-9c7a71bc0c55"
  ],
  "notes": "Shift pagi kasir utama"
}
```

Field:

- `device_uuid` wajib, UUID device aktif yang dipakai kasir.
- `opened_at` wajib, waktu mulai shift.
- `outlet_uuids` opsional, daftar outlet yang ingin dicakup shift. Jika kosong, server memakai seluruh outlet aktif milik kasir dari `outlet_user`.
- `notes` opsional, catatan internal shift.

## Response Sukses

Status: `201 Created`

```json
{
  "data": {
    "recap_uuid": "6c2e6e4f-724f-4fd0-9b4a-8f4dd70a7605",
    "status": "open",
    "opened_at": "2026-06-07T01:00:00.000000Z",
    "outlets": [
      {
        "uuid": "7ce43f28-555f-4fba-8f29-9c7a71bc0c55",
        "name": "Warung Nasi Ordi",
        "code": "NASI"
      },
      {
        "uuid": "395b829b-bc64-4629-92f5-855b7c3cf521",
        "name": "Coffee Shop Ordi",
        "code": "COF"
      }
    ]
  }
}
```

## Aturan Validasi

- User harus aktif.
- Device harus aktif dan boleh dipakai user login.
- Kasir hanya boleh memiliki satu shift `open`.
- Semua `outlet_uuids` harus berasal dari outlet aktif yang bisa diakses kasir.
- Semua outlet dalam satu shift harus berasal dari merchant yang sama.

## Response Error

Status: `403 Forbidden`

```json
{
  "message": "User tidak aktif."
}
```

```json
{
  "message": "Device tidak dapat digunakan user ini."
}
```

Status: `404 Not Found`

```json
{
  "message": "Device tidak ditemukan."
}
```

Status: `409 Conflict`

```json
{
  "message": "Kasir masih memiliki shift yang belum direkap."
}
```

Status: `422 Unprocessable Entity`

```json
{
  "message": "The outlet uuids field is invalid.",
  "errors": {
    "outlet_uuids": [
      "Satu atau lebih outlet tidak dapat diakses."
    ]
  }
}
```

## Catatan Flutter Offline-First

- Simpan `recap_uuid` session shift aktif di storage lokal device.
- Gunakan satu shift aktif sebagai konteks seluruh transaksi lokal sampai kasir menjalankan close shift.
- Jika aplikasi restart, tarik `GET /api/shifts` untuk memastikan session aktif masih sama sebelum mengirim transaksi baru.
