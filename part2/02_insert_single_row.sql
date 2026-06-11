

INSERT INTO products(name, category, price, stock, sku, description)

VALUES(
    'Laptop Stand',
    'Electronics',
    5000,
    10,
    'ELEC-KEY-002',
    'Laptop stand description'
);

SELECT * FROM product WHERE sku = ' ELEC-KEY-002';
-- selecting single columne from the table with specificati value 