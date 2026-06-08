
DROP TABLE IF EXISTS basics.students;

CREATE TABLE basics.students(

    id SERIAL PRIMARY KEY,
    -- create an auto incrementing integer
    -- 1 then 2 then 3 and so on 
    -- primary key simaly means the col uniquely  identifies each row 

    name TEXT NOT NULL ,
    -- text - string data 
    -- not null means this col is required 
    -- postgres is going to reject if this name is not present 

    email TEXT NOT NULL UNIQUE,

    age INTEGER CHECK (age>=18),

    created_at TIMESTAMP DEFAULT NOW()
    -- timestamp stores date and time format 
    -- default neams it will take value by it's own if you won't give 
);

-- inseart some data 

INSERT INTO basics.students (name,email,age)
VALUES
('roshita','roshita@gamil.com',21); 
('rosita','rosita@gamil.com',22);
('rohita','rohita@gamil.com',23)

