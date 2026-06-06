# Payments API

Endpoint ini direncanakan untuk aplikasi Flutter POS agar dapat mengirim pembayaran transaksi ke server.

## Endpoint

- Method: `POST`
- URL: `/api/payments`
- Header:
  - `Accept: application/json`
  - `Content-Type: application/json`
  - `Authorization: Bearer {access_token}`
  - `Idempotency-Key: {key}`

## Status

Belum diimplementasikan. Detail payload pembayaran, relasi transaksi, split payment, dan response akan ditulis saat endpoint mulai dikerjakan.

## Aturan Awal

- Setiap pembayaran memakai `uuid` dari aplikasi kasir.
- Pembayaran mengirim `payment_method_uuid` dan snapshot kode metode.
- Request wajib idempotent agar pengiriman ulang tidak membuat pembayaran dobel.
- Server memvalidasi transaksi, metode pembayaran, nominal, user, dan device.
