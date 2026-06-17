

--AND -> EVERY CONDITION IS must be true 
-- OR --> one of the two must be true
-- NOT --> reverce / exclude a condition 

-- products where it is electronics but price > 1000

SELECT name , category, price
FROM products
WHERE category = 'electronics';
    AND price > 100;

-- products where category is electronics or furniture 

SELECT name, category, price 
FROM products 
WHERE category = 'electronics'
    OR category = 'furniture';

-- products where categories are not furniture 

SELECT name, categories
FROM products
WHERE NOT category = 'furniture';

-- inserting value with in value 
SELECT name, category, price , stock 
FROM products
WHERE (category ='electronics'OR category='furniture')
    AND stock>0;

SELECT name, price, stock, is_active
FROM products
WHERE is_active = true
    AND (price <1000 OR stock >=100);
