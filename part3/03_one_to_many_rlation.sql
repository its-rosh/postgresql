
-- one parent can have many child rows
-- one user can have multipe posts
-- but one post will always belong to one users 

-- users - parent table 
-- posts - child table 

-- posts.user_id --> user.id ( user's it --- what is the user's id of this post )
-- users.id is the original user id
-- posts.user_id stores going to store original user id inside the posts  table 

-- Q is give me all the posts with user id and user name ( i can get user's id and post but how can i get the name?)

SELECT 
    users.name AS author_name,
    posts.title AS post_title,
    posts.status 
FROM users 
INNER JOIN posts
    ON users.id = posts.user_id  -- this line is checking if user.id which is from users and posts.user.id which is from posts are same.. they should match 
ORDER BY users.name, posts.title;