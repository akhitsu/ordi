# Shifts Index API

Endpoint ini dipakai aplikasi Flutter POS untuk melihat daftar shift atau riwayat rekap milik kasir login.

## Endpoint

- Method: `GET`
- URL: `/api/shifts`
- Header:
  - `Accept: application/json`
  - `Authorization: Bearer {access_token}`

## Query Parameter

- `status` opsional, `open` atau `closed`.
- `date_from` opsional, filter tanggal mulai shift.
- `date_to` opsional, filter tanggal mulai shift sampai tanggal tertentu.

## Response Sukses

Status: `200 OK`

```json
{
  "data": [
    {
      "recap_uuid": "6c2e6e4f-724f-4fd0-9b4a-8f4dd70a7605",
      "status": "closed",
      "opened_at": "2026-06-07T01:00:00.000000Z",
      "closed_at": "2026-06-07T08:30:00.000000Z",
      "outlet_count": 2,
      "transaction_count": 12,
      "total_sales": 530000
    }
  ]
}
```

## Aturan Validasi

- Hanya mengembalikan shift milik kasir login.
- Filter tanggal memakai `opened_at`.

## Response Error

Status: `422 Unprocessable Entity`

```json
{
  "message": "The status field must be one of open, closed.",
  "errors": {
    "status": [
      "The status field must be one of open, closed."
    ]
  }
}
```

## Catatan Flutter Offline-First

- Gunakan endpoint ini saat aplikasi start untuk memeriksa apakah masih ada shift `open`.
- Jika ditemukan shift `open`, gunakan `recap_uuid` tersebut sebagai konteks session aktif lokal.
