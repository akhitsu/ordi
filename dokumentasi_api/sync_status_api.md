# Sync Status API

Endpoint ini dipakai aplikasi Flutter POS untuk mengecek status sinkronisasi terakhir antara device dan server.

## Endpoint

- Method: `GET`
- URL: `/api/sync/status`
- Header:
  - `Accept: application/json`
  - `Authorization: Bearer {access_token}`

## Query Parameter

- `device_uuid` wajib, UUID device yang sedang melakukan sync.
- `outlet_uuid` opsional, UUID outlet jika aplikasi ingin mengecek status satu outlet saja.

Jika `outlet_uuid` tidak dikirim, server mengembalikan status untuk semua outlet aktif yang dapat diakses user/device.

## Response Sukses

Status: `200 OK`

```json
{
  "data": {
    "server_time": "2026-06-05T10:00:00.000000Z",
    "device": {
      "uuid": "33333333-3333-4333-8333-333333333333",
      "name": "Samsung A15 Kasir 1",
      "last_seen_at": "2026-06-05T09:55:00.000000Z"
    },
    "outlets": [
      {
        "uuid": "395b829b-bc64-4629-92f5-855b7c3cf521",
        "name": "Coffee Shop Ordi",
        "code": "COF",
        "last_sale_received_at": "2026-06-05T09:58:00.000000Z",
        "last_payment_paid_at": "2026-06-05T09:59:00.000000Z",
        "sync_states": [
          {
            "entity_type": "sales",
            "last_revision": 12,
            "last_pulled_at": "2026-06-05T09:57:00.000000Z",
            "last_pushed_at": "2026-06-05T09:58:00.000000Z"
          }
        ]
      }
    ]
  }
}
```

Field response:

- `server_time` adalah waktu server saat status dibuat.
- `device` adalah device yang sedang melakukan pengecekan sync.
- `outlets` berisi outlet aktif yang dapat diakses user/device.
- `last_sale_received_at` adalah waktu terakhir server menerima transaksi dari device untuk outlet tersebut.
- `last_payment_paid_at` adalah waktu pembayaran terakhir dari device untuk outlet tersebut.
- `sync_states` berisi posisi sync server per entity jika sudah tersedia.

## Aturan Awal

- Status sync dikaitkan dengan user, device, dan outlet bila relevan.
- Endpoint ini hanya membaca status server, bukan jumlah pending lokal device.
- Endpoint ini tidak membuat atau mengubah data transaksi.
- Pending lokal tetap disimpan di database lokal Flutter saat tidak ada signal.
- Saat signal kembali, Flutter melakukan sync otomatis dengan mengirim transaksi pending ke `POST /api/sales`.
- Untuk retry transaksi yang sama, Flutter wajib mengirim payload yang sama dengan `Idempotency-Key` yang sama.
- Jika sukses, Flutter menandai local row sebagai `synced`.
- Jika validasi atau server error, Flutter menandai local row sebagai `failed` dan menyimpan pesan error.
- `POST /api/payments` nanti mengikuti pola idempotency yang sama.

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
  "message": "Device tidak aktif."
}
```

```json
{
  "message": "Device tidak dapat digunakan user ini."
}
```

```json
{
  "message": "Outlet tidak dapat diakses."
}
```

Status: `404 Not Found`

```json
{
  "message": "Device tidak ditemukan."
}
```

```json
{
  "message": "Outlet tidak ditemukan."
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

- Simpan transaksi/pembayaran di local DB sebelum mencoba kirim ke server.
- Saat offline, local row memakai status `pending`.
- Saat online kembali, jalankan sync otomatis dari antrean `pending`.
- Sync otomatis dapat dipicu oleh listener koneksi, app resume, atau background task.
- Server tidak mengetahui pending lokal sampai device berhasil mengirim data.
- Web admin belum menampilkan jumlah pending lokal device.
