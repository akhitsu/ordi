# Menu Categories API

Endpoint ini dipakai aplikasi Flutter POS untuk mengambil kategori menu berdasarkan outlet yang dapat diakses user/device.

## Endpoint

- Method: `GET`
- URL: `/api/menu-categories`
- Header:
  - `Accept: application/json`
  - `Authorization: Bearer {access_token}`

## Query Parameter

- `outlet_uuid` opsional, UUID outlet untuk mengambil kategori dari satu outlet tertentu.

Jika `outlet_uuid` tidak dikirim, server mengirim kategori dari semua outlet aktif yang dapat diakses user. Ini mendukung kondisi satu kasir menjaga lebih dari satu outlet di lokasi yang sama, misalnya outlet `Coffee Shop Ordi` dan `Warung Nasi Ordi`.

## Response Sukses

Status: `200 OK`

```json
{
  "data": [
    {
      "uuid": "05773837-8a8d-48cf-82cc-11479c57575c",
      "name": "Minuman Kopi",
      "sort_order": 1,
      "revision": 1,
      "updated_at": "2026-06-05T10:00:00.000000Z",
      "outlet": {
        "uuid": "395b829b-bc64-4629-92f5-855b7c3cf521",
        "name": "Coffee Shop Ordi",
        "code": "COF"
      }
    },
    {
      "uuid": "87c63e01-6ffd-4d5d-9222-5fbde98f54dd",
      "name": "Makanan Berat",
      "sort_order": 1,
      "revision": 1,
      "updated_at": "2026-06-05T10:05:00.000000Z",
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

- `uuid` adalah identifier publik kategori menu.
- `name` adalah nama kategori yang ditampilkan di aplikasi kasir.
- `sort_order` menentukan urutan tampil kategori di outlet masing-masing.
- `revision` dipakai untuk kebutuhan sync.
- `updated_at` dipakai aplikasi kasir untuk membandingkan data lokal dengan server.
- `outlet` menunjukkan outlet pemilik kategori agar Flutter dapat mengelompokkan kategori per outlet.

## Aturan Awal

- API hanya mengirim kategori aktif dari outlet yang dapat diakses user.
- Kategori dari outlet nonaktif tidak dikirim.
- Kategori diurutkan berdasarkan nama outlet, lalu `sort_order`, lalu nama kategori.
- Response memakai `uuid`, `revision`, dan `updated_at` untuk kebutuhan sync.

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

- Simpan kategori di database lokal dengan relasi ke `outlet.uuid`.
- Jika kasir menjaga dua outlet, tampilkan kategori berdasarkan outlet aktif yang sedang dipilih di aplikasi.
- Saat pull penuh, panggil endpoint tanpa `outlet_uuid`.
- Saat refresh per outlet, panggil endpoint dengan `outlet_uuid`.
