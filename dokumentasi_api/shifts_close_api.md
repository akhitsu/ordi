# Shifts Close API

Endpoint ini dipakai aplikasi Flutter POS untuk menutup shift kasir dan membentuk rekap final multi-outlet.

## Endpoint

- Method: `POST`
- URL: `/api/shifts/{cashierRecapUuid}/close`
- Header:
  - `Accept: application/json`
  - `Content-Type: application/json`
  - `Authorization: Bearer {access_token}`

## Request Body

```json
{
  "closed_at": "2026-06-07T15:30:00+07:00",
  "notes": "Tutup shift sore"
}
```

Field:

- `closed_at` wajib, waktu tutup shift.
- `notes` opsional, catatan penutup shift.

## Response Sukses

Status: `200 OK`

```json
{
  "data": {
    "recap_uuid": "6c2e6e4f-724f-4fd0-9b4a-8f4dd70a7605",
    "status": "closed",
    "opened_at": "2026-06-07T01:00:00.000000Z",
    "closed_at": "2026-06-07T08:30:00.000000Z",
    "cashier": {
      "uuid": "7efb1d57-6f70-4e2d-a271-920c2e4e2a0f",
      "name": "Kasir Satu",
      "email": "kasir@example.test"
    },
    "device": {
      "uuid": "33333333-3333-4333-8333-333333333333",
      "name": "POS Front"
    },
    "summary": {
      "transaction_count": 12,
      "gross_sales_total": 540000,
      "discount_total": 10000,
      "tax_total": 0,
      "service_total": 0,
      "net_sales_total": 530000,
      "outlets": []
    }
  }
}
```

## Aturan Validasi

- Shift harus milik kasir login.
- Shift harus masih berstatus `open`.
- `closed_at` tidak boleh lebih awal dari `opened_at`.
- Saat close shift, server:
  - mengambil `sales` kasir yang cocok dengan outlet-outlet shift,
  - hanya mengambil `sales` yang belum punya `cashier_recap_id`,
  - membatasi transaksi pada rentang `sold_at` antara `sold_from` dan `sold_until`,
  - mengaitkan transaksi ke rekap,
  - menghitung ulang total rekap,
  - mengubah status menjadi `closed`.

## Response Error

Status: `403 Forbidden`

```json
{
  "message": "Shift tidak dapat diakses."
}
```

Status: `409 Conflict`

```json
{
  "message": "Shift sudah ditutup."
}
```

Status: `422 Unprocessable Entity`

```json
{
  "message": "Waktu tutup shift tidak boleh lebih awal dari waktu buka.",
  "errors": {
    "closed_at": [
      "Waktu tutup shift tidak boleh lebih awal dari waktu buka."
    ]
  }
}
```

## Catatan Flutter Offline-First

- Tahan pengiriman transaksi baru setelah kasir menekan tutup shift sampai response close shift selesai diterima.
- Simpan response close shift sebagai snapshot hasil rekap lokal agar kasir tetap bisa melihat ringkasan saat offline sesudah close berhasil.
