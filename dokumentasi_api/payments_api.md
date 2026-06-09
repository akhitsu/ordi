# Payments API

Endpoint ini dipakai aplikasi Flutter POS untuk mengirim pembayaran transaksi ke server.

## Endpoint

- Method: `POST`
- URL: `/api/payments`
- Header:
  - `Accept: application/json`
  - `Content-Type: application/json`
  - `Authorization: Bearer {access_token}`
  - `Idempotency-Key: {key}`

## Request Body Final

Endpoint menerima satu baris pembayaran per request.

```json
{
  "uuid": "44444444-4444-4444-8444-444444444444",
  "sale_uuid": "11111111-1111-4111-8111-111111111111",
  "device_uuid": "33333333-3333-4333-8333-333333333333",
  "payment_method_uuid": "4d3ce339-e6e4-4ce8-b4c1-80fb4fb559bb",
  "payment_method_code": "CASH",
  "amount": 36000,
  "paid_at": "2026-06-05T10:05:00+07:00",
  "reference_no": null,
  "change_amount": 4000,
  "notes": "Tunai 2 lembar 20 ribu"
}
```

Field:

- `uuid` wajib, UUID pembayaran dari aplikasi kasir.
- `sale_uuid` wajib, UUID transaksi yang dibayar. Payment terkait langsung ke `sales.uuid`.
- `device_uuid` wajib, perangkat yang mengirim pembayaran.
- `payment_method_uuid` wajib, UUID master metode pembayaran dari `GET /api/payment-methods`.
- `payment_method_code` wajib, snapshot kode metode pembayaran saat transaksi terjadi, contoh `CASH`, `QRIS`, `TRANSFER`, `DEBIT`.
- `amount` wajib, integer rupiah, nominal yang masuk ke rekap pembayaran. Untuk pembayaran tunai, isi sebesar nilai yang menutup transaksi, bukan uang diterima termasuk kembalian.
- `paid_at` wajib, waktu pembayaran lokal dalam format tanggal/waktu valid.
- `reference_no` opsional, nomor referensi dari QRIS, transfer, kartu, atau payment gateway. Disimpan ke kolom `payments.reference`.
- `change_amount` opsional, integer rupiah, hanya informasi kembalian untuk tampilan/struk. Saat ini tidak disimpan permanen karena belum ada kolom khusus.
- `notes` opsional, catatan kasir. Saat ini tidak disimpan permanen karena belum ada kolom khusus.

## Response Sukses Final

Status: `201 Created`

```json
{
  "data": {
    "uuid": "44444444-4444-4444-8444-444444444444",
    "sale_uuid": "11111111-1111-4111-8111-111111111111",
    "amount": 36000,
    "reference_no": null,
    "status": "paid",
    "paid_at": "2026-06-05T03:05:00.000000Z",
    "payment_method": {
      "uuid": "4d3ce339-e6e4-4ce8-b4c1-80fb4fb559bb",
      "name": "Cash",
      "code": "CASH"
    },
    "sale_payment_summary": {
      "grand_total": 36000,
      "paid_total": 36000,
      "remaining_amount": 0,
      "change_amount": 4000,
      "status": "paid"
    }
  }
}
```

## Relasi Payment

- `payment` terkait langsung ke `sale_uuid`.
- Di database, relasi server adalah `payments.sale_id -> sales.id`.
- `sale_uuid` dipakai Flutter supaya tidak perlu mengetahui internal ID server.
- Payment tidak menerima `outlet_uuid` langsung.
- Outlet pembayaran mengikuti outlet transaksi pada `sale_uuid`.
- Server mengelompokkan pembayaran berdasarkan `payments.sale_id -> sales.outlet_id`.
- Payment juga menyimpan `device_id` dan `payment_method_id` jika ditemukan.

## Split Payment

Split payment didukung.

Aturan split:

- Satu request `POST /api/payments` membuat satu baris pembayaran.
- Untuk split payment, Flutter mengirim beberapa request dengan `sale_uuid` yang sama dan `uuid` payment berbeda.
- Semua pembayaran split untuk satu sale otomatis masuk ke outlet yang sama dengan sale tersebut.
- Setiap request split payment wajib memakai `Idempotency-Key` berbeda dan stabil untuk payment tersebut.
- Server menghitung status lunas dari total pembayaran aktif pada sale yang sama.
- Total pembayaran boleh kurang dari `grand_total`; response akan mengembalikan status `partial`.
- Total pembayaran tidak boleh melebihi `grand_total`. Untuk metode tunai, kirim nominal yang masuk ke pembayaran pada `amount` dan kirim kembalian pada `change_amount`.

Contoh split:

```json
{
  "uuid": "55555555-5555-4555-8555-555555555555",
  "sale_uuid": "11111111-1111-4111-8111-111111111111",
  "device_uuid": "33333333-3333-4333-8333-333333333333",
  "payment_method_uuid": "9b7d7160-9968-4143-baf6-31f0a48f6ed9",
  "payment_method_code": "QRIS",
  "amount": 20000,
  "paid_at": "2026-06-05T10:04:00+07:00",
  "reference_no": "QRIS-ORDI-0001"
}
```

```json
{
  "uuid": "66666666-6666-4666-8666-666666666666",
  "sale_uuid": "11111111-1111-4111-8111-111111111111",
  "device_uuid": "33333333-3333-4333-8333-333333333333",
  "payment_method_uuid": "4d3ce339-e6e4-4ce8-b4c1-80fb4fb559bb",
  "payment_method_code": "CASH",
  "amount": 16000,
  "paid_at": "2026-06-05T10:05:00+07:00"
}
```

## Snapshot Field yang Wajib Disimpan

Server wajib menyimpan:

- `payment_method_id`, hasil lookup dari `payment_method_uuid`.
- `method`, snapshot `payment_method_code` dalam uppercase.
- `amount`.
- `paid_at`.
- `reference`, dari `reference_no` jika ada.

Minimal yang wajib dikirim Flutter untuk snapshot metode adalah:

- `payment_method_uuid`
- `payment_method_code`

Jika `payment_method_code` berbeda dari kode master payment method di server, server memakai kode master sebagai nilai final `method` dan mengembalikannya di response.

## Status Pembayaran

Status baris `payment`:

- `paid`: pembayaran berhasil tercatat.

Status ringkasan pembayaran sale pada response:

- `unpaid`: belum ada pembayaran untuk sale.
- `partial`: total pembayaran lebih kecil dari `grand_total`.
- `paid`: total pembayaran sama dengan `grand_total`.
- `overpaid`: status defensif jika total pembayaran lama di database sudah lebih besar dari `grand_total`. Request baru sebaiknya tidak membuat kondisi ini.

Catatan:

- `sales.status` tetap mengikuti status transaksi dari `POST /api/sales`, saat ini `completed`.
- Status parsial/lunas tidak disimpan ke `sales.status`; untuk saat ini dihitung dari total `payments.amount` terhadap `sales.grand_total`.

## Idempotency

Endpoint ini wajib idempotent dengan header `Idempotency-Key`.

Aturan:

- `Idempotency-Key` wajib.
- Retry untuk payment yang sama harus mengirim payload yang sama dan key yang sama.
- Jika key yang sama dikirim dengan payload berbeda, server mengembalikan `409 Conflict`.
- Jika key yang sama dikirim dengan payload sama, server mengembalikan response sukses yang tersimpan tanpa membuat payment dobel.
- Masa simpan idempotency key mengikuti pola `POST /api/sales`, yaitu 7 hari.

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
  "message": "User tidak aktif."
}
```

```json
{
  "message": "Outlet transaksi tidak dapat diakses."
}
```

```json
{
  "message": "Device tidak dapat digunakan user ini."
}
```

```json
{
  "message": "Kasir harus membuka shift aktif untuk outlet transaksi sebelum mengirim pembayaran."
}
```

Status: `404 Not Found`

```json
{
  "message": "Transaksi tidak ditemukan."
}
```

```json
{
  "message": "Device tidak ditemukan."
}
```

```json
{
  "message": "Metode pembayaran tidak ditemukan."
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
  "message": "Pembayaran dengan UUID ini sudah ada."
}
```

Status: `422 Unprocessable Entity`

```json
{
  "message": "Idempotency-Key header wajib.",
  "errors": {
    "Idempotency-Key": [
      "Idempotency-Key header wajib."
    ]
  }
}
```

```json
{
  "message": "The amount field is required.",
  "errors": {
    "amount": [
      "The amount field is required."
    ]
  }
}
```

```json
{
  "message": "Nominal pembayaran harus lebih besar dari 0.",
  "errors": {
    "amount": [
      "Nominal pembayaran harus lebih besar dari 0."
    ]
  }
}
```

```json
{
  "message": "Nominal pembayaran melebihi sisa tagihan.",
  "errors": {
    "amount": [
      "Nominal pembayaran melebihi sisa tagihan."
    ]
  }
}
```

```json
{
  "message": "Metode pembayaran tidak aktif.",
  "errors": {
    "payment_method_uuid": [
      "Metode pembayaran tidak aktif."
    ]
  }
}
```

## Contoh Request dan Response Nyata

Request:

```http
POST /api/payments
Accept: application/json
Content-Type: application/json
Authorization: Bearer 1|token
Idempotency-Key: payment-44444444-4444-4444-8444-444444444444
```

```json
{
  "uuid": "44444444-4444-4444-8444-444444444444",
  "sale_uuid": "11111111-1111-4111-8111-111111111111",
  "device_uuid": "33333333-3333-4333-8333-333333333333",
  "payment_method_uuid": "4d3ce339-e6e4-4ce8-b4c1-80fb4fb559bb",
  "payment_method_code": "CASH",
  "amount": 36000,
  "paid_at": "2026-06-05T10:05:00+07:00",
  "reference_no": null,
  "change_amount": 0,
  "notes": null
}
```

Response:

```json
{
  "data": {
    "uuid": "44444444-4444-4444-8444-444444444444",
    "sale_uuid": "11111111-1111-4111-8111-111111111111",
    "amount": 36000,
    "reference_no": null,
    "status": "paid",
    "paid_at": "2026-06-05T03:05:00.000000Z",
    "payment_method": {
      "uuid": "4d3ce339-e6e4-4ce8-b4c1-80fb4fb559bb",
      "name": "Cash",
      "code": "CASH"
    },
    "sale_payment_summary": {
      "grand_total": 36000,
      "paid_total": 36000,
      "remaining_amount": 0,
      "change_amount": 0,
      "status": "paid"
    }
  }
}
```

## Catatan Flutter Offline-First

- Buat `uuid` pembayaran sebelum pembayaran disimpan lokal.
- Simpan `payment_method_uuid` dan `payment_method_code` dari `GET /api/payment-methods` bersama pembayaran lokal.
- Kirim `Idempotency-Key` stabil per payment, misalnya `payment-{payment_uuid}`.
- Jika request timeout, kirim ulang payload yang sama dengan idempotency key yang sama.
- Jangan memakai idempotency key yang sama untuk payload berbeda.
- Untuk split payment, simpan setiap metode pembayaran sebagai payment lokal terpisah.
- Jika user memiliki akses ke 2 outlet atau lebih, pastikan payment dikirim untuk `sale_uuid` yang benar. Backend akan memakai outlet dari sale tersebut untuk rekap.
- Kirim `POST /api/sales` lebih dulu, lalu kirim `POST /api/payments` setelah sale berhasil tersimpan atau saat retry sync berikutnya.
- Pastikan aplikasi Flutter membuka shift lebih dulu melalui `POST /api/shifts/open` sebelum mengirim transaksi dan pembayaran pertama.
