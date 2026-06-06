# Payment Methods API

Endpoint ini dipakai aplikasi Flutter POS untuk mengambil metode pembayaran aktif yang dikelola dari web admin.

## Endpoint

- Method: `GET`
- URL: `/api/payment-methods`
- Header:
  - `Accept: application/json`
  - `Authorization: Bearer {access_token}` saat endpoint sudah diproteksi auth API.

## Query Parameter

Belum ada query parameter untuk endpoint ini.

## Response Sukses

Status: `200 OK`

```json
{
  "data": [
    {
      "uuid": "f3b40a56-63f4-4f39-85a0-38bfa13a0bb0",
      "name": "Tunai",
      "code": "CASH",
      "sort_order": 1,
      "revision": 1,
      "updated_at": "2026-06-05T10:00:00.000000Z"
    },
    {
      "uuid": "8dbcb748-4e4d-42c7-9e10-7b24f1605714",
      "name": "QRIS",
      "code": "QRIS",
      "sort_order": 2,
      "revision": 1,
      "updated_at": "2026-06-05T10:05:00.000000Z"
    }
  ]
}
```

Field response:

- `uuid` adalah identifier publik metode pembayaran.
- `name` adalah nama yang ditampilkan di aplikasi kasir.
- `code` adalah kode stabil yang disimpan sebagai snapshot pada pembayaran.
- `sort_order` menentukan urutan tampil.
- `revision` dipakai untuk kebutuhan sync.
- `updated_at` dipakai aplikasi kasir untuk membandingkan data lokal dengan server.

## Aturan Data

- Hanya metode pembayaran aktif yang dikirim ke kasir.
- Data diurutkan berdasarkan `sort_order`, lalu `name`.
- Metode pembayaran yang sudah digunakan tidak boleh dihapus dari histori transaksi; admin menonaktifkannya agar tidak lagi muncul di kasir.

## Response Error

Status: `401 Unauthorized`

```json
{
  "message": "Unauthenticated."
}
```

Status: `500 Internal Server Error`

```json
{
  "message": "Terjadi kesalahan server."
}
```

## Catatan Flutter Offline-First

- Simpan daftar metode pembayaran aktif di database lokal.
- Gunakan `uuid` untuk referensi ke master metode pembayaran saat membuat pembayaran.
- Simpan `code` sebagai snapshot di payload pembayaran agar histori tetap aman ketika nama metode berubah.
