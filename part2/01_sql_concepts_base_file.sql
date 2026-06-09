

CREATE EXTENSION IF NOT EXISTS pgcrypto;

DROP TABLE IF EXISTS product;

CRETAE TABLE product(

    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL,
    category TEXT NOT NULL,
    price NUMERIC(10,2) NOT NULL CHECK (PRICE >=0),
    stock INTEGER NOT NULL DEFAULT 0 CHECK (stock>=0), 
    is_active BOOLEAN NOT NULL DEFAULT true,
    sku  TEXT UNIQUE,
    description TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
)