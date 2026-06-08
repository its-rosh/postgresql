-- firt we droped the table if already existated 
DROP TABLE IF EXISTS  basic.product_basics;

-- then we create table with all the required colums with it's configurations id,name,stock, total_value, price, is_active
CREATE TABLE basic.product_basics(
    id SERIAL PRIMARY KEY ,

    name VARCHAR(100) NOT NULL,
    -- string maximum length 100 only 

    description TEXT,
    stock INTEGER DEFAULT 0,

    total_value BIGINT DEFAULT 0,
    -- stores bigger value of number then INTEGER 

    price NUMERIC (10,2),
    -- stores exact desimal value
    -- 10 means 10 digits in the start and 2 means 2 digit after the desimal point .... 9999999999.99

    is_active BOOLEAN DEFAULT true
)

-- quries 

INSERT INTO basic.product_basics
    (name,description,stock,total_view, price , is_active)
VALUES 
(
    'product 1',
    'product dec',
    100,
    1200,
    2346.77,
    true
)

SELECT* FROM baisc.product_basics

SELECT id, name , price, is_active 
FROM basic.product_basics
WHERE is_active;