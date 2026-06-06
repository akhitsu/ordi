# Owner Register API

Endpoint ini dipakai untuk onboarding owner baru. Server membuat merchant/tenant, owner user, outlet pertama, akses owner, dan token Sanctum awal.

## Endpoint

- Method: `POST`
- URL: `/api/owners/register`
- Header:
  - `Accept: application/json`
  - `Content-Type: application/json`

## Request Body

```json
{
  "owner_name": "Owner Baru",
  "owner_email": "owner@example.com",
  "password": "password123",
  "password_confirmation": "password123",
  "business_name": "Kopi Maju",
  "business_legal_name": "PT Kopi Maju Indonesia",
  "business_phone": "08123456789",
  "business_email": "halo@kopimaju.test",
  "timezone": "Asia/Jakarta",
  "outlet_name": "Kopi Maju Cibubur",
  "outlet_code": "MAIN",
  "outlet_phone": "08123456789",
  "outlet_address": "Jl. Demo No. 1"
}
```

Field wajib:

- `owner_name`
- `owner_email`
- `password`
- `password_confirmation`
- `business_name`

Field outlet opsional. Jika `outlet_name` tidak dikirim, nama outlet pertama memakai `business_name`. Jika `outlet_code` tidak dikirim, server memakai `MAIN`.

## Response Sukses

Status: `201 Created`

```json
{
  "token_type": "Bearer",
  "access_token": "1|plain-text-token-sanctum",
  "user": {
    "uuid": "7efb1d57-6f70-4e2d-a271-920c2e4e2a0f",
    "name": "Owner Baru",
    "email": "owner@example.com",
    "role": "owner"
  },
  "business": {
    "uuid": "46cf1f39-7bc3-4624-a2ab-1fdb22a0ad1d",
    "name": "Kopi Maju",
    "timezone": "Asia/Jakarta"
  },
  "outlet": {
    "uuid": "395b829b-bc64-4629-92f5-855b7c3cf521",
    "name": "Kopi Maju Cibubur",
    "code": "MAIN",
    "role": {
      "uuid": "d607f510-0f1c-4564-b07c-f6e2f34cf723",
      "name": "Owner",
      "slug": "owner"
    }
  }
}
```

## Aturan Tenant

- Business yang dibuat adalah merchant/tenant owner baru.
- Owner baru memiliki `business_id` ke merchant tersebut.
- Outlet pertama otomatis menjadi milik merchant tersebut.
- Owner baru otomatis mendapat akses owner ke outlet pertama melalui relasi `outlet_user`.
- Role `owner` memakai master role umum dari tabel `roles`, bukan role khusus merchant.
- Endpoint ini bukan endpoint untuk membuat kategori outlet seperti restoran, kedai kopi, atau retail.
