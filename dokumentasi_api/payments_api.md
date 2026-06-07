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
- Pembayaran yang masuk selama shift aktif akan ikut terbaca pada detail rekap shift per outlet dan per metode pembayaran saat kasir menjalankan close shift.
- Ringkasan rekap minimal harus dapat menjawab total nominal dan jumlah transaksi untuk metode seperti cash, QRIS, transfer, dan metode aktif lain.
