
-- foregin key is a col that points to the primary key of another table 

--  help you to make use of something form another table which do not belong to this table but can be accesed by the help of foregin key 



-- users.id -parent key ( id form users )
-- posts.user_id - foregin key 
-- every key that you create that must belong to a user 

SELECT id , name
FROM users;

SELECT id,user_id,title 
FROM posts;