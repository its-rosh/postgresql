CREATE EXTENSION IF NOT EXISTS pgcrypto;
DROP TABLE IF EXISTS products;
CREATE TABLE products(
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name        TEXT NOT NULL,
    category    TEXT NOT NULL,
    price       NUMERIC(10,2) NOT NULL CHECK (price >= 0),
    stock       INTEGER NOT NULL DEFAULT 0 CHECK (stock >= 0),
    is_active   BOOLEAN NOT NULL DEFAULT true,
    sku         TEXT UNIQUE,
    description TEXT,
    created_at  TIMESTAMP NOT NULL DEFAULT NOW()
);

INSERT INTO products(name, category, price, stock, is_active, sku, description, created_at)
VALUES
    ('Wireless Headphones', 'electronics', 1999.99, 50,  true,  'ELEC-001', 'Bluetooth over-ear headphones with noise cancellation', NOW()),
    ('Running Shoes',       'footwear',    2499.00, 30,  true,  'FOOT-001', 'Lightweight running shoes with cushioned sole',         NOW()),
    ('Coffee Mug',          'kitchen',      299.00, 100, true,  'KTCH-001', 'Ceramic mug with heat retention up to 4 hours',        NOW()),
    ('Yoga Mat',            'fitness',      799.00, 25,  true,  'FIT-001',  'Non-slip yoga mat with carrying strap',                NOW()),
    ('Notebook A5',         'stationery',   149.00, 200, true,  'STAT-001', 'Spiral bound notebook with 200 ruled pages',           NOW()),
    ('Sunglasses',          'accessories',  999.00, 40,  false, 'ACC-001',  'UV400 polarized sunglasses for outdoor use',           NOW()),
    ('Water Bottle',        'fitness',      499.00, 75,  true,  'FIT-002',  'Stainless steel insulated bottle 1 litre',             NOW()),
    ('Desk Lamp',           'electronics',  899.00, 15,  false, 'ELEC-002', 'LED desk lamp with adjustable brightness',             NOW());

SELECT * FROM products;