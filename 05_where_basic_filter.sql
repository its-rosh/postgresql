
-- / product? categories=electronics 

SELECT name , category, price
FROM products
WHERE category = 'electronics';

-- find prdoduct where price is greater then 1000

SELECT name , price 
FROM products 
WHERE price > 1000;

-- finfing products which are not active 

SELECT name, is_active
FROM products
WHERE is_active = FALSE;