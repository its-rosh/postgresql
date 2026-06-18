

-- return ususally return back the rows immdiately after inserction 

INSERT INTO products (name,category,price,stock,sku,description)
VALUES ('web-cam','electronics',2344,34,'ELEC-WEB-014','this produst is used to shas camera for you pc ')
RETURNING id,name,category,price,stock,created_at;

UPDATE products
SET stock = stock+11
WHERE sku = 'ELEC-WEB-014'
RETURNING id,name,stock;

DELETE FROM products
WHERE sku = 'ELEC-WEB-014'
RETURNING id, name, sku;

SELECT name,sku,
FROM products
WHERE sku = 'ELEC-WEB-009';

