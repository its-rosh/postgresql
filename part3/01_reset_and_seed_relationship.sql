

-- CREATE EXTENSION IF NOT EXISTS pgcrypto;
-- -- Think of pgcrypto like installing a lock and safe in your house. Postgres is the house — it doesn't come with a safe by default, you have to add it.


-- DROP TABLE IF EXISTS post_tags;
-- DROP TABLE IF EXISTS comments;
-- DROP TABLE IF EXISTS posts;
-- DROP TABLE IF EXISTS tags;
-- DROP TABLE IF EXISTS users;

-- CREATE TABLE users (
--     id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
--     name TEXT NOT NULL
-- );

-- CREATE TABLE posts(
--     id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

--     user_id UUID NOT NULL REFERENCES users(id),
--     title TEXT NOT NULL,
--     status TEXT NOT NULL DEFAULT 'draft'
--         CHECK (status IN('draft','published')),
--     views INTEGER NOT NULL DEFAULT 0 CHECK (views >= 0)
-- );

-- CREATE TABLE comments (
--     id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

--     post_id UUID NOT NULL REFERENCES posts(id),
--     body TEXT NOT NULL
-- );

-- CREATE TABLE tags(
--     id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

--     name TEXT NOT NULL UNIQUE
-- );

-- CREATE TABLE post_tags(
--     post_id UUID NOT NULL REFERENCES posts(id),
--     tag_id  UUID NOT NULL REFERENCES tags(id),
--     PRIMARY KEY (post_id, tag_id)  -- composite primary key (both together)

-- );


-- CREATE EXTENSION IF NOT EXISTS pgcrypto;
-- -- pgcrypto is a Postgres plugin/extension.
-- -- We need it because it gives us the function gen_random_uuid(),
-- -- which we use below to auto-generate unique IDs for every table.

-- -- TABLE 1: users  (the "parent" table — one user, many posts)
-- -- ---------------------------------------------------------
-- CREATE TABLE users (
--     id   UUID PRIMARY KEY DEFAULT gen_random_uuid(),
--     -- unique ID for each user, auto-generated using pgcrypto's function.
--     -- This id is later used by posts.user_id to link a post to its author.

--     name TEXT NOT NULL
--     -- the user's name; NOT NULL means every user must have a name.
-- );

-- -- ---------------------------------------------------------
-- -- TABLE 2: posts  (linked to users — ONE-TO-MANY relationship)
-- -- one user can write MANY posts, but each post belongs to ONE user
-- -- ---------------------------------------------------------
-- CREATE TABLE posts(
--     id      UUID PRIMARY KEY DEFAULT gen_random_uuid(),
--     -- unique ID for each post, auto-generated.
--     -- This id is later used by comments.post_id and post_tags.post_id.

--     user_id UUID NOT NULL REFERENCES users(id),
--     -- FOREIGN KEY linking back to users.id.
--     -- This is what creates the "user → posts" relationship.
--     -- Postgres will REJECT a post if user_id doesn't exist in users table.

--     title   TEXT NOT NULL,
--     -- the title of the post; cannot be empty.

--     status  TEXT NOT NULL DEFAULT 'draft'
--         CHECK (status IN ('draft','published')),
--     -- status can ONLY be 'draft' or 'published' — CHECK enforces this rule.
--     -- DEFAULT 'draft' means new posts start as drafts unless specified.

--     views   INTEGER NOT NULL DEFAULT 0 CHECK (views >= 0)
--     -- tracks how many times the post was viewed.
--     -- CHECK (views >= 0) prevents negative view counts (invalid data).
-- );

-- -- ---------------------------------------------------------
-- -- TABLE 3: comments  (linked to posts — ONE-TO-MANY relationship)
-- -- one post can have MANY comments, but each comment belongs to ONE post
-- -- ---------------------------------------------------------
-- CREATE TABLE comments (
--     id      UUID PRIMARY KEY DEFAULT gen_random_uuid(),
--     -- unique ID for each comment, auto-generated.

--     post_id UUID NOT NULL REFERENCES posts(id),
--     -- FOREIGN KEY linking back to posts.id.
--     -- This is what creates the "post → comments" relationship.
--     -- A comment CANNOT exist without a valid post_id (no orphan comments).

--     body    TEXT NOT NULL
--     -- the actual comment text; cannot be empty.
-- );

-- -- ---------------------------------------------------------
-- -- TABLE 4: tags  (standalone table — no relationship yet on its own)
-- -- ---------------------------------------------------------
-- CREATE TABLE tags(
--     id   UUID PRIMARY KEY DEFAULT gen_random_uuid(),
--     -- unique ID for each tag, auto-generated.
--     -- This id is later used by post_tags.tag_id.

--     name TEXT NOT NULL UNIQUE
--     -- tag name (e.g. "SQL", "Tutorial"); UNIQUE means no duplicate tag names.
-- );

-- -- ---------------------------------------------------------
-- -- TABLE 5: post_tags  (the JUNCTION/BRIDGE table)
-- -- Creates the MANY-TO-MANY relationship between posts and tags:
-- --   - one post can have MULTIPLE tags
-- --   - one tag can belong to MULTIPLE posts
-- -- This relationship is only possible because of this bridge table.
-- -- ---------------------------------------------------------
-- CREATE TABLE post_tags(
--     post_id UUID NOT NULL REFERENCES posts(id),
--     -- FOREIGN KEY linking to posts.id.
--     -- Tells us WHICH post this tag-link belongs to.

--     tag_id  UUID NOT NULL REFERENCES tags(id),
--     -- FOREIGN KEY linking to tags.id.
--     -- Tells us WHICH tag this post-link belongs to.

--     PRIMARY KEY (post_id, tag_id)
--     -- COMPOSITE PRIMARY KEY: combines post_id + tag_id together.
--     -- post_id alone repeats (same post, many tags) — not unique alone.
--     -- tag_id alone repeats (same tag, many posts) — not unique alone.
--     -- But the COMBINATION (post_id + tag_id) is always unique —
--     -- meaning the same tag cannot be added twice to the same post.
-- );

-- -- =========================================================
-- -- RELATIONSHIP SUMMARY:
-- -- users  (1) -----> (many) posts        [one-to-many]
-- -- posts  (1) -----> (many) comments     [one-to-many]
-- -- posts  (many) <--> (many) tags        [many-to-many, via post_tags]
-- -- =========================================================

-- INSERT INTO users (name) VALUES
-- ('Ananya'),
-- ('Rahul');

-- INSERT INTO posts (user_id, title, status, views)
-- SELECT id, 'PostgreSQL Joins Explained', 'published', 100
-- FROM users
-- WHERE name = 'Ananya';

-- INSERT INTO posts (user_id, title, status, views)
-- SELECT id, 'Indexes for Beginners', 'draft', 40
-- FROM users
-- WHERE name = 'Ananya';

-- INSERT INTO posts (user_id, title, status, views)
-- SELECT id, 'Backend APIs with PostgreSQL', 'published', 180
-- FROM users
-- WHERE name = 'Rahul';

-- INSERT INTO comments (post_id, body)
-- SELECT id, 'Very clear explanation.'
-- FROM posts
-- WHERE title = 'PostgreSQL Joins Explained';

-- INSERT INTO comments (post_id, body)
-- SELECT id, 'Please add more examples.'
-- FROM posts
-- WHERE title = 'Backend APIs with PostgreSQL';

-- INSERT INTO tags (name) VALUES
-- ('sql'),
-- ('backend');

-- INSERT INTO post_tags (post_id, tag_id)
-- SELECT p.id, t.id
-- FROM posts p, tags t
-- WHERE p.title = 'PostgreSQL Joins Explained'
--     AND t.name = 'sql';

-- INSERT INTO post_tags (post_id, tag_id)
-- SELECT p.id, t.id
-- FROM posts p, tags t
-- WHERE p.title = 'Indexes for Beginners'
--     AND t.name = 'sql';

-- INSERT INTO post_tags (post_id, tag_id)
-- SELECT p.id, t.id
-- FROM posts p, tags t
-- WHERE p.title = 'Backend APIs with PostgreSQL'
--     AND t.name = 'backend';

-- SELECT 'Part 4 reduced database reset and sample data inserted succesfuly'

SELECT * FROM users;