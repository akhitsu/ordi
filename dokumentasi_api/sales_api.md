# Sales API

Endpoint ini dipakai aplikasi Flutter POS untuk mengirim transaksi dari kasir ke server.

## Endpoint

- Method: `POST`
- URL: `/api/sales`
- Header:
  - `Accept: application/json`
  - `Content-Type: application/json`
  - `Authorization: Bearer {access_token}`
  - `Idempotency-Key: {key}`

## Request Body

```json
{
  "uuid": "11111111-1111-4111-8111-111111111111",
  "checkout_group_uuid": "7044ecfa-adc3-4011-b520-c0ec503a10cf",
  "outlet_uuid": "395b829b-bc64-4629-92f5-855b7c3cf521",
  "transaction_type": "dine_in",
  "dining_table_uuid": "66a19f7f-835e-48b1-990e-fb1b4c3c6c18",
  "device_uuid": "33333333-3333-4333-8333-333333333333",
  "number": "SALE-LOCAL-001",
  "status": "completed",
  "subtotal": 36000,
  "discount_total": 0,
  "tax_total": 0,
  "service_total": 0,
  "grand_total": 36000,
  "sold_at": "2026-06-05T10:00:00+07:00",
  "items": [
    {
      "uuid": "22222222-2222-4222-8222-222222222222",
      "menu_item_uuid": "43c29b51-e40b-44d4-aae5-ff4d3bd7c4f0",
      "name": "Kopi Susu",
      "quantity": 2,
      "unit_price": 18000,
      "discount_total": 0,
      "line_total": 36000
    }
  ]
}
```

Field:

- `uuid` wajib, UUID transaksi dari aplikasi kasir.
- `checkout_group_uuid` opsional, dipakai untuk menghubungkan checkout gabungan multi-outlet.
- `outlet_uuid` wajib, outlet pemilik transaksi.
- `transaction_type` wajib, tipe transaksi pada level sale. Nilai awal: `dine_in` atau `take_away`.
- `dining_table_uuid` opsional, UUID meja untuk transaksi dine-in. Kosongkan atau kirim `null` untuk take-away/delivery.
- `device_uuid` wajib, perangkat yang mengirim transaksi.
- `number` opsional, nomor lokal dari aplikasi kasir.
- `status` opsional, saat ini hanya menerima `completed`.
- `subtotal`, `discount_total`, `tax_total`, `service_total`, dan `grand_total` wajib integer dalam rupiah.
- `sold_at` wajib, waktu transaksi lokal dalam format tanggal/waktu valid.
- `items` wajib, minimal satu item transaksi.
- `items.*.menu_item_uuid` opsional, UUID master menu jika item berasal dari menu server.
- `items.*.name`, `quantity`, `unit_price`, `discount_total`, dan `line_total` menjadi snapshot item transaksi.

## Response Sukses

Status: `201 Created`

```json
{
  "data": {
    "uuid": "11111111-1111-4111-8111-111111111111",
    "checkout_group_uuid": "7044ecfa-adc3-4011-b520-c0ec503a10cf",
    "number": "SALE-LOCAL-001",
    "transaction_type": "dine_in",
    "status": "completed",
    "subtotal": 36000,
    "discount_total": 0,
    "tax_total": 0,
    "service_total": 0,
    "grand_total": 36000,
    "sold_at": "2026-06-05T03:00:00.000000Z",
    "received_at": "2026-06-05T10:01:00.000000Z",
    "dining_table": {
      "uuid": "66a19f7f-835e-48b1-990e-fb1b4c3c6c18",
      "name": "Teras 1",
      "number": "1"
    },
    "outlet": {
      "uuid": "395b829b-bc64-4629-92f5-855b7c3cf521",
      "name": "Coffee Shop Ordi",
      "code": "COF"
    },
    "cashier": {
      "uuid": "7efb1d57-6f70-4e2d-a271-920c2e4e2a0f",
      "name": "Kasir Satu",
      "email": "kasir@example.test"
    },
    "items": [
      {
        "uuid": "22222222-2222-4222-8222-222222222222",
        "menu_item_uuid": "43c29b51-e40b-44d4-aae5-ff4d3bd7c4f0",
        "name": "Kopi Susu",
        "quantity": 2,
        "unit_price": 18000,
        "discount_total": 0,
        "line_total": 36000
      }
    ]
  }
}
```

## Aturan Awal

- Setiap transaksi memakai `uuid` dari aplikasi kasir.
- Request wajib idempotent agar pengiriman ulang tidak membuat transaksi dobel.
- Item transaksi dikirim bersama payload transaksi untuk tahap awal.
- Server memvalidasi outlet, user, device, meja jika dikirim, item menu, dan total transaksi.
- `transaction_type` diletakkan di level transaksi karena ia menjelaskan konteks layanan seluruh sale.
- Jika `transaction_type = dine_in`, aplikasi boleh mengirim `dining_table_uuid`.
- Jika `transaction_type = take_away`, `dining_table_uuid` harus dikosongkan.
- Jika `dining_table_uuid` dikirim, meja harus aktif dan berasal dari outlet transaksi yang sama.
- Response `dining_table` bernilai `null` jika transaksi tidak memakai meja.
- Transaksi hanya dibuat untuk satu outlet. Untuk checkout multi-outlet, aplikasi mengirim beberapa transaksi dengan `checkout_group_uuid` yang sama.
- `subtotal` harus sama dengan total `items.*.line_total`.
- `grand_total` harus sama dengan `subtotal - discount_total + tax_total + service_total`.

## Response Error

Status: `401 Unauthorized`

```json
{
  "message": "Unauthenticated."
}
```

Status: `403 Forbidden`

```json
{
  "message": "Outlet tidak dapat diakses."
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
  "message": "Outlet tidak ditemukan."
}
```

```json
{
  "message": "Device tidak ditemukan."
}
```

Status: `409 Conflict`

```json
{
  "message": "Idempotency key sudah digunakan untuk payload berbeda."
}
```

```json
{
  "message": "Transaksi dengan UUID ini sudah ada."
}
```

Status: `422 Unprocessable Entity`

```json
{
  "message": "The items field is required.",
  "errors": {
    "items": [
      "The items field is required."
    ]
  }
}
```

```json
{
  "message": "The transaction type field is required.",
  "errors": {
    "transaction_type": [
      "The transaction type field is required."
    ]
  }
}
```

```json
{
  "message": "Meja tidak ditemukan atau tidak dapat diakses pada outlet transaksi.",
  "errors": {
    "dining_table_uuid": [
      "Meja tidak ditemukan atau tidak dapat diakses pada outlet transaksi."
    ]
  }
}
```

## Catatan Flutter Offline-First

- Buat `uuid` transaksi dan `uuid` item sebelum transaksi disimpan lokal.
- Kirim `Idempotency-Key` yang stabil untuk transaksi yang sama.
- Jika request timeout, kirim ulang payload yang sama dengan idempotency key yang sama.
- Jangan memakai idempotency key yang sama untuk payload berbeda.
- Simpan `transaction_type` di data transaksi lokal agar alur dine-in dan take-away konsisten saat offline maupun setelah retry sync.
- Untuk transaksi dine-in, simpan `dining_table_uuid` dari `GET /api/dining-tables` bersama transaksi lokal sebelum sync.
- Untuk transaksi take-away/delivery, simpan nilai meja sebagai `null`.
- Untuk checkout berisi item dari beberapa outlet, pecah menjadi beberapa request `POST /api/sales` dan gunakan `checkout_group_uuid` yang sama.
