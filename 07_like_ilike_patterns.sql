
-- like - case sensitice pattern match
-- ilike - case insensitive patter match
-- % means any no of char
-- excatly one char

SELECT name,price
FROM products
WHERE name LIKE 'Wireless%'
-- % after wireless means anything can come after it 

-- Desk, desk, DESK
SELECT name, category, price 
FROM products
WHERE name ILKE '%desk%'

SELECT name , category, description
FROM products
WHERE name ILKE '%chair%'
    OR description ILKE '%chair%'