
DROP TABLE IF EXISTS basics.laptops;

CREATE TABLE basics.laptops(
    
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    price NUMERIC (10,2) NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT now
);

INSERT INTO basics.laptops(tile,price);

VALUES 
('this is first title',2000),
('this is second title',3000);

SELECT * FROM basics.laptops;
