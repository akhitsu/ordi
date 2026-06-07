# Menu Items API

Endpoint ini dipakai aplikasi Flutter POS untuk mengambil menu dan harga berdasarkan outlet yang dapat diakses user/device.

## Endpoint

- Method: `GET`
- URL: `/api/menu-items`
- Header:
  - `Accept: application/json`
  - `Authorization: Bearer {access_token}`

## Query Parameter

- `outlet_uuid` opsional, UUID outlet untuk mengambil item dari satu outlet tertentu.
- `menu_category_uuid` opsional, UUID kategori menu untuk mengambil item dari satu kategori tertentu.

Jika parameter tidak dikirim, server mengirim item menu dari semua outlet aktif yang dapat diakses user. Ini mendukung kondisi satu kasir menjaga lebih dari satu outlet di lokasi yang sama, misalnya outlet `Coffee Shop Ordi` dan `Warung Nasi Ordi`.

## Response Sukses

Status: `200 OK`

```json
{
  "data": [
    {
      "uuid": "43c29b51-e40b-44d4-aae5-ff4d3bd7c4f0",
      "name": "Kopi Susu",
      "description": "Kopi dan susu segar.",
      "sku": "KS-01",
      "image_url": "http://localhost/storage/image_menu/1/kopi_susu.png",
      "price": 18000,
      "is_retail_ready": false,
      "revision": 1,
      "updated_at": "2026-06-05T10:00:00.000000Z",
      "outlet": {
        "uuid": "395b829b-bc64-4629-92f5-855b7c3cf521",
        "name": "Coffee Shop Ordi",
        "code": "COF"
      },
      "category": {
        "uuid": "05773837-8a8d-48cf-82cc-11479c57575c",
        "name": "Minuman Kopi",
        "sort_order": 1
      }
    },
    {
      "uuid": "a51b9d2f-9c74-4010-a3b0-47f4f50c7e75",
      "name": "Nasi Ayam",
      "description": null,
      "sku": "NA-01",
      "image_url": null,
      "price": 22000,
      "is_retail_ready": false,
      "revision": 1,
      "updated_at": "2026-06-05T10:05:00.000000Z",
      "outlet": {
        "uuid": "6d7e3d97-5d46-4906-9922-eab8f5bbd731",
        "name": "Warung Nasi Ordi",
        "code": "WRG"
      },
      "category": {
        "uuid": "87c63e01-6ffd-4d5d-9222-5fbde98f54dd",
        "name": "Makanan Berat",
        "sort_order": 1
      }
    }
  ]
}
```

Field response:

- `uuid` adalah identifier publik item menu.
- `name` adalah nama item yang ditampilkan di aplikasi kasir.
- `description` adalah deskripsi item, bisa `null`.
- `sku` adalah kode item, bisa `null`.
- `image_url` adalah URL publik gambar menu di server, bisa `null` jika menu belum memiliki gambar.
- `price` adalah harga item pada outlet pemiliknya.
- `is_retail_ready` menandai kesiapan item untuk mode retail lanjutan.
- `revision` dipakai untuk kebutuhan sync.
- `updated_at` dipakai aplikasi kasir untuk membandingkan data lokal dengan server.
- `outlet` menunjukkan outlet pemilik item agar Flutter dapat mengelompokkan item per outlet.
- `category` menunjukkan kategori item. Nilai bisa `null` jika item belum memiliki kategori.

## Aturan Awal

- API hanya mengirim menu aktif dari outlet yang dapat diakses user.
- Menu dari outlet nonaktif tidak dikirim.
- Harga dikirim dari data menu milik outlet.
- Jika menu memiliki gambar, file disimpan server pada folder `image_menu/{outlet_id}/{nama_menu}.{ext}`.
- Upload gambar menu di admin hanya menerima file PNG dan JPEG.
- Item diurutkan berdasarkan nama outlet, urutan kategori, nama kategori, lalu nama item.
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

```json
{
  "message": "Kategori menu tidak ditemukan."
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

- Simpan item di database lokal dengan relasi ke `outlet.uuid` dan `category.uuid`.
- Jika kasir menjaga dua outlet, tampilkan item berdasarkan outlet aktif yang sedang dipilih di aplikasi.
- Saat pull penuh, panggil endpoint tanpa parameter.
- Saat refresh per outlet, panggil endpoint dengan `outlet_uuid`.
- Saat refresh per kategori, panggil endpoint dengan `menu_category_uuid`.
