# Biopepti Admin Backend (MySQL)

Express API with **MySQL** for admin login, dashboard stats, and product CRUD (strength/price variants). Images stored with Multer in `/uploads`.

## Setup

1. Start MySQL locally.
2. Set credentials in `.env`:

```env
DB_HOST=localhost
DB_PORT=3306
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=biopepti
```

3. Install & run:

```bash
cd backend
npm install
npm run seed   # optional sample products
npm run dev    # http://localhost:4000
```

The app creates the `biopepti` database and tables automatically on startup.

Default admin:

- Email: `admin@biopepti.com`
- Password: `admin123`

## Tables

| Table | Purpose |
|---|---|
| `admins` | Admin login & profile |
| `products` | Product catalog |
| `product_variants` | Strengths (5mg, 10mg…) + prices |

## API

Protected routes need: `Authorization: Bearer <token>`

### Auth
- `POST /api/auth/login`
- `GET /api/auth/me`
- `PUT /api/auth/profile`
- `PUT /api/auth/password`

### Products
- `GET /api/products`
- `GET /api/products/:id`
- `POST /api/products` (JSON or multipart with `image` + `variants` JSON string)
- `PUT /api/products/:id`
- `DELETE /api/products/:id`
- `POST /api/products/:id/image`

### Stats
- `GET /api/stats`
