
-- IN -> value must match match one item from the list 
-- NOT IN --> value must not match any time from the list 
-- BETWEEN --> values must be inside a range 

SELECT name,category,price
FROM produsts
WHERE category  IN ('electronis','furniture');

SELECT name,category
FROM products
WHERE category NOT IN ('electronics','furniture');

SELECT name,price
FROM products 
WHERE price BETWEEN 100 AND 2000;

SELECT name,category,price,stock
FROM products 
WHERE categoty IN ('electronis','stationery')
    AND price BETWEEN 10 AND 1499;