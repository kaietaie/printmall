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
-- Name: cart_product; Type: TABLE; Schema: public; Owner: printmall
--

CREATE TABLE public.cart_product (
    user_cart_id integer,
    product_id integer
);


ALTER TABLE public.cart_product OWNER TO printmall;

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
-- Name: order_lines; Type: TABLE; Schema: public; Owner: printmall
--

CREATE TABLE public.order_lines (
    order_id integer,
    product_id integer,
    item_type character varying(50),
    price real,
    qty integer,
    sub_total integer,
    tax real,
    total real
);


ALTER TABLE public.order_lines OWNER TO printmall;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: printmall
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    shipping_info_id integer,
    payment_id integer,
    finalized boolean DEFAULT false,
    shipped boolean DEFAULT false,
    delivered boolean DEFAULT false
);


ALTER TABLE public.orders OWNER TO printmall;

--
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: printmall
--

CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_order_id_seq OWNER TO printmall;

--
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: printmall
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;


--
-- Name: prod_types; Type: TABLE; Schema: public; Owner: printmall
--

CREATE TABLE public.prod_types (
    prod_type_id integer NOT NULL,
    prod_type character varying(15)
);


ALTER TABLE public.prod_types OWNER TO printmall;

--
-- Name: prod_types_prod_type_id_seq; Type: SEQUENCE; Schema: public; Owner: printmall
--

CREATE SEQUENCE public.prod_types_prod_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prod_types_prod_type_id_seq OWNER TO printmall;

--
-- Name: prod_types_prod_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: printmall
--

ALTER SEQUENCE public.prod_types_prod_type_id_seq OWNED BY public.prod_types.prod_type_id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: printmall
--

CREATE TABLE public.products (
    product_id integer NOT NULL,
    is_base_product boolean,
    base_id integer,
    product_name character varying(100) NOT NULL,
    product_description text,
    product_size integer,
    product_color integer,
    product_price real,
    sku character varying(20),
    product_seller_id integer NOT NULL,
    create_user_id integer,
    update_user_id integer,
    create_datetime timestamp without time zone NOT NULL,
    update_datetime timestamp without time zone NOT NULL,
    product_type integer
);


ALTER TABLE public.products OWNER TO printmall;

--
-- Name: products_images; Type: TABLE; Schema: public; Owner: printmall
--

CREATE TABLE public.products_images (
    products_images_id integer NOT NULL,
    product_id integer,
    color_id integer,
    products_images character varying(200)
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
-- Name: sellers; Type: TABLE; Schema: public; Owner: printmall
--

CREATE TABLE public.sellers (
    seller_id integer NOT NULL,
    seller_name character varying(16) NOT NULL,
    seller_email character varying(100) NOT NULL,
    seller_photo character varying(100) NOT NULL,
    seller_cover_image character varying(100),
    seller_products integer,
    seller_password character varying(200) NOT NULL,
    seller_billing character varying,
    seller_announcement character varying(350),
    seller_blocked boolean DEFAULT false,
    seller_email_varified boolean DEFAULT false,
    seller_access_token character varying(200),
    seller_refresh_token character varying(200),
    create_user_id integer,
    update_user_id integer,
    create_datetime timestamp without time zone NOT NULL,
    update_datetime timestamp without time zone NOT NULL
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
-- Name: shipping_info; Type: TABLE; Schema: public; Owner: printmall
--

CREATE TABLE public.shipping_info (
    shipping_info_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    phone character varying(20) NOT NULL,
    email character varying(100) NOT NULL,
    address_line_1 character varying(50) NOT NULL,
    address_line_2 character varying(50),
    city character varying(50) NOT NULL,
    country character varying(50) NOT NULL,
    region character varying(50) NOT NULL,
    zip character varying(10) NOT NULL
);


ALTER TABLE public.shipping_info OWNER TO printmall;

--
-- Name: shipping_info_shipping_info_id_seq; Type: SEQUENCE; Schema: public; Owner: printmall
--

CREATE SEQUENCE public.shipping_info_shipping_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipping_info_shipping_info_id_seq OWNER TO printmall;

--
-- Name: shipping_info_shipping_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: printmall
--

ALTER SEQUENCE public.shipping_info_shipping_info_id_seq OWNED BY public.shipping_info.shipping_info_id;


--
-- Name: sizes; Type: TABLE; Schema: public; Owner: printmall
--

CREATE TABLE public.sizes (
    size_id integer NOT NULL,
    size character varying(5)
);


ALTER TABLE public.sizes OWNER TO printmall;

--
-- Name: sizes_size_id_seq; Type: SEQUENCE; Schema: public; Owner: printmall
--

CREATE SEQUENCE public.sizes_size_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sizes_size_id_seq OWNER TO printmall;

--
-- Name: sizes_size_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: printmall
--

ALTER SEQUENCE public.sizes_size_id_seq OWNED BY public.sizes.size_id;


--
-- Name: user_cart; Type: TABLE; Schema: public; Owner: printmall
--

CREATE TABLE public.user_cart (
    user_cart_id integer NOT NULL,
    user_session_key character varying(200)
);


ALTER TABLE public.user_cart OWNER TO printmall;

--
-- Name: user_cart_user_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: printmall
--

CREATE SEQUENCE public.user_cart_user_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_cart_user_cart_id_seq OWNER TO printmall;

--
-- Name: user_cart_user_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: printmall
--

ALTER SEQUENCE public.user_cart_user_cart_id_seq OWNED BY public.user_cart.user_cart_id;


--
-- Name: colors color_id; Type: DEFAULT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.colors ALTER COLUMN color_id SET DEFAULT nextval('public.colors_color_id_seq'::regclass);


--
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- Name: prod_types prod_type_id; Type: DEFAULT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.prod_types ALTER COLUMN prod_type_id SET DEFAULT nextval('public.prod_types_prod_type_id_seq'::regclass);


--
-- Name: products product_id; Type: DEFAULT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- Name: products_images products_images_id; Type: DEFAULT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.products_images ALTER COLUMN products_images_id SET DEFAULT nextval('public.products_images_products_images_id_seq'::regclass);


--
-- Name: sellers seller_id; Type: DEFAULT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.sellers ALTER COLUMN seller_id SET DEFAULT nextval('public.sellers_seller_id_seq'::regclass);


--
-- Name: shipping_info shipping_info_id; Type: DEFAULT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.shipping_info ALTER COLUMN shipping_info_id SET DEFAULT nextval('public.shipping_info_shipping_info_id_seq'::regclass);


--
-- Name: sizes size_id; Type: DEFAULT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.sizes ALTER COLUMN size_id SET DEFAULT nextval('public.sizes_size_id_seq'::regclass);


--
-- Name: user_cart user_cart_id; Type: DEFAULT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.user_cart ALTER COLUMN user_cart_id SET DEFAULT nextval('public.user_cart_user_cart_id_seq'::regclass);


--
-- Data for Name: cart_product; Type: TABLE DATA; Schema: public; Owner: printmall
--

COPY public.cart_product (user_cart_id, product_id) FROM stdin;
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
-- Data for Name: order_lines; Type: TABLE DATA; Schema: public; Owner: printmall
--

COPY public.order_lines (order_id, product_id, item_type, price, qty, sub_total, tax, total) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: printmall
--

COPY public.orders (order_id, shipping_info_id, payment_id, finalized, shipped, delivered) FROM stdin;
\.


--
-- Data for Name: prod_types; Type: TABLE DATA; Schema: public; Owner: printmall
--

COPY public.prod_types (prod_type_id, prod_type) FROM stdin;
1	CLothes
2	Cups
3	Keyholders
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: printmall
--

COPY public.products (product_id, is_base_product, base_id, product_name, product_description, product_size, product_color, product_price, sku, product_seller_id, create_user_id, update_user_id, create_datetime, update_datetime, product_type) FROM stdin;
116	f	106	Bohemian Style Graphic Tee T-Shirt Collection	\N	2	4	\N	1-106-2-4	1	1	1	2023-03-12 17:11:47.484	2023-03-12 17:11:47.484	1
117	f	106	Bohemian Style Graphic Tee T-Shirt Collection	\N	5	2	\N	1-106-5-2	1	1	1	2023-03-12 17:11:47.484	2023-03-12 17:11:47.484	1
64	f	63	Tee Artistry Tenis	\N	1	1	\N	1-63-1-1	1	1	1	2023-03-12 11:00:11.767	2023-03-12 11:00:11.767	1
65	f	63	Tee Artistry Tenis	\N	4	3	\N	1-63-4-3	1	1	1	2023-03-12 11:00:11.767	2023-03-12 11:00:11.767	1
66	f	63	Tee Artistry Tenis	\N	4	4	\N	1-63-4-4	1	1	1	2023-03-12 11:00:11.767	2023-03-12 11:00:11.767	1
67	f	63	Tee Artistry Tenis	\N	1	2	\N	1-63-1-2	1	1	1	2023-03-12 11:00:11.767	2023-03-12 11:00:11.767	1
68	f	63	Tee Artistry Tenis	\N	1	3	\N	1-63-1-3	1	1	1	2023-03-12 11:00:11.767	2023-03-12 11:00:11.767	1
69	f	63	Tee Artistry Tenis	\N	1	4	\N	1-63-1-4	1	1	1	2023-03-12 11:00:11.767	2023-03-12 11:00:11.767	1
70	f	63	Tee Artistry Tenis	\N	2	2	\N	1-63-2-2	1	1	1	2023-03-12 11:00:11.767	2023-03-12 11:00:11.767	1
71	f	63	Tee Artistry Tenis	\N	2	3	\N	1-63-2-3	1	1	1	2023-03-12 11:00:11.767	2023-03-12 11:00:11.767	1
72	f	63	Tee Artistry Tenis	\N	5	1	\N	1-63-5-1	1	1	1	2023-03-12 11:00:11.767	2023-03-12 11:00:11.767	1
73	f	63	Tee Artistry Tenis	\N	5	2	\N	1-63-5-2	1	1	1	2023-03-12 11:00:11.767	2023-03-12 11:00:11.767	1
74	f	63	Tee Artistry Tenis	\N	5	3	\N	1-63-5-3	1	1	1	2023-03-12 11:00:11.767	2023-03-12 11:00:11.767	1
75	f	63	Tee Artistry Tenis	\N	5	4	\N	1-63-5-4	1	1	1	2023-03-12 11:00:11.767	2023-03-12 11:00:11.767	1
76	f	63	Tee Artistry Tenis	\N	2	1	\N	1-63-2-1	1	1	1	2023-03-12 11:00:11.767	2023-03-12 11:00:11.767	1
77	f	63	Tee Artistry Tenis	\N	4	1	\N	1-63-4-1	1	1	1	2023-03-12 11:00:11.767	2023-03-12 11:00:11.767	1
78	f	63	Tee Artistry Tenis	\N	2	4	\N	1-63-2-4	1	1	1	2023-03-12 11:00:11.767	2023-03-12 11:00:11.767	1
79	f	63	Tee Artistry Tenis	\N	4	2	\N	1-63-4-2	1	1	1	2023-03-12 11:00:11.767	2023-03-12 11:00:11.767	1
81	f	80	Mountain Explorer Graphic Tee	\N	2	5	\N	1-80-2-5	1	1	1	2023-03-12 17:10:36.419	2023-03-12 17:10:36.419	1
82	f	80	Mountain Explorer Graphic Tee	\N	5	3	\N	1-80-5-3	1	1	1	2023-03-12 17:10:36.419	2023-03-12 17:10:36.419	1
83	f	80	Mountain Explorer Graphic Tee	\N	5	4	\N	1-80-5-4	1	1	1	2023-03-12 17:10:36.419	2023-03-12 17:10:36.419	1
84	f	80	Mountain Explorer Graphic Tee	\N	2	3	\N	1-80-2-3	1	1	1	2023-03-12 17:10:36.419	2023-03-12 17:10:36.419	1
85	f	80	Mountain Explorer Graphic Tee	\N	4	5	\N	1-80-4-5	1	1	1	2023-03-12 17:10:36.419	2023-03-12 17:10:36.419	1
86	f	80	Mountain Explorer Graphic Tee	\N	4	6	\N	1-80-4-6	1	1	1	2023-03-12 17:10:36.419	2023-03-12 17:10:36.419	1
87	f	80	Mountain Explorer Graphic Tee	\N	4	3	\N	1-80-4-3	1	1	1	2023-03-12 17:10:36.419	2023-03-12 17:10:36.419	1
88	f	80	Mountain Explorer Graphic Tee	\N	5	6	\N	1-80-5-6	1	1	1	2023-03-12 17:10:36.419	2023-03-12 17:10:36.419	1
89	f	80	Mountain Explorer Graphic Tee	\N	2	4	\N	1-80-2-4	1	1	1	2023-03-12 17:10:36.419	2023-03-12 17:10:36.419	1
90	f	80	Mountain Explorer Graphic Tee	\N	5	5	\N	1-80-5-5	1	1	1	2023-03-12 17:10:36.419	2023-03-12 17:10:36.419	1
91	f	80	Mountain Explorer Graphic Tee	\N	2	6	\N	1-80-2-6	1	1	1	2023-03-12 17:10:36.419	2023-03-12 17:10:36.419	1
92	f	80	Mountain Explorer Graphic Tee	\N	4	4	\N	1-80-4-4	1	1	1	2023-03-12 17:10:36.419	2023-03-12 17:10:36.419	1
94	f	93	Ocean View Tee	\N	1	5	\N	1-93-1-5	1	1	1	2023-03-12 17:11:15.682	2023-03-12 17:11:15.682	1
95	f	93	Ocean View Tee	\N	4	3	\N	1-93-4-3	1	1	1	2023-03-12 17:11:15.682	2023-03-12 17:11:15.682	1
96	f	93	Ocean View Tee	\N	4	4	\N	1-93-4-4	1	1	1	2023-03-12 17:11:15.682	2023-03-12 17:11:15.682	1
97	f	93	Ocean View Tee	\N	1	1	\N	1-93-1-1	1	1	1	2023-03-12 17:11:15.682	2023-03-12 17:11:15.682	1
98	f	93	Ocean View Tee	\N	1	4	\N	1-93-1-4	1	1	1	2023-03-12 17:11:15.682	2023-03-12 17:11:15.682	1
99	f	93	Ocean View Tee	\N	2	1	\N	1-93-2-1	1	1	1	2023-03-12 17:11:15.682	2023-03-12 17:11:15.682	1
100	f	93	Ocean View Tee	\N	1	3	\N	1-93-1-3	1	1	1	2023-03-12 17:11:15.682	2023-03-12 17:11:15.682	1
101	f	93	Ocean View Tee	\N	2	4	\N	1-93-2-4	1	1	1	2023-03-12 17:11:15.682	2023-03-12 17:11:15.682	1
102	f	93	Ocean View Tee	\N	2	3	\N	1-93-2-3	1	1	1	2023-03-12 17:11:15.682	2023-03-12 17:11:15.682	1
103	f	93	Ocean View Tee	\N	4	5	\N	1-93-4-5	1	1	1	2023-03-12 17:11:15.682	2023-03-12 17:11:15.682	1
104	f	93	Ocean View Tee	\N	2	5	\N	1-93-2-5	1	1	1	2023-03-12 17:11:15.682	2023-03-12 17:11:15.682	1
105	f	93	Ocean View Tee	\N	4	1	\N	1-93-4-1	1	1	1	2023-03-12 17:11:15.682	2023-03-12 17:11:15.682	1
107	f	106	Bohemian Style Graphic Tee T-Shirt Collection	\N	1	5	\N	1-106-1-5	1	1	1	2023-03-12 17:11:47.484	2023-03-12 17:11:47.484	1
108	f	106	Bohemian Style Graphic Tee T-Shirt Collection	\N	3	2	\N	1-106-3-2	1	1	1	2023-03-12 17:11:47.484	2023-03-12 17:11:47.484	1
109	f	106	Bohemian Style Graphic Tee T-Shirt Collection	\N	3	4	\N	1-106-3-4	1	1	1	2023-03-12 17:11:47.484	2023-03-12 17:11:47.484	1
110	f	106	Bohemian Style Graphic Tee T-Shirt Collection	\N	1	1	\N	1-106-1-1	1	1	1	2023-03-12 17:11:47.484	2023-03-12 17:11:47.484	1
63	t	\N	Tee Artistry Tenis	Classic cut T-shirt for men, 100% cotton (Heather gray and heather ice blue are 95% cotton/5% viscose. Heather blue & charcoal gray are 80% cotton/20% polyester. Heather burgundy is 60% cotton/40% polyester. Heather oatmeal is 99% cotton/1% viscose) Brand: Spreadshirt	\N	\N	72	\N	1	1	1	2023-03-12 11:00:11.767	2023-03-12 11:00:11.767	\N
80	t	\N	Mountain Explorer Graphic Tee	Classic cut T-shirt for men, 100% cotton (Heather gray and heather ice blue are 95% cotton/5% viscose. Heather blue & charcoal gray are 80% cotton/20% polyester. Heather burgundy is 60% cotton/40% polyester. Heather oatmeal is 99% cotton/1% viscose) Brand: Spreadshirt	\N	\N	58	\N	1	1	1	2023-03-12 17:10:36.419	2023-03-12 17:10:36.419	\N
93	t	\N	Ocean View Tee	Classic cut T-shirt for men, 100% cotton (Heather gray and heather ice blue are 95% cotton/5% viscose. Heather blue & charcoal gray are 80% cotton/20% polyester. Heather burgundy is 60% cotton/40% polyester. Heather oatmeal is 99% cotton/1% viscose) Brand: Spreadshirt	\N	\N	66	\N	1	1	1	2023-03-12 17:11:15.682	2023-03-12 17:11:15.682	\N
106	t	\N	Bohemian Style Graphic Tee T-Shirt Collection	Classic cut T-shirt for men, 100% cotton (Heather gray and heather ice blue are 95% cotton/5% viscose. Heather blue & charcoal gray are 80% cotton/20% polyester. Heather burgundy is 60% cotton/40% polyester. Heather oatmeal is 99% cotton/1% viscose) Brand: Spreadshirt	\N	\N	60	\N	1	1	1	2023-03-12 17:11:47.484	2023-03-12 17:11:47.484	\N
111	f	106	Bohemian Style Graphic Tee T-Shirt Collection	\N	5	5	\N	1-106-5-5	1	1	1	2023-03-12 17:11:47.484	2023-03-12 17:11:47.484	1
112	f	106	Bohemian Style Graphic Tee T-Shirt Collection	\N	5	1	\N	1-106-5-1	1	1	1	2023-03-12 17:11:47.484	2023-03-12 17:11:47.484	1
113	f	106	Bohemian Style Graphic Tee T-Shirt Collection	\N	1	2	\N	1-106-1-2	1	1	1	2023-03-12 17:11:47.484	2023-03-12 17:11:47.484	1
114	f	106	Bohemian Style Graphic Tee T-Shirt Collection	\N	2	2	\N	1-106-2-2	1	1	1	2023-03-12 17:11:47.484	2023-03-12 17:11:47.484	1
115	f	106	Bohemian Style Graphic Tee T-Shirt Collection	\N	3	1	\N	1-106-3-1	1	1	1	2023-03-12 17:11:47.484	2023-03-12 17:11:47.484	1
118	f	106	Bohemian Style Graphic Tee T-Shirt Collection	\N	5	4	\N	1-106-5-4	1	1	1	2023-03-12 17:11:47.484	2023-03-12 17:11:47.484	1
119	f	106	Bohemian Style Graphic Tee T-Shirt Collection	\N	2	1	\N	1-106-2-1	1	1	1	2023-03-12 17:11:47.484	2023-03-12 17:11:47.484	1
120	f	106	Bohemian Style Graphic Tee T-Shirt Collection	\N	3	5	\N	1-106-3-5	1	1	1	2023-03-12 17:11:47.484	2023-03-12 17:11:47.484	1
121	f	106	Bohemian Style Graphic Tee T-Shirt Collection	\N	2	5	\N	1-106-2-5	1	1	1	2023-03-12 17:11:47.484	2023-03-12 17:11:47.484	1
122	f	106	Bohemian Style Graphic Tee T-Shirt Collection	\N	1	4	\N	1-106-1-4	1	1	1	2023-03-12 17:11:47.484	2023-03-12 17:11:47.484	1
\.


--
-- Data for Name: products_images; Type: TABLE DATA; Schema: public; Owner: printmall
--

COPY public.products_images (products_images_id, product_id, color_id, products_images) FROM stdin;
6	63	2	/public/product_images/10/black.png
7	63	1	/public/product_images/10/white.png
8	63	4	/public/product_images/10/yellow.png
9	63	5	/public/product_images/10/grey.png
12	80	1	/public/product_images/9/white.png
13	80	4	/public/product_images/9/yellow.png
14	80	5	/public/product_images/9/grey.png
15	93	2	/public/product_images/5/black.png
17	93	4	/public/product_images/5/yellow.png
18	93	5	/public/product_images/5/grey.png
19	106	2	/public/product_images/6/black.png
20	106	1	/public/product_images/6/white.png
21	106	4	/public/product_images/6/yellow.png
22	106	5	/public/product_images/6/grey.png
10	63	3	/public/product_images/10/green.png
16	93	3	/public/product_images/5/green.png
11	80	3	/public/product_images/10/green.png
\.


--
-- Data for Name: sellers; Type: TABLE DATA; Schema: public; Owner: printmall
--

COPY public.sellers (seller_id, seller_name, seller_email, seller_photo, seller_cover_image, seller_products, seller_password, seller_billing, seller_announcement, seller_blocked, seller_email_varified, seller_access_token, seller_refresh_token, create_user_id, update_user_id, create_datetime, update_datetime) FROM stdin;
1	Go_A	go-a@gss.com	/home/kaieta/Downloads/go-a.jpeg	/home/kaieta/Downloads/go-a_cover.jpeg	\N	$2b$05$2Gp7Mx4zd8YfrfMXts6unuT6P1XoZNxtA.hKIKYGGWN6anHE6smdy	\N	Creating music for heart	f	f	\N	\N	\N	\N	2023-03-11 22:11:33.437	2023-03-11 22:11:33.437
\.


--
-- Data for Name: shipping_info; Type: TABLE DATA; Schema: public; Owner: printmall
--

COPY public.shipping_info (shipping_info_id, first_name, last_name, phone, email, address_line_1, address_line_2, city, country, region, zip) FROM stdin;
\.


--
-- Data for Name: sizes; Type: TABLE DATA; Schema: public; Owner: printmall
--

COPY public.sizes (size_id, size) FROM stdin;
1	XS
2	S
3	M
4	L
5	XL
6	XXL
\.


--
-- Data for Name: user_cart; Type: TABLE DATA; Schema: public; Owner: printmall
--

COPY public.user_cart (user_cart_id, user_session_key) FROM stdin;
\.


--
-- Name: colors_color_id_seq; Type: SEQUENCE SET; Schema: public; Owner: printmall
--

SELECT pg_catalog.setval('public.colors_color_id_seq', 1, false);


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: printmall
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 1, false);


--
-- Name: prod_types_prod_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: printmall
--

SELECT pg_catalog.setval('public.prod_types_prod_type_id_seq', 1, false);


--
-- Name: products_images_products_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: printmall
--

SELECT pg_catalog.setval('public.products_images_products_images_id_seq', 39, true);


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: printmall
--

SELECT pg_catalog.setval('public.products_product_id_seq', 122, true);


--
-- Name: sellers_seller_id_seq; Type: SEQUENCE SET; Schema: public; Owner: printmall
--

SELECT pg_catalog.setval('public.sellers_seller_id_seq', 1, true);


--
-- Name: shipping_info_shipping_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: printmall
--

SELECT pg_catalog.setval('public.shipping_info_shipping_info_id_seq', 1, false);


--
-- Name: sizes_size_id_seq; Type: SEQUENCE SET; Schema: public; Owner: printmall
--

SELECT pg_catalog.setval('public.sizes_size_id_seq', 1, false);


--
-- Name: user_cart_user_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: printmall
--

SELECT pg_catalog.setval('public.user_cart_user_cart_id_seq', 1, false);


--
-- Name: colors colors_pkey; Type: CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.colors
    ADD CONSTRAINT colors_pkey PRIMARY KEY (color_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- Name: prod_types prod_types_pkey; Type: CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.prod_types
    ADD CONSTRAINT prod_types_pkey PRIMARY KEY (prod_type_id);


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
-- Name: sellers sellers_pkey; Type: CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.sellers
    ADD CONSTRAINT sellers_pkey PRIMARY KEY (seller_id);


--
-- Name: shipping_info shipping_info_pkey; Type: CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.shipping_info
    ADD CONSTRAINT shipping_info_pkey PRIMARY KEY (shipping_info_id);


--
-- Name: sizes sizes_pkey; Type: CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.sizes
    ADD CONSTRAINT sizes_pkey PRIMARY KEY (size_id);


--
-- Name: user_cart user_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.user_cart
    ADD CONSTRAINT user_cart_pkey PRIMARY KEY (user_cart_id);


--
-- Name: cart_product cart_product_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.cart_product
    ADD CONSTRAINT cart_product_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- Name: cart_product cart_product_user_cart_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.cart_product
    ADD CONSTRAINT cart_product_user_cart_id_fkey FOREIGN KEY (user_cart_id) REFERENCES public.user_cart(user_cart_id);


--
-- Name: order_lines order_lines_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.order_lines
    ADD CONSTRAINT order_lines_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);


--
-- Name: order_lines order_lines_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.order_lines
    ADD CONSTRAINT order_lines_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- Name: orders orders_shipping_info_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_shipping_info_id_fkey FOREIGN KEY (shipping_info_id) REFERENCES public.shipping_info(shipping_info_id);


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
-- Name: products products_product_color_fkey; Type: FK CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_product_color_fkey FOREIGN KEY (product_color) REFERENCES public.colors(color_id);


--
-- Name: products products_product_seller_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_product_seller_id_fkey FOREIGN KEY (product_seller_id) REFERENCES public.sellers(seller_id);


--
-- Name: products products_product_size_fkey; Type: FK CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_product_size_fkey FOREIGN KEY (product_size) REFERENCES public.sizes(size_id);


--
-- Name: products products_product_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_product_type_fkey FOREIGN KEY (product_type) REFERENCES public.prod_types(prod_type_id);


--
-- PostgreSQL database dump complete
--

