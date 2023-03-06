--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Ubuntu 14.7-1.pgdg22.10+1)
-- Dumped by pg_dump version 14.7 (Ubuntu 14.7-1.pgdg22.10+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: blog; Type: TABLE; Schema: public; Owner: printmall
--

CREATE TABLE public.blog (
    blog_id integer NOT NULL,
    ua_blog_title character varying(100) NOT NULL,
    en_blog_title character varying(50) NOT NULL,
    ua_blog_text text,
    en_blog_text text,
    blog_image character varying(100) NOT NULL,
    create_user_id integer,
    update_user_id integer,
    create_datetime timestamp without time zone,
    update_datetime timestamp without time zone
);


ALTER TABLE public.blog OWNER TO printmall;

--
-- Name: blog_blog_id_seq; Type: SEQUENCE; Schema: public; Owner: printmall
--

CREATE SEQUENCE public.blog_blog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_blog_id_seq OWNER TO printmall;

--
-- Name: blog_blog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: printmall
--

ALTER SEQUENCE public.blog_blog_id_seq OWNED BY public.blog.blog_id;


--
-- Name: colors; Type: TABLE; Schema: public; Owner: printmall
--

CREATE TABLE public.colors (
    color_id integer NOT NULL,
    color character varying(20)
);


ALTER TABLE public.colors OWNER TO printmall;

--
-- Name: colors_color_id_seq; Type: SEQUENCE; Schema: public; Owner: printmall
--

CREATE SEQUENCE public.colors_color_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.colors_color_id_seq OWNER TO printmall;

--
-- Name: colors_color_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: printmall
--

ALTER SEQUENCE public.colors_color_id_seq OWNED BY public.colors.color_id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: printmall
--

CREATE TABLE public.products (
    product_id integer NOT NULL,
    product_name character varying(100) NOT NULL,
    product_discription text,
    product_size character varying(5) NOT NULL,
    product_price real,
    product_seller_id integer NOT NULL,
    create_user_id integer,
    update_user_id integer,
    create_datetime timestamp without time zone NOT NULL,
    update_datetime timestamp without time zone NOT NULL
);


ALTER TABLE public.products OWNER TO printmall;

--
-- Name: products_colors; Type: TABLE; Schema: public; Owner: printmall
--

CREATE TABLE public.products_colors (
    color_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.products_colors OWNER TO printmall;

--
-- Name: products_images; Type: TABLE; Schema: public; Owner: printmall
--

CREATE TABLE public.products_images (
    products_images_id integer NOT NULL,
    product_id integer,
    product_image character varying(200),
    color_id integer
);


ALTER TABLE public.products_images OWNER TO printmall;

--
-- Name: products_images_products_images_id_seq; Type: SEQUENCE; Schema: public; Owner: printmall
--

CREATE SEQUENCE public.products_images_products_images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_images_products_images_id_seq OWNER TO printmall;

--
-- Name: products_images_products_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: printmall
--

ALTER SEQUENCE public.products_images_products_images_id_seq OWNED BY public.products_images.products_images_id;


--
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: printmall
--

CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_id_seq OWNER TO printmall;

--
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: printmall
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: printmall
--

CREATE TABLE public.reviews (
    review_id integer NOT NULL,
    product_id integer,
    user_id integer,
    review_text text,
    review_rating integer NOT NULL,
    review_agry_flag boolean DEFAULT false,
    review_date timestamp without time zone NOT NULL,
    CONSTRAINT reviews_review_rating_check CHECK ((((review_rating)::numeric >= (1)::numeric) AND ((review_rating)::numeric <= (5)::numeric)))
);


ALTER TABLE public.reviews OWNER TO printmall;

--
-- Name: reviews_review_id_seq; Type: SEQUENCE; Schema: public; Owner: printmall
--

CREATE SEQUENCE public.reviews_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_review_id_seq OWNER TO printmall;

--
-- Name: reviews_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: printmall
--

ALTER SEQUENCE public.reviews_review_id_seq OWNED BY public.reviews.review_id;


--
-- Name: sellers; Type: TABLE; Schema: public; Owner: printmall
--

CREATE TABLE public.sellers (
    seller_id integer NOT NULL,
    seller_name character varying(16) NOT NULL,
    seller_email character varying(100) NOT NULL,
    seller_photo character varying(16) NOT NULL,
    seller_cover_image character varying(100),
    seller_products integer,
    seller_password character varying(200) NOT NULL,
    seller_billing character varying,
    seller_blocked boolean DEFAULT false,
    seller_email_varified boolean DEFAULT false,
    seller_access_token character varying(200),
    seller_refresh_token character varying(200),
    create_user_id integer,
    update_user_id integer,
    create_datetime timestamp without time zone NOT NULL,
    update_datetime timestamp without time zone NOT NULL,
    seller_rating real,
    seller_announcement character varying(350)
);


ALTER TABLE public.sellers OWNER TO printmall;

--
-- Name: sellers_seller_id_seq; Type: SEQUENCE; Schema: public; Owner: printmall
--

CREATE SEQUENCE public.sellers_seller_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sellers_seller_id_seq OWNER TO printmall;

--
-- Name: sellers_seller_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: printmall
--

ALTER SEQUENCE public.sellers_seller_id_seq OWNED BY public.sellers.seller_id;


--
-- Name: user_adress; Type: TABLE; Schema: public; Owner: printmall
--

CREATE TABLE public.user_adress (
    user_adress_id integer NOT NULL,
    user_id integer,
    user_adress_state character varying(20) NOT NULL,
    user_adress_city character varying(20) NOT NULL,
    user_adress_zip character varying(20) NOT NULL,
    user_adress_street character varying(100) NOT NULL,
    user_adress_house character varying(20) NOT NULL,
    user_adress_appartment character varying(10) NOT NULL
);


ALTER TABLE public.user_adress OWNER TO printmall;

--
-- Name: user_adress_user_adress_id_seq; Type: SEQUENCE; Schema: public; Owner: printmall
--

CREATE SEQUENCE public.user_adress_user_adress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_adress_user_adress_id_seq OWNER TO printmall;

--
-- Name: user_adress_user_adress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: printmall
--

ALTER SEQUENCE public.user_adress_user_adress_id_seq OWNED BY public.user_adress.user_adress_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: printmall
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    user_name character varying(16) NOT NULL,
    user_surname character varying(16) NOT NULL,
    user_email character varying(100) NOT NULL,
    user_password character varying(200) NOT NULL,
    user_avatar character varying(200) NOT NULL,
    user_payment_method integer,
    user_blocked boolean DEFAULT false,
    user_email_varified boolean DEFAULT false,
    user_access_token character varying(200),
    user_refresh_token character varying(200),
    create_user_id integer,
    update_user_id integer,
    create_datetime timestamp without time zone NOT NULL,
    update_datetime timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO printmall;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: printmall
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO printmall;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: printmall
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: blog blog_id; Type: DEFAULT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.blog ALTER COLUMN blog_id SET DEFAULT nextval('public.blog_blog_id_seq'::regclass);


--
-- Name: colors color_id; Type: DEFAULT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.colors ALTER COLUMN color_id SET DEFAULT nextval('public.colors_color_id_seq'::regclass);


--
-- Name: products product_id; Type: DEFAULT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- Name: products_images products_images_id; Type: DEFAULT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.products_images ALTER COLUMN products_images_id SET DEFAULT nextval('public.products_images_products_images_id_seq'::regclass);


--
-- Name: reviews review_id; Type: DEFAULT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.reviews ALTER COLUMN review_id SET DEFAULT nextval('public.reviews_review_id_seq'::regclass);


--
-- Name: sellers seller_id; Type: DEFAULT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.sellers ALTER COLUMN seller_id SET DEFAULT nextval('public.sellers_seller_id_seq'::regclass);


--
-- Name: user_adress user_adress_id; Type: DEFAULT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.user_adress ALTER COLUMN user_adress_id SET DEFAULT nextval('public.user_adress_user_adress_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: blog; Type: TABLE DATA; Schema: public; Owner: printmall
--

COPY public.blog (blog_id, ua_blog_title, en_blog_title, ua_blog_text, en_blog_text, blog_image, create_user_id, update_user_id, create_datetime, update_datetime) FROM stdin;
1	Мій новий пост	My New post	Об’єкт app має набір функцій, які приєднують зворотні виклики до HTTP-запитів, що виконуються за вказаними шляхами, як у прикладах вище з app.get і app.post. Ви також можете приєднати зворотні виклики до інших методів HTTP, таких як POST, PUT, PATCH і DELETE. Ви можете дивитися вгору	The app object has a set of functions that attach callbacks to HTTP requests performed to specified paths, just like the examples above with app.get and app.post. You can also attach callbacks to other HTTP methods like POST, PUT, PATCH and DELETE. You can look up	/home/kaieta/Downloads/lviv.jpg	1	1	2023-03-03 00:46:14.411	2023-03-03 00:46:14.411
\.


--
-- Data for Name: colors; Type: TABLE DATA; Schema: public; Owner: printmall
--

COPY public.colors (color_id, color) FROM stdin;
1	white
2	black
3	green
4	yellow
5	grey
6	violet
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: printmall
--

COPY public.products (product_id, product_name, product_discription, product_size, product_price, product_seller_id, create_user_id, update_user_id, create_datetime, update_datetime) FROM stdin;
1	Herbi Vore T-Shirt	Classic cut T-shirt for men, 100% cotton (Heather gray and heather ice blue are 95% cotton/5% viscose. Heather blue & charcoal gray are 80% cotton/20% polyester. Heather burgundy is 60% cotton/40% polyester. Heather oatmeal is 99% cotton/1% viscose) Brand: Spreadshirt	M	359	2	1	1	2023-03-04 16:30:46.207	2023-03-04 16:30:46.207
2	Wildlife Adventure T-Shirt	Classic cut T-shirt for men, 100% cotton (Heather gray and heather ice blue are 95% cotton/5% viscose. Heather blue & charcoal gray are 80% cotton/20% polyester. Heather burgundy is 60% cotton/40% polyester. Heather oatmeal is 99% cotton/1% viscose) Brand: Spreadshirt	L	24	2	1	1	2023-03-04 16:32:46.495	2023-03-04 16:32:46.495
3	Bohemian Style Graphic Tee T-Shirt Collection	Classic cut T-shirt for men, 100% cotton (Heather gray and heather ice blue are 95% cotton/5% viscose. Heather blue & charcoal gray are 80% cotton/20% polyester. Heather burgundy is 60% cotton/40% polyester. Heather oatmeal is 99% cotton/1% viscose) Brand: Spreadshirt	XL	63	2	1	1	2023-03-06 21:30:22.675	2023-03-06 21:30:22.675
4	Mountain Explorer Graphic Tee	Classic cut T-shirt for men, 100% cotton (Heather gray and heather ice blue are 95% cotton/5% viscose. Heather blue & charcoal gray are 80% cotton/20% polyester. Heather burgundy is 60% cotton/40% polyester. Heather oatmeal is 99% cotton/1% viscose) Brand: Spreadshirt	L	42	2	1	1	2023-03-06 21:30:51.317	2023-03-06 21:30:51.317
5	Floral Burst Tank Top	Classic cut T-shirt for men, 100% cotton (Heather gray and heather ice blue are 95% cotton/5% viscose. Heather blue & charcoal gray are 80% cotton/20% polyester. Heather burgundy is 60% cotton/40% polyester. Heather oatmeal is 99% cotton/1% viscose) Brand: Spreadshirt	S	65	2	1	1	2023-03-06 21:31:13.83	2023-03-06 21:31:13.83
6	Ocean View Tee	Classic cut T-shirt for men, 100% cotton (Heather gray and heather ice blue are 95% cotton/5% viscose. Heather blue & charcoal gray are 80% cotton/20% polyester. Heather burgundy is 60% cotton/40% polyester. Heather oatmeal is 99% cotton/1% viscose) Brand: Spreadshirt	XS	65	2	1	1	2023-03-06 21:31:31.903	2023-03-06 21:31:31.903
7	DesignGenius	Classic cut T-shirt for men, 100% cotton (Heather gray and heather ice blue are 95% cotton/5% viscose. Heather blue & charcoal gray are 80% cotton/20% polyester. Heather burgundy is 60% cotton/40% polyester. Heather oatmeal is 99% cotton/1% viscose) Brand: Spreadshirt	M	54	2	1	1	2023-03-06 21:31:51.997	2023-03-06 21:31:51.997
8	ColorBlockClothing	Classic cut T-shirt for men, 100% cotton (Heather gray and heather ice blue are 95% cotton/5% viscose. Heather blue & charcoal gray are 80% cotton/20% polyester. Heather burgundy is 60% cotton/40% polyester. Heather oatmeal is 99% cotton/1% viscose) Brand: Spreadshirt	M	48	2	1	1	2023-03-06 21:32:03.299	2023-03-06 21:32:03.299
9	TeeArtistry	Classic cut T-shirt for men, 100% cotton (Heather gray and heather ice blue are 95% cotton/5% viscose. Heather blue & charcoal gray are 80% cotton/20% polyester. Heather burgundy is 60% cotton/40% polyester. Heather oatmeal is 99% cotton/1% viscose) Brand: Spreadshirt	M	48	2	1	1	2023-03-06 21:32:10.886	2023-03-06 21:32:10.886
10	Tee Artistry Tenis	Classic cut T-shirt for men, 100% cotton (Heather gray and heather ice blue are 95% cotton/5% viscose. Heather blue & charcoal gray are 80% cotton/20% polyester. Heather burgundy is 60% cotton/40% polyester. Heather oatmeal is 99% cotton/1% viscose) Brand: Spreadshirt	XXL	68	2	1	1	2023-03-06 21:35:06.298	2023-03-06 21:35:06.298
\.


--
-- Data for Name: products_colors; Type: TABLE DATA; Schema: public; Owner: printmall
--

COPY public.products_colors (color_id, product_id) FROM stdin;
1	1
2	1
3	1
4	1
1	2
2	2
5	2
4	2
6	2
1	3
2	3
3	3
4	3
1	4
2	4
5	4
4	4
6	4
1	5
2	5
3	5
4	5
1	6
2	6
5	6
4	6
6	6
1	7
2	7
3	7
4	7
1	8
2	8
5	8
4	8
6	8
1	9
2	9
3	9
4	9
1	10
2	10
5	10
4	10
6	10
\.


--
-- Data for Name: products_images; Type: TABLE DATA; Schema: public; Owner: printmall
--

COPY public.products_images (products_images_id, product_id, product_image, color_id) FROM stdin;
9	1	/public/product_images/1/black.png	2
10	1	/public/product_images/1/white.png	1
11	1	/public/product_images/1/green.png	3
12	1	/public/product_images/1/yellow.png	4
13	2	/public/product_images/2/black.png	2
14	2	/public/product_images/2/white.png	1
15	2	/public/product_images/2/yellow.png	4
16	2	/public/product_images/2/grey.png	5
41	3	/public/product_images/3/black.png	2
42	3	/public/product_images/3/white.png	1
43	3	/public/product_images/3/yellow.png	4
44	3	/public/product_images/3/grey.png	5
45	4	/public/product_images/4/black.png	2
46	4	/public/product_images/4/white.png	1
47	4	/public/product_images/4/yellow.png	4
48	4	/public/product_images/4/grey.png	5
49	5	/public/product_images/5/black.png	2
50	5	/public/product_images/5/white.png	1
51	5	/public/product_images/5/yellow.png	4
52	5	/public/product_images/5/grey.png	5
53	6	/public/product_images/6/black.png	2
54	6	/public/product_images/6/white.png	1
55	6	/public/product_images/6/yellow.png	4
56	6	/public/product_images/6/grey.png	5
57	7	/public/product_images/7/black.png	2
58	7	/public/product_images/7/white.png	1
59	7	/public/product_images/7/yellow.png	4
60	7	/public/product_images/7/grey.png	5
61	8	/public/product_images/8/black.png	2
62	8	/public/product_images/8/white.png	1
63	8	/public/product_images/8/yellow.png	4
64	8	/public/product_images/8/grey.png	5
65	9	/public/product_images/9/black.png	2
66	9	/public/product_images/9/white.png	1
67	9	/public/product_images/9/yellow.png	4
68	9	/public/product_images/9/grey.png	5
69	10	/public/product_images/10/black.png	2
70	10	/public/product_images/10/white.png	1
71	10	/public/product_images/10/yellow.png	4
72	10	/public/product_images/10/grey.png	5
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: printmall
--

COPY public.reviews (review_id, product_id, user_id, review_text, review_rating, review_agry_flag, review_date) FROM stdin;
1	1	1	very good product	5	f	2023-03-05 10:52:40
2	1	1	very wonderfull t-shirt	4	f	2023-02-05 08:52:38
3	1	1	very good product	5	f	2023-03-07 04:32:40
4	1	1	very good product	4	f	2023-02-15 08:52:38
5	2	1	very good product	5	f	2023-02-12 11:52:38
6	2	1	nice	4	f	2023-03-12 11:52:38
7	2	1	very good product	5	f	2023-03-12 11:52:38
8	2	1	ok, can be better	3	f	2023-02-25 08:52:38
\.


--
-- Data for Name: sellers; Type: TABLE DATA; Schema: public; Owner: printmall
--

COPY public.sellers (seller_id, seller_name, seller_email, seller_photo, seller_cover_image, seller_products, seller_password, seller_billing, seller_blocked, seller_email_varified, seller_access_token, seller_refresh_token, create_user_id, update_user_id, create_datetime, update_datetime, seller_rating, seller_announcement) FROM stdin;
2	Solider	soleder@gss.com	photo path	cover path	\N	$2b$05$zMYPm38Q8Rgvz5j70ldpjOpE8qpV5FvCQPRc8.aqJON.Jahs4IMpK	\N	f	f	\N	\N	\N	\N	2023-03-04 14:17:03.697	2023-03-04 14:17:03.697	4.375	Hi friend and thanks for stopping by. Our mission is to create a collection neon lighting. We fabricate all of our products by hand.West Ninth Vintage is our pride and joy and it is our priority that it comes through in our work and our customer service. We make products that we love and we hope you do too.
3	go-a	go-a@gss.com	/photo/path	/cover/path	\N	$2b$05$uL/Fr76Je0fMI20CfbMLeOj8cjqOtnGgYExs6M9w1kf0E/eXrq4w.	\N	f	f	\N	\N	\N	\N	2023-03-06 00:24:15.491	2023-03-06 00:24:15.491	\N	\N
4	Go-A	go-a@gss.com	/photo/path	/cover/path	\N	$2b$05$Oursq4ceRykeX44dpd2...ywXKpW0hoo4.TE94LdFhUWvybDkmFm.	\N	f	f	\N	\N	\N	\N	2023-03-06 00:27:47.39	2023-03-06 00:27:47.39	\N	\N
\.


--
-- Data for Name: user_adress; Type: TABLE DATA; Schema: public; Owner: printmall
--

COPY public.user_adress (user_adress_id, user_id, user_adress_state, user_adress_city, user_adress_zip, user_adress_street, user_adress_house, user_adress_appartment) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: printmall
--

COPY public.users (user_id, user_name, user_surname, user_email, user_password, user_avatar, user_payment_method, user_blocked, user_email_varified, user_access_token, user_refresh_token, create_user_id, update_user_id, create_datetime, update_datetime) FROM stdin;
1	John	Senna	jsenna@gss.com	pass	/home/ava	\N	f	f	\N	\N	\N	\N	1970-01-20 13:06:47.151	1970-01-20 13:06:47.151
2	Igor	David	idavid@gss.com	pass	/home/ava	\N	f	f	\N	\N	\N	\N	2023-03-05 11:05:51	2023-03-05 11:05:51
\.


--
-- Name: blog_blog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: printmall
--

SELECT pg_catalog.setval('public.blog_blog_id_seq', 1, true);


--
-- Name: colors_color_id_seq; Type: SEQUENCE SET; Schema: public; Owner: printmall
--

SELECT pg_catalog.setval('public.colors_color_id_seq', 1, false);


--
-- Name: products_images_products_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: printmall
--

SELECT pg_catalog.setval('public.products_images_products_images_id_seq', 72, true);


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: printmall
--

SELECT pg_catalog.setval('public.products_product_id_seq', 10, true);


--
-- Name: reviews_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: printmall
--

SELECT pg_catalog.setval('public.reviews_review_id_seq', 8, true);


--
-- Name: sellers_seller_id_seq; Type: SEQUENCE SET; Schema: public; Owner: printmall
--

SELECT pg_catalog.setval('public.sellers_seller_id_seq', 4, true);


--
-- Name: user_adress_user_adress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: printmall
--

SELECT pg_catalog.setval('public.user_adress_user_adress_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: printmall
--

SELECT pg_catalog.setval('public.users_user_id_seq', 2, true);


--
-- Name: blog blog_pkey; Type: CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.blog
    ADD CONSTRAINT blog_pkey PRIMARY KEY (blog_id);


--
-- Name: colors colors_pkey; Type: CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.colors
    ADD CONSTRAINT colors_pkey PRIMARY KEY (color_id);


--
-- Name: products_colors product_colors_pk; Type: CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.products_colors
    ADD CONSTRAINT product_colors_pk PRIMARY KEY (color_id, product_id);


--
-- Name: products_images products_images_pkey; Type: CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.products_images
    ADD CONSTRAINT products_images_pkey PRIMARY KEY (products_images_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (review_id);


--
-- Name: sellers sellers_pkey; Type: CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.sellers
    ADD CONSTRAINT sellers_pkey PRIMARY KEY (seller_id);


--
-- Name: user_adress user_adress_pkey; Type: CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.user_adress
    ADD CONSTRAINT user_adress_pkey PRIMARY KEY (user_adress_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: products_colors products_colors_color_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.products_colors
    ADD CONSTRAINT products_colors_color_id_fkey FOREIGN KEY (color_id) REFERENCES public.colors(color_id);


--
-- Name: products_colors products_colors_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.products_colors
    ADD CONSTRAINT products_colors_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- Name: products_images products_images_color_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.products_images
    ADD CONSTRAINT products_images_color_id_fkey FOREIGN KEY (color_id) REFERENCES public.colors(color_id);


--
-- Name: products_images products_images_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.products_images
    ADD CONSTRAINT products_images_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- Name: products products_product_seller_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_product_seller_id_fkey FOREIGN KEY (product_seller_id) REFERENCES public.sellers(seller_id);


--
-- Name: reviews reviews_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- Name: reviews reviews_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: user_adress user_adress_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.user_adress
    ADD CONSTRAINT user_adress_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

