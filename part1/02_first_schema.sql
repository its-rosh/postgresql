-- db -> schema -> table -> rows

-- if not exists is going to create an error if the schema is already present 

CREATE SCHEMA IF NOT EXISTS basics;

CREATE EXTENCTIONS IF NOT EXISTS pgcrypto;


-- query 

SELECT schema_name
FROM information_schema.schemata --gives all the nessory info about schema  at one place about all schema 
ORDER BY schema_name;