CREATE TABLE blog (
    blog_id             serial PRIMARY KEY,
    ua_blog_title       varchar(100) NOT NULL,
    en_blog_title       varchar(50) NOT NULL,
    ua_blog_text        text,
    en_blog_text        text,
    blog_image          varchar(100) NOT NULL,
    create_user_id      integer,
    update_user_id      integer,
    create_datetime     timestamp without time zone NOT NULL,
    update_datetime     timestamp without time zone NOT NULL
);

CREATE TABLE users (
    user_id             serial PRIMARY KEY,
    user_name           varchar(16) NOT NULL,
    user_surname        varchar(16) NOT NULL,
    user_email          varchar(100) NOT NULL,
    user_password       varchar(200) NOT NULL,
    user_avatar         varchar(200) NOT NULL,
    user_payment_method integer,
    user_blocked        boolean DEFAULT FALSE,
    user_email_varified boolean DEFAULT FALSE,
    user_access_token   varchar(200),
    user_refresh_token  varchar(200),
    create_user_id      integer,
    update_user_id      integer,
    create_datetime     timestamp without time zone NOT NULL,
    update_datetime     timestamp without time zone NOT NULL    
);

CREATE TABLE user_adress (
    user_adress_id      serial PRIMARY KEY,
    user_id             integer REFERENCES users(user_id),
    user_adress_state   varchar(20) NOT NULL,
    user_adress_city    varchar(20) NOT NULL,
    user_adress_zip     varchar(20) NOT NULL,
    user_adress_street  varchar(100) NOT NULL,
    user_adress_house   varchar(20) NOT NULL,
    user_adress_appartment   varchar(10) NOT NULL
);

CREATE TABLE sellers (
    seller_id           serial PRIMARY KEY,
    seller_name         varchar(16) NOT NULL,
    seller_email        varchar(100) NOT NULL,
    seller_photo        varchar(16) NOT NULL,
    seller_cover_image  varchar(100),
    seller_products     integer,
    seller_password     varchar(200) NOT NULL,
    seller_billing      varchar,
    seller_announcement varchar(350),
    seller_blocked      boolean DEFAULT FALSE,
    seller_email_varified boolean DEFAULT FALSE,
    seller_access_token   varchar(200),
    seller_refresh_token  varchar(200),
    create_user_id      integer,
    update_user_id      integer,
    create_datetime     timestamp without time zone NOT NULL,
    update_datetime     timestamp without time zone NOT NULL    
);

CREATE TABLE products (
    product_id          serial PRIMARY KEY,
    product_name        varchar(100) NOT NULL,
    product_description text,
    product_size        varchar(5) NOT NULL,
    product_price       real,
    product_seller_id   integer REFERENCES sellers(seller_id) NOT NULL,
    create_user_id      integer,
    update_user_id      integer,
    create_datetime     timestamp NOT NULL,
    update_datetime     timestamp NOT NULL  
);

CREATE TABLE colors (
    color_id            serial PRIMARY KEY,
    color               varchar(20)
);

CREATE TABLE products_colors (
    color_id            integer REFERENCES colors(color_id),
    product_id          integer REFERENCES products(product_id),
    CONSTRAINT product_colors_pk PRIMARY KEY ( color_id, product_id)
);

CREATE TABLE products_images (
    products_images_id  serial PRIMARY KEY,
    product_id          integer REFERENCES products(product_id),
    products_images     varchar(200)
    color_id            integer REFERENCES colors(color_id)
);

CREATE TABLE reviews (
    review_id          serial PRIMARY KEY,
    product_id         integer REFERENCES products(product_id),
    user_id            integer REFERENCES users(user_id),
    review_text        text,
    review_rating      integer not null check(review_rating >= 1 and review_rating <= 5),
    review_agry_flag   boolean DEFAULT FALSE,
    review_date        timestamp NOT NULL
);

CREATE TABLE seller_contact (
    seller_contact_id serial PRIMARY KEY,
    seller_id           integer REFERENCES sellers(seller_id),
    seller_contact_facebook      varchar(200),
    seller_contact_instagram      varchar(200),
    seller_contact_tiktok      varchar(200),
    seller_contact_apple_music      varchar(200),
    seller_contact_spotify      varchar(200)
);


CREATE TABLE user_cart (
    user_cart_id        serial PRIMARY KEY,
    user_session_key    varchar(200)
);
CREATE TABLE cart_product (
    user_cart_id    integer REFERENCES user_cart(user_cart_id),
    product_id    integer REFERENCES products(product_id)
);

CREATE TABLE shipping_info (
    shipping_info_id    serial PRIMARY KEY,
    first_name          varchar(50) NOT NULL,
    last_name           varchar(50) NOT NULL,
    phone               varchar(20) NOT NULL,
    email               varchar(100) NOT NULL,
    address_line_1      varchar(50) NOT NULL,
    address_line_2      varchar(50),
    city                varchar(50) NOT NULL,
    country             varchar(50) NOT NULL,
    region              varchar(50) NOT NULL,
    zip                 varchar(10) NOT NULL    
);

CREATE TABLE orders (
    order_id            serial PRIMARY KEY,
    shipping_info_id    integer REFERENCES shipping_info(shipping_info_id),
    payment_id          integer ,
    finalized           boolean DEFAULT FALSE,
    shipped             boolean DEFAULT FALSE,
    delivered           boolean DEFAULT FALSE
);

CREATE TABLE order_lines (
    order_id            integer REFERENCES orders(order_id),
    product_id          integer REFERENCES products(product_id),
    item_type           varchar(50),
    price               real,
    qty                 integer,
    sub_total           integer,
    tax                 real,
    total               real
);

-- ----------------------------------------------------

insert into seller_contact (
    seller_id,
    seller_contact_facebook ,
    seller_contact_instagram,
    seller_contact_tiktok,
    seller_contact_apple_music,
    seller_contact_spotify )
values 
(4, 'https://www.facebook.com/GoAbandoriginal/', 
'https://www.instagram.com/go_a_band/', 
'https://www.tiktok.com/@go_a_ukraine', 
'https://music.apple.com/us/artist/go-a/1502267232', 
'https://open.spotify.com/artist/4kvCU3MzggM2piZCqvxj0x');

insert into products_colors (color_id, product_id)
values 
(1, 3),(2, 3),(3, 3),(4, 3),
(1, 4), (2, 4),(5, 4),(4, 4),(6, 4),
(1, 5),(2, 5),(3, 5),(4, 5),
(1, 6), (2, 6),(5, 6),(4, 6),(6, 6),
(1, 7),(2, 7),(3, 7),(4, 7),
(1, 8), (2, 8),(5, 8),(4, 8),(6, 8),
(1, 9),(2, 9),(3, 9),(4, 9),
(1, 10), (2, 10),(5, 10),(4, 10),(6, 10);
----------------

insert into blog  values 
( 
    "ua_blog_title", 
    "ua_blog_text", 
    "en_blog_title", 
    "en_blog_text",
    "blog_image", 
    1, 
    1, 
    1677922004,
    1677922004
 );


 insert into colors values 
 ( 1, 'white' ),
 ( 2, 'black' ),
 ( 3, 'green' ),
 ( 4, 'yellow' ),
 ( 5, 'grey' ),
 ( 6, 'violet' );

-- ADD PHOTOS TO DB
insert into products_images( product_id, product_image, color_id) values
( 10, '/public/product_images/10/black.png', 2),
( 10, '/public/product_images/10/white.png', 1),
( 10, '/public/product_images/10/yellow.png', 4),
( 10, '/public/product_images/10/grey.png', 5);
( 9, '/public/product_images/9/black.png', 2),
( 9, '/public/product_images/9/white.png', 1),
( 9, '/public/product_images/9/yellow.png', 4),
( 9, '/public/product_images/9/grey.png', 5);
( 5, '/public/product_images/5/black.png', 2),
( 5, '/public/product_images/5/white.png', 1),
( 5, '/public/product_images/5/yellow.png', 4),
( 5, '/public/product_images/5/grey.png', 5),
( 6, '/public/product_images/6/black.png', 2),
( 6, '/public/product_images/6/white.png', 1),
( 6, '/public/product_images/6/yellow.png', 4),
( 6, '/public/product_images/6/grey.png', 5),
( 7, '/public/product_images/7/black.png', 2),
( 7, '/public/product_images/7/white.png', 1),
( 7, '/public/product_images/7/yellow.png', 4),
( 7, '/public/product_images/7/grey.png', 5),
( 8, '/public/product_images/8/black.png', 2),
( 8, '/public/product_images/8/white.png', 1),
( 8, '/public/product_images/8/yellow.png', 4),
( 8, '/public/product_images/8/grey.png', 5);



insert into reviews ( product_id,user_id,
    review_text, review_rating, review_date  )
values 
(1, 1, 'very good product', 5, to_timestamp(1678006360)),
(1, 1, 'very wonderfull t-shirt', 4, to_timestamp(1675579958)),
(1, 1, 'very good product', 5, to_timestamp(1678156360)),
(1, 1, 'very good product', 4, to_timestamp(1676443958)),
(2, 1, 'very good product', 5, to_timestamp(1676195558)),
(2, 1, 'nice', 4, to_timestamp(1678614758)),
(2, 1, 'very good product', 5, to_timestamp(1678614758)),
(2, 1, 'ok, can be better', 3, to_timestamp(1677307958));

UPDATE products_images
SET color_id = 
  CASE products_images_id
    WHEN 1 THEN 2
    WHEN 2 THEN 1
    WHEN 3 THEN 3
    WHEN 4 THEN 4
  END
WHERE products_images_id IN (1, 2, 3, 4);

UPDATE products
SET product_size = 'XS,S,M,L,XL,XXL'
WHERE product_id IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);


insert into users (
    user_name,
    user_surname,
    user_email,
    user_password,
    user_avatar,
    create_datetime,
    update_datetime  
) values
(
    'Igor', 'David', 'idavid@gss.com', 'pass', '/home/ava', 
    to_timestamp(1678007151),to_timestamp(1678007151)
);

-- FUNCTION FOR UPDATING SELLERS RATING-----
UPDATE Sellers s
SET seller_rating = pr.avg_rating
FROM (
  SELECT pr.product_seller_id, AVG(rev.review_rating) AS avg_rating
  FROM Products pr
  JOIN Reviews rev ON pr.product_id = rev.product_id
  GROUP BY pr.product_seller_id
) pr
WHERE s.seller_id = pr.product_seller_id;
--------------------------------------------

select p.product_id, p.product_name, colors.color from products p 
join products_colors
on products_colors.product_id=p.product_id
join colors
on colors.color_id=products_colors.color_id;

product_id |        product_name        | color  
------------+----------------------------+--------
          1 | Herbi Vore T-Shirt         | white
          1 | Herbi Vore T-Shirt         | black
          1 | Herbi Vore T-Shirt         | green
          1 | Herbi Vore T-Shirt         | yellow
          2 | Wildlife Adventure T-Shirt | white
          2 | Wildlife Adventure T-Shirt | black
          2 | Wildlife Adventure T-Shirt | grey
          2 | Wildlife Adventure T-Shirt | yellow
          2 | Wildlife Adventure T-Shirt | violet


----------------------

SELECT p.product_id, p.product_name, c.color, COALESCE(ROUND(avg_reviews.review_rating, 2), 0) as review_rating, s.seller_name 
FROM products p 
JOIN products_colors pc ON pc.product_id = p.product_id 
LEFT JOIN colors c ON c.color_id = pc.color_id 
LEFT JOIN (
  SELECT product_id, AVG(review_rating) as review_rating 
  FROM reviews 
  GROUP BY product_id
) as avg_reviews ON avg_reviews.product_id = p.product_id 
JOIN sellers s ON s.seller_id = p.product_seller_id 
ORDER BY p.product_id

product_id |        product_name        | color  | review_rating | seller_name 
------------+----------------------------+--------+---------------+-------------
          1 | Herbi Vore T-Shirt         | white  |          4.50 | Solider
          1 | Herbi Vore T-Shirt         | black  |          4.50 | Solider
          1 | Herbi Vore T-Shirt         | green  |          4.50 | Solider
          1 | Herbi Vore T-Shirt         | yellow |          4.50 | Solider
          2 | Wildlife Adventure T-Shirt | white  |          4.25 | Solider
          2 | Wildlife Adventure T-Shirt | black  |          4.25 | Solider
          2 | Wildlife Adventure T-Shirt | grey   |          4.25 | Solider
          2 | Wildlife Adventure T-Shirt | yellow |          4.25 | Solider
          2 | Wildlife Adventure T-Shirt | violet |          4.25 | Solider
(9 rows)

-----------------------------------------------

SELECT  p.product_id, 
        p.product_name, 
        c.color, 
        p.product_price, 
        COALESCE(ROUND(avg_reviews.review_rating, 2), 0) as review_rating, 
        s.seller_name,
        s.seller_rating
FROM products p 
JOIN products_colors pc ON pc.product_id = p.product_id 
LEFT JOIN colors c ON c.color_id = pc.color_id 
LEFT JOIN (
  SELECT product_id, AVG(review_rating) as review_rating 
  FROM reviews 
  GROUP BY product_id
) as avg_reviews ON avg_reviews.product_id = p.product_id 
JOIN sellers s ON s.seller_id = p.product_seller_id 
WHERE p.product_id=1
ORDER BY p.product_id;

 product_id |        product_name        | color  | product_price | review_rating | seller_name | seller_rating 
------------+----------------------------+--------+---------------+---------------+-------------+---------------
          1 | Herbi Vore T-Shirt         | white  |           359 |          4.50 | Solider     |         4.375
          1 | Herbi Vore T-Shirt         | black  |           359 |          4.50 | Solider     |         4.375
          1 | Herbi Vore T-Shirt         | green  |           359 |          4.50 | Solider     |         4.375
          1 | Herbi Vore T-Shirt         | yellow |           359 |          4.50 | Solider     |         4.375
          2 | Wildlife Adventure T-Shirt | white  |            24 |          4.25 | Solider     |         4.375
          2 | Wildlife Adventure T-Shirt | black  |            24 |          4.25 | Solider     |         4.375
          2 | Wildlife Adventure T-Shirt | grey   |            24 |          4.25 | Solider     |         4.375
          2 | Wildlife Adventure T-Shirt | yellow |            24 |          4.25 | Solider     |         4.375
          2 | Wildlife Adventure T-Shirt | violet |            24 |          4.25 | Solider     |         4.375
(9 rows)

-------------------------------------------------
-- SUM of all products of seller
SELECT s.seller_name, COUNT(p.product_id) AS product_count
FROM sellers s
JOIN products p ON s.seller_id = p.product_seller_id
GROUP BY s.seller_name;
------