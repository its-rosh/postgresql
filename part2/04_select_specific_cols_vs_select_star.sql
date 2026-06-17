
-- SELECT * gives us every column for the table 
-- selecting specfic column is going to return the comuln wich i want 


-- SELECT * from products;

-- SELECT name, category, price, stock 
-- FROM products;

-- AS creates a alias for the op of the columnt name 
-- makes the column name easear to read 

SELECT 
    name AS procduct_name,
    price AS selling_price, -- you can not leave space in betwen of the of giving names 
    stock AS availabe_quantity,
    category
FROM products;