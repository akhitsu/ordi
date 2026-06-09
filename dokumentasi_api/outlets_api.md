# Outlets API

Endpoint ini dipakai aplikasi Flutter POS untuk mengambil daftar outlet yang dapat diakses user.

## Endpoint

- Method: `GET`
- URL: `/api/outlets`
- Header:
  - `Accept: application/json`
  - `Authorization: Bearer {access_token}`

## Query Parameter

Semua query parameter bersifat opsional.

- `business_uuid`: filter outlet berdasarkan merchant/business. User tenant hanya boleh memakai business miliknya. Akun platform internal dapat memakai business mana pun.
- `updated_after`: filter outlet yang berubah setelah waktu tertentu. Format tanggal/waktu valid, contoh `2026-06-05T10:00:00+07:00`.
- `include_inactive`: boolean, default `false`. Jika `true`, response juga mengirim outlet nonaktif yang masih termasuk akses user.

Contoh request:

```http
GET /api/outlets?updated_after=2026-06-05T10:00:00%2B07:00&include_inactive=true
Accept: application/json
Authorization: Bearer 1|plain-text-token-sanctum
```

## Response Sukses Final

Status: `200 OK`

```json
{
  "data": [
    {
      "uuid": "395b829b-bc64-4629-92f5-855b7c3cf521",
      "name": "Outlet Utama",
      "code": "MAIN",
      "role": "cashier",
      "address": "Jl. Demo No. 1",
      "phone": "081234567890",
      "is_active": true,
      "revision": 1,
      "updated_at": "2026-06-05T10:00:00.000000Z",
      "business": {
        "uuid": "46cf1f39-7bc3-4624-a2ab-1fdb22a0ad1d",
        "name": "Ordi Demo Merchant",
        "timezone": "Asia/Jakarta"
      }
    }
  ]
}
```

Jika tidak ada outlet yang dapat diakses atau tidak ada perubahan sesuai filter, response tetap `200 OK` dengan `data: []`.

Contoh user dengan akses 2 outlet:

```json
{
  "data": [
    {
      "uuid": "395b829b-bc64-4629-92f5-855b7c3cf521",
      "name": "Coffee Shop",
      "code": "COF",
      "role": "cashier",
      "address": "Jl. Demo No. 1",
      "phone": "081234567890",
      "is_active": true,
      "revision": 1,
      "updated_at": "2026-06-05T10:00:00.000000Z",
      "business": {
        "uuid": "46cf1f39-7bc3-4624-a2ab-1fdb22a0ad1d",
        "name": "Ordi Demo Merchant",
        "timezone": "Asia/Jakarta"
      }
    },
    {
      "uuid": "8e4f3e3a-063d-46f0-a9b9-89bb47376704",
      "name": "Retail Store",
      "code": "RTL",
      "role": "cashier",
      "address": "Jl. Demo No. 2",
      "phone": "081234567891",
      "is_active": true,
      "revision": 1,
      "updated_at": "2026-06-05T10:00:00.000000Z",
      "business": {
        "uuid": "46cf1f39-7bc3-4624-a2ab-1fdb22a0ad1d",
        "name": "Ordi Demo Merchant",
        "timezone": "Asia/Jakarta"
      }
    }
  ]
}
```

## Field

Field wajib selalu dikirim:

- `uuid`: UUID outlet.
- `name`: nama outlet.
- `code`: kode outlet, dapat bernilai `null` jika belum diisi admin.
- `role`: role user pada outlet. Untuk owner/admin tenant bernilai `owner` atau `admin`; untuk user outlet mengikuti slug role pivot, contoh `cashier`; dapat `null` jika akses outlet belum punya role pivot.
- `address`: alamat outlet, dapat bernilai `null`.
- `phone`: nomor telepon outlet, dapat bernilai `null`.
- `is_active`: status aktif outlet.
- `revision`: angka revisi outlet, naik setiap outlet diubah di server.
- `updated_at`: waktu terakhir outlet diubah di server.
- `business`: objek merchant pemilik outlet.
- `business.uuid`: UUID merchant.
- `business.name`: nama merchant.
- `business.timezone`: timezone merchant, contoh `Asia/Jakarta`.

Tidak ada field `timezone` langsung di level outlet. Timezone dikirim melalui `business.timezone`.

## Aturan Akses

- Endpoint wajib memakai token dari `POST /api/login`.
- User nonaktif menerima `403 Forbidden`.
- Akun system/platform internal dengan `business = null` dapat menerima semua outlet yang sesuai filter.
- User tenant dengan role `admin` atau `owner` menerima outlet milik merchant pada `users.business_id`.
- Role selain `admin` dan `owner` menerima outlet berdasarkan relasi `outlet_user`.
- Satu user dapat memiliki akses ke lebih dari satu outlet. Dalam kondisi ini `data` berisi semua outlet yang dapat diakses user tersebut.
- Default endpoint hanya mengirim outlet aktif.
- Outlet nonaktif hanya dikirim jika `include_inactive=true` dan outlet tersebut masih termasuk akses user.

## Aturan Outlet pada Transaksi dan Pembayaran

- Setiap transaksi wajib memilih tepat satu outlet melalui `outlet_uuid` pada `POST /api/sales`.
- Jika user memiliki 2 outlet atau lebih, Flutter wajib menyimpan pilihan outlet aktif sebelum membuat transaksi.
- Transaksi dikelompokkan berdasarkan `sales.outlet_id`.
- Pembayaran tidak mengirim `outlet_uuid` langsung; pembayaran mengikuti outlet dari transaksi pada `sale_uuid`.
- Rekap pembayaran juga dikelompokkan berdasarkan outlet transaksi, bukan outlet yang sedang dipilih di UI saat retry sync berjalan.
- Untuk checkout multi-outlet, Flutter harus membuat satu sale per outlet dan memakai `checkout_group_uuid` yang sama untuk menghubungkan checkout gabungan.

## Aturan Sync

- Outlet memakai `revision`.
- Outlet juga memakai `updated_at`.
- Untuk initial sync, panggil `GET /api/outlets` tanpa `updated_after`.
- Untuk incremental sync, panggil `GET /api/outlets?updated_after={last_outlet_updated_at}`.
- Simpan nilai maksimum `updated_at` dari response sebagai cursor sync outlet berikutnya.
- Secara default endpoint hanya mengirim outlet aktif.
- Untuk mengetahui outlet yang sudah nonaktif, Flutter dapat memanggil endpoint dengan `include_inactive=true`; outlet nonaktif akan punya `is_active=false`.
- Untuk akses outlet yang dicabut, outlet tersebut tidak akan muncul lagi di response karena relasi aksesnya sudah tidak ada. Flutter perlu membandingkan daftar `uuid` outlet lokal dengan daftar terbaru dari `GET /api/outlets`; outlet lokal yang tidak muncul lagi harus dianggap tidak dapat dipakai untuk transaksi baru.
- Jika Flutter melakukan incremental sync dan perlu mendeteksi akses dicabut, lakukan full refresh berkala tanpa `updated_after`, karena pencabutan akses pada pivot `outlet_user` tidak selalu mengubah `updated_at` outlet.

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
  "message": "Business tidak dapat diakses."
}
```

Status: `404 Not Found`

```json
{
  "message": "Business tidak ditemukan."
}
```

Status: `422 Unprocessable Entity`

```json
{
  "message": "The updated after is not a valid date.",
  "errors": {
    "updated_after": [
      "The updated after is not a valid date."
    ]
  }
}
```

```json
{
  "message": "The business uuid must be a valid UUID.",
  "errors": {
    "business_uuid": [
      "The business uuid must be a valid UUID."
    ]
  }
}
```

```json
{
  "message": "The include inactive field must be true or false.",
  "errors": {
    "include_inactive": [
      "The include inactive field must be true or false."
    ]
  }
}
```

## Perbedaan dengan Outlet dari Login

Shape `outlets` pada response `POST /api/login` lebih ringkas dan dipakai agar Flutter bisa langsung memilih outlet setelah login.

Shape outlet dari login saat ini:

```json
{
  "uuid": "395b829b-bc64-4629-92f5-855b7c3cf521",
  "name": "Outlet Utama",
  "code": "MAIN",
  "role": null
}
```

Shape `GET /api/outlets` lebih lengkap untuk model dan sync lokal karena menambahkan:

- `address`
- `phone`
- `is_active`
- `revision`
- `updated_at`
- `business`
- `business.timezone`

Rekomendasi Flutter:

- Pakai `outlets` dari login untuk bootstrap UI awal setelah login.
- Setelah token tersedia, panggil `GET /api/outlets` untuk menyimpan model outlet final di database lokal.
- Model final Flutter sebaiknya mengikuti shape `GET /api/outlets`, bukan shape ringkas dari login.
