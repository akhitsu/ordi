# Shifts Show API

Endpoint ini dipakai aplikasi Flutter POS untuk melihat detail satu rekap shift kasir beserta breakdown per outlet.

## Endpoint

- Method: `GET`
- URL: `/api/shifts/{cashierRecapUuid}`
- Header:
  - `Accept: application/json`
  - `Authorization: Bearer {access_token}`

## Response Sukses

Status: `200 OK`

```json
{
  "data": {
    "recap_uuid": "6c2e6e4f-724f-4fd0-9b4a-8f4dd70a7605",
    "status": "closed",
    "opened_at": "2026-06-07T01:00:00.000000Z",
    "closed_at": "2026-06-07T08:30:00.000000Z",
    "sold_from": "2026-06-07T01:00:00.000000Z",
    "sold_until": "2026-06-07T08:30:00.000000Z",
    "cashier": {
      "uuid": "7efb1d57-6f70-4e2d-a271-920c2e4e2a0f",
      "name": "Kasir Satu",
      "email": "kasir@example.test"
    },
    "device": {
      "uuid": "33333333-3333-4333-8333-333333333333",
      "name": "POS Front"
    },
    "outlets": [
      {
        "uuid": "7ce43f28-555f-4fba-8f29-9c7a71bc0c55",
        "name": "Warung Nasi Ordi",
        "code": "NASI"
      }
    ],
    "summary": {
      "transaction_count": 12,
      "gross_sales_total": 540000,
      "discount_total": 10000,
      "tax_total": 0,
      "service_total": 0,
      "net_sales_total": 530000,
      "outlets": [
        {
          "outlet": {
            "uuid": "7ce43f28-555f-4fba-8f29-9c7a71bc0c55",
            "name": "Warung Nasi Ordi",
            "code": "NASI"
          },
          "transaction_count": 7,
          "gross_sales_total": 320000,
          "discount_total": 5000,
          "tax_total": 0,
          "service_total": 0,
          "net_sales_total": 315000,
          "item_quantity_total": 18,
          "items": [],
          "payment_methods": []
        }
      ]
    }
  }
}
```

## Aturan Validasi

- Shift harus milik kasir login.
- Breakdown detail dihitung per outlet berdasarkan `sales`, `sale_items`, dan `payments` yang sudah terikat ke `cashier_recap_id`.
- Item menu dikelompokkan minimal berdasarkan nama item dan harga historis `unit_price`.
- Ringkasan metode pembayaran dikelompokkan per outlet dan metode pembayaran.

## Response Error

Status: `403 Forbidden`

```json
{
  "message": "Shift tidak dapat diakses."
}
```

## Catatan Flutter Offline-First

- Endpoint ini cocok dipakai untuk membuka ulang hasil rekap yang sudah ditutup tanpa harus menghitung ulang di sisi mobile.
- Simpan response detail terakhir di cache lokal jika user sering membuka histori rekap.
