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
    seller_photo        varchar(100) NOT NULL,
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

CREATE TABLE colors (
    color_id            serial PRIMARY KEY,
    color               varchar(20)
);
CREATE TABLE sizes (
    size_id            serial PRIMARY KEY,
    size               varchar(5)
);
CREATE TABLE prod_types (
    prod_type_id       serial PRIMARY KEY,
    prod_type          varchar(15)
);

CREATE TABLE products (
    product_id          serial PRIMARY KEY,
    is_base_product     boolean,
    base_id             integer,
    product_name        varchar(100) NOT NULL,
    product_type        integer REFERENCES prod_types(prod_type_id) , -- Clothes / Cups / Keyholders
    product_description text,
    product_size        integer REFERENCES sizes(size_id) ,
    product_color       integer REFERENCES colors(color_id),
    product_price       real,
    sku                 varchar(20), -- product_seller_id-base_id-product_size-product_color
    product_seller_id   integer REFERENCES sellers(seller_id) NOT NULL,
    create_user_id      integer,
    update_user_id      integer,
    create_datetime     timestamp NOT NULL,
    update_datetime     timestamp NOT NULL  
);
-- CREATE TABLE products (
--     product_id          serial PRIMARY KEY,
--     product_name        varchar(100) NOT NULL,
--     product_type        varchar(30) NOT NULL, -- Clothes / Cups / Keyholders
--     product_description text,
--     product_size        varchar(5) NOT NULL,
--     product_price       real,
--     product_seller_id   integer REFERENCES sellers(seller_id) NOT NULL,
--     create_user_id      integer,
--     update_user_id      integer,
--     create_datetime     timestamp NOT NULL,
--     update_datetime     timestamp NOT NULL  
-- );

CREATE TABLE products_images (
    products_images_id  serial PRIMARY KEY,
    product_id          integer REFERENCES products(product_id),
    color_id            integer REFERENCES colors(color_id),
    products_images     varchar(200)
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
    address_line_PRIMARYPRIMARY2      varchar(50),
    city                varchar(50) NOT NULL,
    country             varchar(50) NOT NULL,
    region              varchar(50) NOT NULL,
    zip                 varchar(10) NOT NULL    
);

CREATE TABLE orders (
    order_id            serial PRIMARY KEY,
    shipping_info_id    integer REFERENCES shipping_info(shipping_info_id),
    payment_id          integer REFERENCES payments(payment_id ),
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
CREATE TABLE payments (
    payment_id          serial PRIMARY KEY,
    paymentgateway_order_id     varchar(30),
    payment_processer_responce		text
);
CREATE TABLE newslist_emails (
    newslist_email_id   serial PRIMARY KEY,
    newslist_email      varchar(30)
);

CREATE TABLE contact_us (
    id                  SERIAL PRIMARY KEY,
    first_name          VARCHAR(50),
    last_name           VARCHAR(50),
    email               VARCHAR(100),
    phone               VARCHAR(20),
    message             TEXT
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
(1,1 ), (2, 1),(5, 1),(4, 1),(6, 1),
(1, 3),(2, 3),(3, 3),(4, 3),
(1, 4), (2, 4),(5, 4),(4, 4),(6, 4),
(1, 5),(2, 5),(3, 5),(4, 5),
(1, 6), (2, 6),(5, 6),(4, 6),(6, 6),
(1, 7),(2, 7),(3, 7),(4, 7),
(1, 8), (2, 8),(5, 8),(4, 8),(6, 8),
(1, 9),(2, 9),(3, 9),(4, 9),
(1, ), (2, ),(5, ),(4, ),(6, ),
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

 insert into prod_types values 
 ( 1, 'CLothes' ),
 ( 2, 'Cups' ),
 ( 3, 'Keyholders' );

-- ADD PHOTOS TO DB
insert into products_images( product_id, product_image, color_id) values
( 63, '/public/product_images/10/black.png', 2),
( 63, '/public/product_images/10/white.png', 1),
( 63, '/public/product_images/10/yellow.png', 4),
( 63, '/public/product_images/10/grey.png', 5),
( 63, '/public/product_images/10/grey.png', 5);
( 80, '/public/product_images/9/black.png', 2),
( 80, '/public/product_images/9/white.png', 1),
( 80, '/public/product_images/9/yellow.png', 4),
( 80, '/public/product_images/9/grey.png', 5);
( 93, '/public/product_images/5/black.png', 2),
( 93, '/public/product_images/5/white.png', 1),
( 93, '/public/product_images/5/yellow.png', 4),
( 93, '/public/product_images/5/grey.png', 5),
( 106, '/public/product_images/6/black.png', 2),
( 106, '/public/product_images/6/white.png', 1),
( 106, '/public/product_images/6/yellow.png', 4),
( 106, '/public/product_images/6/grey.png', 5);
( 7, '/public/product_images/7/black.png', 2),
( 7, '/public/product_images/7/white.png', 1),
( 7, '/public/product_images/7/yellow.png', 4),
( 7, '/public/product_images/7/grey.png', 5),
( 8, '/public/product_images/8/black.png', 2),
( 8, '/public/product_images/8/white.png', 1),
( 8, '/public/product_images/8/yellow.png', 4),
( 8, '/public/product_images/8/grey.png', 5),
( 1, '/public/product_images/1/black.png', 2),
( 1, '/public/product_images/1/white.png', 1),
( 1, '/public/product_images/1/yellow.png', 4),
( 1, '/public/product_images/1/grey.png', 5),
( 1, '/public/product_images/1/grey.png', 5);
( 2, '/public/product_images/2/green.png', 3),
( 2, '/public/product_images/2/white.png', 1),
( 2, '/public/product_images/2/yellow.png', 4),
( 2, '/public/product_images/2/grey.png', 5);
( 3, '/public/product_images/3/black.png', 2),
( 3, '/public/product_images/3/white.png', 1),
( 3, '/public/product_images/3/yellow.png', 4),
( 3, '/public/product_images/3/grey.png', 5),
( 4, '/public/product_images/4/black.png', 2),
( 4, '/public/product_images/4/white.png', 1),
( 4, '/public/product_images/4/green.png', 3),
( 4, '/public/product_images/4/grey.png', 5);


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


 insert into sizes values 
 ( 1, 'XS' ),
 ( 2, 'S' ),
 ( 3, 'M' ),
 ( 4, 'L' ),
 ( 5, 'XL' ),
 ( 6, 'XXL' );

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

SELECT 
  p.product_id, 
  p.product_name, 
  c.color as color_name,
  pi.image,
  p.seller,
  p.price
FROM products p
INNER JOIN colors c ON p.product_id = c.product_id
INNER JOIN product_image pi ON pi.product_id = c.product_id;
-----------------------------------------------
SELECT 
    p.product_id AS id,
    p.product_name AS name,
    c.color AS color_name,
    pi.products_images AS image,
    s.seller_name AS seller,
    p.product_price AS price
FROM products p
INNER JOIN colors c ON c.color_id = p.product_color  JOIN products_images pi ON pi.color_id = p.product_color AND pi.product_id = p.product_id
INNER JOIN sellers s ON s.seller_id = p.product_seller_id
WHERE p.is_base_product = true
AND p.product_id IN (
    SELECT product_id FROM colors WHERE is_base_product = false AND base_id = p.product_id
);


-------------------------------------
marketplacedb=> SELECT json_object_agg(size, colors) as size_colors
FROM (
  SELECT DISTINCT ss.size, array_agg(c.color) as colors
  FROM products p
  JOIN sizes ss ON ss.size_id = p.product_size
  JOIN colors c ON c.color_id = p.product_color  
  WHERE p.base_id = 80 
  GROUP BY ss.size, c.color
) as sizes
GROUP BY sizes.size;
                                 size_colors                                 
-----------------------------------------------------------------------------
 { "L" : ["green"], "L" : ["grey"], "L" : ["violet"], "L" : ["yellow"] }
 { "S" : ["green"], "S" : ["grey"], "S" : ["violet"], "S" : ["yellow"] }
 { "XL" : ["green"], "XL" : ["grey"], "XL" : ["violet"], "XL" : ["yellow"] }
(3 rows)



---------------------------------------
marketplacedb=> SELECT json_object_agg(size, colors) as size_colors
FROM (
  SELECT ss.size, array_agg(c.color) as colors
  FROM products p
  JOIN sizes ss ON ss.size_id = p.product_size
  JOIN colors c ON c.color_id = p.product_color  
  WHERE p.base_id = 80 
  GROUP BY ss.size
) as sizes;
                                                            size_colors                                                            
-----------------------------------------------------------------------------------------------------------------------------------
 { "L" : ["yellow","grey","violet","green"], "S" : ["green","violet","grey","yellow"], "XL" : ["grey","green","yellow","violet"] }
(1 row)

---------------------------------------
marketplacedb=> select DISTINCT ss.size from products p join sizes ss on ss.size_id = p.product_size where p.is_base_product = false and p.base_id = 63;
 size 
------
 S
 XS
 XL
 L
(4 rows)





SELECT p.product_id, 
    p.product_name, 
    p.product_description,
    (SELECT json_agg(json_build_object('color', colors.color, 'product_image', pi.products_images))
     FROM (SELECT DISTINCT v.product_color FROM products v WHERE v.base_id = p.product_id AND v.is_base_product = false) AS v
     JOIN colors ON colors.color_id = v.product_color
     JOIN products_images pi ON pi.product_id = p.product_id AND pi.color_id = v.product_color
    ) AS colors,
    (SELECT json_object_agg(colors, size) as size_colors
    FROM (
      SELECT c.color, array_agg(ss.size) as sizes
      FROM products p
      JOIN sizes ss ON ss.size_id = p.product_size
      JOIN colors c ON c.color_id = p.product_color  
      WHERE p.base_id = 106
      GROUP BY c.color
    ) as colors) as size_color,
    ( select array_agg( DISTINCT ss.size )
      from products p 
      join sizes ss on ss.size_id = p.product_size 
      where p.is_base_product = false and p.base_id = 106)   as sizes,
    s.seller_name,
    p.product_seller_id as seller_id,
    p.product_price,
    (SELECT json_object_agg(size, size_id) 
    as sizes FROM sizes) as sku_size,
    (SELECT json_object_agg(color, color_id) 
    as colors FROM colors) as sku_color
FROM products p 
JOIN sellers s ON s.seller_id = p.product_seller_id
WHERE p.product_id = 106 AND p.is_base_product = true
GROUP BY p.product_id, p.product_name, s.seller_name, p.product_price;


SELECT p.product_id, 
    p.product_name, 
    p.product_description,
    json_object_agg(colors.color, size_colors.sizes) AS colors,
    json_object_agg(size, colors) as size_color,
    array_agg(DISTINCT ss.size ORDER BY ss.size) as sizes,
    s.seller_name,
    p.product_seller_id as seller_id,
    p.product_price,
    (SELECT json_object_agg(size, size_id) 
    as sizes FROM sizes) as sku_size,
    (SELECT json_object_agg(color, color_id) 
    as colors FROM colors) as sku_color
FROM products p 
JOIN sellers s ON s.seller_id = p.product_seller_id
JOIN (
  SELECT v.product_id, colors.color, json_object_agg(sizes.size, colors.color) as sizes
  FROM (SELECT DISTINCT v.product_id, v.product_color FROM products v WHERE v.is_base_product = false) AS v
  JOIN colors ON colors.color_id = v.product_color
  JOIN (
    SELECT DISTINCT p.product_id, sizes.size, c.color
    FROM products p
    JOIN sizes ON sizes.size_id = p.product_size
    JOIN colors c ON c.color_id = p.product_color
    WHERE p.is_base_product = false
  ) AS colors ON colors.product_id = v.product_id AND colors.color = colors.color
  JOIN sizes ON sizes.size = colors.size
  GROUP BY v.product_id, colors.color
) AS size_colors ON size_colors.product_id = p.product_id
JOIN (
  SELECT DISTINCT p.base_id, ss.size, c.color
  FROM products p 
  JOIN sizes ss ON ss.size_id = p.product_size 
  JOIN colors c ON c.color_id = p.product_color  
  WHERE p.is_base_product = false
) as sizes ON sizes.base_id = p.base_id
GROUP BY p.product_id, p.product_name, p.product_description, s.seller_name, p.product_price;

SELECT p.product_id, 
    p.product_name, 
    p.product_description,
    (SELECT json_agg(json_build_object('color', colors.color, 'product_image', pi.products_images))
     FROM (SELECT DISTINCT v.product_color FROM products v WHERE v.base_id = p.product_id AND v.is_base_product = false) AS v
     JOIN colors ON colors.color_id = v.product_color
     JOIN products_images pi ON pi.product_id = p.product_id AND pi.color_id = v.product_color
    ) AS colors,
    (SELECT json_object_agg(size, colors) as size_colors
    FROM (
      SELECT ss.size, array_agg(c.color) as colors
      FROM products p
      JOIN sizes ss ON ss.size_id = p.product_size
      JOIN colors c ON c.color_id = p.product_color  
      WHERE p.base_id = $1 
      GROUP BY ss.size
    ) as sizes) as size_color,
    ( select array_agg( DISTINCT ss.size )
      from products p 
      join sizes ss on ss.size_id = p.product_size 
      where p.is_base_product = false and p.base_id = $1)   as sizes,
    s.seller_name,
    p.product_seller_id as seller_id,
    p.product_price,
    (SELECT json_object_agg(size, size_id) 
    as sizes FROM sizes) as sku_size,
    (SELECT json_object_agg(color, color_id) 
    as colors FROM colors) as sku_color
FROM products p 
JOIN sellers s ON s.seller_id = p.product_seller_id
WHERE p.product_id = $1 AND p.is_base_product = true
GROUP BY p.product_id, p.product_name, s.seller_name, p.product_price;