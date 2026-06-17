

-- limits --> how many rows you want to return 
-- affset -> how many rows we want to skip 

SELECT name , price 
FROM products 
ORDER BY name ASC
LIMIT 5;

SELECT name,price
FROM products 
ORDER BY name ASC
LIMIT 5 OFFSET 0;

-- (page - 1) * limit 
-- (2-1)*5 -> 5
-- (3-1)*5 -> 10

SELECT name,price
FROM products
ORDER BY name ASCLIMIT 5 OFFSET 10;