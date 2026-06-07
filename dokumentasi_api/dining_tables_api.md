# Dining Tables API

Endpoint ini dipakai aplikasi Flutter POS untuk mengambil master meja berdasarkan outlet yang dapat diakses user/device.

## Endpoint

- Method: `GET`
- URL: `/api/dining-tables`
- Header:
  - `Accept: application/json`
  - `Authorization: Bearer {access_token}`

## Query Parameter

- `outlet_uuid` opsional, UUID outlet untuk mengambil meja dari satu outlet tertentu.

Jika `outlet_uuid` tidak dikirim, server mengirim meja aktif dari semua outlet aktif yang dapat diakses user. Ini mendukung kondisi satu kasir menjaga lebih dari satu outlet di lokasi yang sama.

## Response Sukses

Status: `200 OK`

```json
{
  "data": [
    {
      "uuid": "66a19f7f-835e-48b1-990e-fb1b4c3c6c18",
      "name": "Teras 1",
      "number": "1",
      "revision": 1,
      "updated_at": "2026-06-07T10:00:00.000000Z",
      "outlet": {
        "uuid": "395b829b-bc64-4629-92f5-855b7c3cf521",
        "name": "Coffee Shop Ordi",
        "code": "COF"
      }
    },
    {
      "uuid": "11e8fbe9-8887-4eca-986c-cc7f3a0f0d91",
      "name": "Lesehan 1",
      "number": null,
      "revision": 1,
      "updated_at": "2026-06-07T10:05:00.000000Z",
      "outlet": {
        "uuid": "6d7e3d97-5d46-4906-9922-eab8f5bbd731",
        "name": "Warung Nasi Ordi",
        "code": "WRG"
      }
    }
  ]
}
```

Field response:

- `uuid` adalah identifier publik meja.
- `name` adalah label meja yang ditampilkan di aplikasi kasir.
- `number` adalah nomor meja opsional dan dapat bernilai `null`.
- `revision` dipakai untuk kebutuhan sync.
- `updated_at` dipakai aplikasi kasir untuk membandingkan data lokal dengan server.
- `outlet` menunjukkan outlet pemilik meja agar Flutter dapat mengelompokkan meja per outlet.

## Aturan Awal

- API hanya mengirim meja aktif dari outlet yang dapat diakses user.
- Meja dari outlet nonaktif tidak dikirim.
- Meja diurutkan berdasarkan nama outlet, lalu nomor/nama meja.
- Response memakai `uuid`, `revision`, dan `updated_at` untuk kebutuhan sync.
- Master meja hanya menjadi referensi transaksi dine-in; endpoint ini belum mengirim status tersedia, terisi, atau reserved.

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

Status: `404 Not Found`

```json
{
  "message": "Outlet tidak ditemukan."
}
```

Status: `422 Unprocessable Entity`

```json
{
  "message": "The outlet uuid field must be a valid UUID.",
  "errors": {
    "outlet_uuid": [
      "The outlet uuid field must be a valid UUID."
    ]
  }
}
```

## Catatan Flutter Offline-First

- Simpan meja di database lokal dengan relasi ke `outlet.uuid`.
- Jika kasir menjaga dua outlet, tampilkan meja berdasarkan outlet aktif yang sedang dipilih di aplikasi.
- Saat transaksi dine-in dibuat, kirim `dining_table_uuid` di `POST /api/sales`.
- Untuk take-away/delivery, jangan kirim `dining_table_uuid` atau kirim `null`.
- Saat pull penuh, panggil endpoint tanpa `outlet_uuid`.
- Saat refresh per outlet, panggil endpoint dengan `outlet_uuid`.
