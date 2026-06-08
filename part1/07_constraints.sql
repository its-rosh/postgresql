
--- constraints are rules to be followed like 
-- not null , unique , default 

DROP TABLE IF EXISTS basics.accounts;

CREATE TABLE basics.accounts(

    id SERIAL PRIMARY KEY,
    full_name TEXT NOT NULL,
    is_ACTIVE BOOLEAN DEFAULT true,
    -- Instead of deleting a record permanently, you just mark it as inactive.
    -- This is called Soft Delete — very commonly used in real apps.

    email TEXT NOT NULL UNIQUE,
    age INTEGER CHECK (age>=18),
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO basics.accounts( full_name,email,age,)
VALUES ('roshita jaiswal',' roshita@gmail.com', 20),
('roshita jais', 'roshit1a@gmail.com', 20);


SELECT * FROM basics.accounts;