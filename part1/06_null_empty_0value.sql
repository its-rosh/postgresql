
-- null - unknown / missing value 
-- empty string - know strinng val but is containg no values 
-- 0 value means it have real number who's value is 0 


CREATE TABLE basics.value_example(

    id SERIAL PRIMARY KEY ,

    nickname TEXT,
    bio TEXT,
    score INTEGER
);

INSERT INTO basics.value_example( nickname ,bio, score )
VALUES 
    -- nickname is null 
    ( null, 'learing postgreSQL',10),
    ('', 'empty nick name',20),
    ('SANGAM','',0),
    ('JOHN',null,null);

SELECT  * FROM basics.value_example;

-- selecting all the null values 


SELECT* FROM basics.value_example WHERE nickname IS NULL;

SELECT * FROM basics.value_example WHERE nickname IS EMPTY ;

SELECT * FROM basics.value_example WHERE score =0 ;

