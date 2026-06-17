
SELECT name,price
FROM prducts 
ORDER BY price ASC;
SELECT name,price
FROM prducts 
ORDER BY price DESC;

-- SOURT many items 

SELECT name,category,price
FROM products
ORDER BY category ASC, price DESC;