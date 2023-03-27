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
-- Name: contact_us; Type: TABLE; Schema: public; Owner: printmall
--

CREATE TABLE public.contact_us (
    id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(100),
    phone character varying(20),
    message text
);


ALTER TABLE public.contact_us OWNER TO printmall;

--
-- Name: contact_us_id_seq; Type: SEQUENCE; Schema: public; Owner: printmall
--

CREATE SEQUENCE public.contact_us_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_us_id_seq OWNER TO printmall;

--
-- Name: contact_us_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: printmall
--

ALTER SEQUENCE public.contact_us_id_seq OWNED BY public.contact_us.id;


--
-- Name: newslist_emails; Type: TABLE; Schema: public; Owner: printmall
--

CREATE TABLE public.newslist_emails (
    newslist_email_id integer NOT NULL,
    newslist_email character varying(30)
);


ALTER TABLE public.newslist_emails OWNER TO printmall;

--
-- Name: newslist_emails_newslist_email_id_seq; Type: SEQUENCE; Schema: public; Owner: printmall
--

CREATE SEQUENCE public.newslist_emails_newslist_email_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.newslist_emails_newslist_email_id_seq OWNER TO printmall;

--
-- Name: newslist_emails_newslist_email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: printmall
--

ALTER SEQUENCE public.newslist_emails_newslist_email_id_seq OWNED BY public.newslist_emails.newslist_email_id;


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
-- Name: payments; Type: TABLE; Schema: public; Owner: printmall
--

CREATE TABLE public.payments (
    payment_id integer NOT NULL,
    paymentgateway_order_id character varying(30),
    payment_processer_responce text
);


ALTER TABLE public.payments OWNER TO printmall;

--
-- Name: payments_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: printmall
--

CREATE SEQUENCE public.payments_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_payment_id_seq OWNER TO printmall;

--
-- Name: payments_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: printmall
--

ALTER SEQUENCE public.payments_payment_id_seq OWNED BY public.payments.payment_id;


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
    phone character varying(20),
    email character varying(100) NOT NULL,
    address_line_1 character varying(50),
    address_line_2 character varying(50),
    city character varying(50),
    country character varying(50),
    region character varying(50),
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
-- Name: contact_us id; Type: DEFAULT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.contact_us ALTER COLUMN id SET DEFAULT nextval('public.contact_us_id_seq'::regclass);


--
-- Name: newslist_emails newslist_email_id; Type: DEFAULT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.newslist_emails ALTER COLUMN newslist_email_id SET DEFAULT nextval('public.newslist_emails_newslist_email_id_seq'::regclass);


--
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- Name: payments payment_id; Type: DEFAULT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.payments ALTER COLUMN payment_id SET DEFAULT nextval('public.payments_payment_id_seq'::regclass);


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
-- Data for Name: contact_us; Type: TABLE DATA; Schema: public; Owner: printmall
--

COPY public.contact_us (id, first_name, last_name, email, phone, message) FROM stdin;
1	Євгеній	Каєта	kaieta.ievgenii@gmail.com	+380689901426	Ой, ви такі молодці! Такий хороший сайт! Супер розробники
2	Євгеній	Каєта	kaieta.ievgenii@gmail.com	+380689901426	Ой, ви такі молодці! Такий хороший сайт! Супер розробники
3	Євгеній	Каєта	kaieta.ievgenii@gmail.com	+380689901426	Ой, ви такі молодці! Такий хороший сайт! Супер розробники
4	Євгеній	Каєта	kaieta.ievgenii@gmail.com	+380689901426	Ой, ви такі молодці! Такий хороший сайт! Супер розробники
5	Євгеній	Каєта	kaieta.ievgenii@gmail.com	+380689901426	Ой, ви такі молодці! Такий хороший сайт! Супер розробники
6	Євгеній	Каєта	kaieta.ievgenii@gmail.com	+380689901426	Ой, ви такі молодці! Такий хороший сайт! Супер розробники
7	Євгеній	Каєта	kaieta.ievgenii@gmail.com	+380689901426	Ой, ви такі молодці! Такий хороший сайт! Супер розробники
8	Євгеній	Каєта	kaieta.ievgenii@gmail.com	+380689901426	Ой, ви такі молодці! Такий хороший сайт! Супер розробники
9	Євгеній	Каєта	kaieta.ievgenii@gmail.com	+380689901426	Ой, ви такі молодці! Такий хороший сайт! Супер розробники
10	Євгеній	Каєта	kaieta.ievgenii@gmail.com	+380689901426	TAODIOSIA
11	Євгеній	Каєта	kaieta.ievgenii@gmail.com	+380689901426	TAODIOSIA
12	Євгеній	Каєта	kaieta.ievgenii@gmail.com	+380689901426	TAODIOSIA
13	Євгеній	Каєта	kaieta.ievgenii@gmail.com	+380689901426	молодці! ПАцани ваще рєбята
14	Євгеній	Каєта	kaieta.ievgenii@gmail.com	+380689901426	oyutoyfoucvlhclsug
15	Євгеній	Каєта	kaieta.ievgenii@gmail.com	+380689901426	uhf;uhva
16	Євгеній	Каєта	kaieta.ievgenii@gmail.com	+380689901426	Ой, ви такі молодці! Такий хороший сайт! Супер розробники
\.


--
-- Data for Name: newslist_emails; Type: TABLE DATA; Schema: public; Owner: printmall
--

COPY public.newslist_emails (newslist_email_id, newslist_email) FROM stdin;
1	kaieta@gmail.com
3	trolo@ok.com
4	gsr@gss.com
5	jdoe@gss.com
6	msojh_shdg@gss.com
7	igh:ug:ug@gss.com
8	dsa@gss.com
9	kaieta@gmail.com
10	kaieta@gmail.com
11	dasa@gss.com
12	dasha@gss.com
\.


--
-- Data for Name: order_lines; Type: TABLE DATA; Schema: public; Owner: printmall
--

COPY public.order_lines (order_id, product_id, item_type, price, qty, sub_total, tax, total) FROM stdin;
8	\N	\N	\N	\N	58	0	58
9	\N	\N	\N	\N	58	0	58
10	\N	\N	\N	\N	58	0	58
11	\N	\N	\N	\N	72	0	72
12	\N	\N	\N	\N	72	0	72
13	\N	\N	\N	\N	124	0	124
13	\N	\N	\N	\N	124	0	124
14	\N	\N	\N	\N	132	0	132
14	\N	\N	\N	\N	132	0	132
16	96	\N	66	1	132	0	132
16	103	\N	66	1	132	0	132
17	96	\N	66	1	66	0	66
18	96	\N	66	1	66	0	66
19	96	\N	66	1	66	0	66
20	92	\N	58	1	58	0	58
21	92	\N	58	1	58	0	58
22	79	\N	72	1	72	0	72
23	92	\N	58	1	58	0	58
24	92	\N	58	1	58	0	58
25	92	\N	58	1	58	0	58
26	92	\N	58	1	58	0	58
27	92	\N	58	1	58	0	58
28	92	\N	58	1	58	0	58
29	92	\N	58	1	58	0	58
30	92	\N	58	1	58	0	58
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: printmall
--

COPY public.orders (order_id, shipping_info_id, payment_id, finalized, shipped, delivered) FROM stdin;
1	9	23	t	f	f
2	10	24	t	f	f
3	11	25	t	f	f
4	12	26	t	f	f
5	13	27	t	f	f
6	14	28	t	f	f
7	27	57	t	f	f
8	28	58	t	f	f
9	29	59	t	f	f
10	30	60	t	f	f
11	31	61	t	f	f
12	32	62	t	f	f
13	33	63	t	f	f
14	34	64	t	f	f
15	35	65	t	f	f
16	36	66	t	f	f
17	37	67	t	f	f
18	38	68	t	f	f
19	39	69	t	f	f
20	40	70	t	f	f
21	41	71	t	f	f
22	42	72	t	f	f
23	43	73	t	f	f
24	44	74	t	f	f
25	45	75	t	f	f
26	46	76	t	f	f
27	47	77	t	f	f
28	48	78	t	f	f
29	49	79	t	f	f
30	50	80	t	f	f
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: printmall
--

COPY public.payments (payment_id, paymentgateway_order_id, payment_processer_responce) FROM stdin;
1	9GS281238C331893X	{"id":"9GS281238C331893X","status":"CREATED","links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/9GS281238C331893X","rel":"self","method":"GET"},{"href":"https://www.sandbox.paypal.com/checkoutnow?token=9GS281238C331893X","rel":"approve","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/9GS281238C331893X","rel":"update","method":"PATCH"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/9GS281238C331893X/capture","rel":"capture","method":"POST"}]}
2	2SL52696EY0422453	{"id":"2SL52696EY0422453","status":"CREATED","links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2SL52696EY0422453","rel":"self","method":"GET"},{"href":"https://www.sandbox.paypal.com/checkoutnow?token=2SL52696EY0422453","rel":"approve","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2SL52696EY0422453","rel":"update","method":"PATCH"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2SL52696EY0422453/capture","rel":"capture","method":"POST"}]}
3	6D294048U72615131	{"id":"6D294048U72615131","status":"CREATED","links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6D294048U72615131","rel":"self","method":"GET"},{"href":"https://www.sandbox.paypal.com/checkoutnow?token=6D294048U72615131","rel":"approve","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6D294048U72615131","rel":"update","method":"PATCH"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6D294048U72615131/capture","rel":"capture","method":"POST"}]}
4	0SW550400P716043M	{"id":"0SW550400P716043M","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"45791299U7697422L","status":"COMPLETED","amount":{"currency_code":"EUR","value":"60.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"60.00"},"paypal_fee":{"currency_code":"EUR","value":"2.39"},"net_amount":{"currency_code":"EUR","value":"57.61"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/45791299U7697422L","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/45791299U7697422L/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/0SW550400P716043M","rel":"up","method":"GET"}],"create_time":"2023-03-18T22:00:09Z","update_time":"2023-03-18T22:00:09Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/0SW550400P716043M","rel":"self","method":"GET"}]}
5	1HN55446LE380100L	{"id":"1HN55446LE380100L","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"7AC764841N224040G","status":"COMPLETED","amount":{"currency_code":"EUR","value":"60.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"60.00"},"paypal_fee":{"currency_code":"EUR","value":"2.39"},"net_amount":{"currency_code":"EUR","value":"57.61"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7AC764841N224040G","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7AC764841N224040G/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/1HN55446LE380100L","rel":"up","method":"GET"}],"create_time":"2023-03-18T22:01:49Z","update_time":"2023-03-18T22:01:49Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/1HN55446LE380100L","rel":"self","method":"GET"}]}
6	6VS56428DK780623R	{"id":"6VS56428DK780623R","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"6W849259LN204333R","status":"COMPLETED","amount":{"currency_code":"EUR","value":"60.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"60.00"},"paypal_fee":{"currency_code":"EUR","value":"2.39"},"net_amount":{"currency_code":"EUR","value":"57.61"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/6W849259LN204333R","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/6W849259LN204333R/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6VS56428DK780623R","rel":"up","method":"GET"}],"create_time":"2023-03-18T22:03:18Z","update_time":"2023-03-18T22:03:18Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6VS56428DK780623R","rel":"self","method":"GET"}]}
7	07D367855E8938733	{"id":"07D367855E8938733","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"1UK97880NP965670K","status":"COMPLETED","amount":{"currency_code":"EUR","value":"60.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"60.00"},"paypal_fee":{"currency_code":"EUR","value":"2.39"},"net_amount":{"currency_code":"EUR","value":"57.61"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/1UK97880NP965670K","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/1UK97880NP965670K/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/07D367855E8938733","rel":"up","method":"GET"}],"create_time":"2023-03-18T22:04:36Z","update_time":"2023-03-18T22:04:36Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/07D367855E8938733","rel":"self","method":"GET"}]}
8	71A98284MR035082H	{"id":"71A98284MR035082H","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"2ET756119B9392456","status":"COMPLETED","amount":{"currency_code":"EUR","value":"60.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"60.00"},"paypal_fee":{"currency_code":"EUR","value":"2.39"},"net_amount":{"currency_code":"EUR","value":"57.61"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/2ET756119B9392456","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/2ET756119B9392456/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/71A98284MR035082H","rel":"up","method":"GET"}],"create_time":"2023-03-18T22:06:05Z","update_time":"2023-03-18T22:06:05Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/71A98284MR035082H","rel":"self","method":"GET"}]}
9	8VR36553PA702350A	{"id":"8VR36553PA702350A","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"98T24431ES1759046","status":"COMPLETED","amount":{"currency_code":"EUR","value":"60.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"60.00"},"paypal_fee":{"currency_code":"EUR","value":"2.39"},"net_amount":{"currency_code":"EUR","value":"57.61"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/98T24431ES1759046","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/98T24431ES1759046/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/8VR36553PA702350A","rel":"up","method":"GET"}],"create_time":"2023-03-18T22:14:48Z","update_time":"2023-03-18T22:14:48Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/8VR36553PA702350A","rel":"self","method":"GET"}]}
10	05R1926946095990P	{"id":"05R1926946095990P","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"9851004552283963G","status":"COMPLETED","amount":{"currency_code":"EUR","value":"60.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"60.00"},"paypal_fee":{"currency_code":"EUR","value":"2.39"},"net_amount":{"currency_code":"EUR","value":"57.61"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/9851004552283963G","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/9851004552283963G/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/05R1926946095990P","rel":"up","method":"GET"}],"create_time":"2023-03-18T22:19:36Z","update_time":"2023-03-18T22:19:36Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/05R1926946095990P","rel":"self","method":"GET"}]}
11	21E70418FM2245127	{"id":"21E70418FM2245127","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"8MC40744VA0068250","status":"COMPLETED","amount":{"currency_code":"EUR","value":"60.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"60.00"},"paypal_fee":{"currency_code":"EUR","value":"2.39"},"net_amount":{"currency_code":"EUR","value":"57.61"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/8MC40744VA0068250","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/8MC40744VA0068250/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/21E70418FM2245127","rel":"up","method":"GET"}],"create_time":"2023-03-18T22:27:21Z","update_time":"2023-03-18T22:27:21Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/21E70418FM2245127","rel":"self","method":"GET"}]}
12	22E91026AK864832S	{"id":"22E91026AK864832S","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"408295690C412342T","status":"COMPLETED","amount":{"currency_code":"EUR","value":"60.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"60.00"},"paypal_fee":{"currency_code":"EUR","value":"2.39"},"net_amount":{"currency_code":"EUR","value":"57.61"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/408295690C412342T","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/408295690C412342T/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/22E91026AK864832S","rel":"up","method":"GET"}],"create_time":"2023-03-18T22:27:47Z","update_time":"2023-03-18T22:27:47Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/22E91026AK864832S","rel":"self","method":"GET"}]}
13	0T271033LA1473848	{"id":"0T271033LA1473848","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"8GA47419WD381925C","status":"COMPLETED","amount":{"currency_code":"EUR","value":"60.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"60.00"},"paypal_fee":{"currency_code":"EUR","value":"2.39"},"net_amount":{"currency_code":"EUR","value":"57.61"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/8GA47419WD381925C","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/8GA47419WD381925C/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/0T271033LA1473848","rel":"up","method":"GET"}],"create_time":"2023-03-18T22:31:18Z","update_time":"2023-03-18T22:31:18Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/0T271033LA1473848","rel":"self","method":"GET"}]}
14	89E57633S72230805	{"id":"89E57633S72230805","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"83P82489G75053920","status":"COMPLETED","amount":{"currency_code":"EUR","value":"60.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"60.00"},"paypal_fee":{"currency_code":"EUR","value":"2.39"},"net_amount":{"currency_code":"EUR","value":"57.61"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/83P82489G75053920","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/83P82489G75053920/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/89E57633S72230805","rel":"up","method":"GET"}],"create_time":"2023-03-18T22:34:56Z","update_time":"2023-03-18T22:34:56Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/89E57633S72230805","rel":"self","method":"GET"}]}
15	5LL22108VS398274C	{"id":"5LL22108VS398274C","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"5XS12308VY802261B","status":"COMPLETED","amount":{"currency_code":"EUR","value":"60.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"60.00"},"paypal_fee":{"currency_code":"EUR","value":"2.39"},"net_amount":{"currency_code":"EUR","value":"57.61"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/5XS12308VY802261B","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/5XS12308VY802261B/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/5LL22108VS398274C","rel":"up","method":"GET"}],"create_time":"2023-03-18T23:31:38Z","update_time":"2023-03-18T23:31:38Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/5LL22108VS398274C","rel":"self","method":"GET"}]}
16	5UP35488CK1890222	{"id":"5UP35488CK1890222","status":"COMPLETED","payment_source":{"paypal":{"email_address":"kaieta.ievgenii@gmail.com","account_id":"KRW7VPXJZ9AH8","name":{"given_name":"Ievgenii","surname":"Kas"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"Ievgenii Kas"},"address":{"address_line_1":"Stará Vajnorská, 39","admin_area_2":"Bratislava","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"1G868122LW729025A","status":"COMPLETED","amount":{"currency_code":"EUR","value":"60.00"},"final_capture":true,"seller_protection":{"status":"NOT_ELIGIBLE"},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"60.00"},"paypal_fee":{"currency_code":"EUR","value":"2.39"},"net_amount":{"currency_code":"EUR","value":"57.61"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/1G868122LW729025A","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/1G868122LW729025A/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/5UP35488CK1890222","rel":"up","method":"GET"}],"create_time":"2023-03-18T23:36:38Z","update_time":"2023-03-18T23:36:38Z"}]}}],"payer":{"name":{"given_name":"Ievgenii","surname":"Kas"},"email_address":"kaieta.ievgenii@gmail.com","payer_id":"KRW7VPXJZ9AH8","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/5UP35488CK1890222","rel":"self","method":"GET"}]}
17	5N924478MN629703K	{"id":"5N924478MN629703K","status":"COMPLETED","payment_source":{"paypal":{"email_address":"kaieta.ievgenii@gmail.com","account_id":"JA7F8ELCAASAJ","name":{"given_name":"Ien","surname":"Ijsa"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"Ien Ijsa"},"address":{"address_line_1":"Rumančeková 861/52","admin_area_2":"Bratislava","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"54221528FY016645C","status":"COMPLETED","amount":{"currency_code":"EUR","value":"60.00"},"final_capture":true,"seller_protection":{"status":"NOT_ELIGIBLE"},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"60.00"},"paypal_fee":{"currency_code":"EUR","value":"2.39"},"net_amount":{"currency_code":"EUR","value":"57.61"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/54221528FY016645C","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/54221528FY016645C/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/5N924478MN629703K","rel":"up","method":"GET"}],"create_time":"2023-03-18T23:40:32Z","update_time":"2023-03-18T23:40:32Z"}]}}],"payer":{"name":{"given_name":"Ien","surname":"Ijsa"},"email_address":"kaieta.ievgenii@gmail.com","payer_id":"JA7F8ELCAASAJ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/5N924478MN629703K","rel":"self","method":"GET"}]}
18	4VA75649YX233931X	{"id":"4VA75649YX233931X","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"36Y734133W0920908","status":"COMPLETED","amount":{"currency_code":"EUR","value":"60.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"60.00"},"paypal_fee":{"currency_code":"EUR","value":"2.39"},"net_amount":{"currency_code":"EUR","value":"57.61"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/36Y734133W0920908","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/36Y734133W0920908/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/4VA75649YX233931X","rel":"up","method":"GET"}],"create_time":"2023-03-19T11:14:20Z","update_time":"2023-03-19T11:14:20Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/4VA75649YX233931X","rel":"self","method":"GET"}]}
19	5YN34935BC0218231	{"id":"5YN34935BC0218231","status":"COMPLETED","payment_source":{"paypal":{"email_address":"kaieta.ievgenii@gmail.com","account_id":"QURGVQEGJ8ENG","name":{"given_name":"Isdj","surname":"Knbdakjb"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"Isdj Knbdakjb"},"address":{"address_line_1":"Na Pasekách 12","admin_area_2":"Bratislava","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"7WF965399P8739232","status":"COMPLETED","amount":{"currency_code":"EUR","value":"60.00"},"final_capture":true,"seller_protection":{"status":"NOT_ELIGIBLE"},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"60.00"},"paypal_fee":{"currency_code":"EUR","value":"2.39"},"net_amount":{"currency_code":"EUR","value":"57.61"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7WF965399P8739232","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7WF965399P8739232/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/5YN34935BC0218231","rel":"up","method":"GET"}],"create_time":"2023-03-19T11:16:24Z","update_time":"2023-03-19T11:16:24Z"}]}}],"payer":{"name":{"given_name":"Isdj","surname":"Knbdakjb"},"email_address":"kaieta.ievgenii@gmail.com","payer_id":"QURGVQEGJ8ENG","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/5YN34935BC0218231","rel":"self","method":"GET"}]}
20	7EK421446T769081C	{"id":"7EK421446T769081C","status":"COMPLETED","payment_source":{"paypal":{"email_address":"kaieta.ievgenii@gmail.com","account_id":"5E9E5SZ3AZ8JJ","name":{"given_name":"Женя","surname":"Жук"},"address":{"country_code":"UA"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"Ievgenii Kai"},"address":{"address_line_1":"Stará Vajnorská, 39","admin_area_2":"Bratislava","postal_code":"83506","country_code":"SK"}},"payments":{"captures":[{"id":"8H9893309J168042L","status":"COMPLETED","amount":{"currency_code":"EUR","value":"60.00"},"final_capture":true,"seller_protection":{"status":"NOT_ELIGIBLE"},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"60.00"},"paypal_fee":{"currency_code":"EUR","value":"2.69"},"net_amount":{"currency_code":"EUR","value":"57.31"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/8H9893309J168042L","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/8H9893309J168042L/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7EK421446T769081C","rel":"up","method":"GET"}],"create_time":"2023-03-19T16:51:52Z","update_time":"2023-03-19T16:51:52Z"}]}}],"payer":{"name":{"given_name":"Женя","surname":"Жук"},"email_address":"kaieta.ievgenii@gmail.com","payer_id":"5E9E5SZ3AZ8JJ","address":{"country_code":"UA"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7EK421446T769081C","rel":"self","method":"GET"}]}
21	6SH43040N7784062L	{"id":"6SH43040N7784062L","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"67348954CX976054C","status":"COMPLETED","amount":{"currency_code":"EUR","value":"182.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"182.00"},"paypal_fee":{"currency_code":"EUR","value":"6.54"},"net_amount":{"currency_code":"EUR","value":"175.46"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/67348954CX976054C","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/67348954CX976054C/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6SH43040N7784062L","rel":"up","method":"GET"}],"create_time":"2023-03-20T18:08:53Z","update_time":"2023-03-20T18:08:53Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6SH43040N7784062L","rel":"self","method":"GET"}]}
22	6SK10315GG698883U	{"id":"6SK10315GG698883U","status":"COMPLETED","payment_source":{"paypal":{"email_address":"kaieta.ievgenii@gmail.com","account_id":"BNKSBAYBVH9DY","name":{"given_name":"Жопка","surname":"Попка"},"address":{"country_code":"UA"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"Жопка Попка"},"address":{"address_line_1":"Казанова","address_line_2":"12","admin_area_2":"Київ","admin_area_1":"KYIV","postal_code":"01010","country_code":"UA"}},"payments":{"captures":[{"id":"7CW08652LD178323A","status":"COMPLETED","amount":{"currency_code":"EUR","value":"66.00"},"final_capture":true,"seller_protection":{"status":"NOT_ELIGIBLE"},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"66.00"},"paypal_fee":{"currency_code":"EUR","value":"2.92"},"net_amount":{"currency_code":"EUR","value":"63.08"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7CW08652LD178323A","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7CW08652LD178323A/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6SK10315GG698883U","rel":"up","method":"GET"}],"create_time":"2023-03-20T18:11:35Z","update_time":"2023-03-20T18:11:35Z"}]}}],"payer":{"name":{"given_name":"Жопка","surname":"Попка"},"email_address":"kaieta.ievgenii@gmail.com","payer_id":"BNKSBAYBVH9DY","address":{"country_code":"UA"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6SK10315GG698883U","rel":"self","method":"GET"}]}
23	2KL20049LD1289434	{"id":"2KL20049LD1289434","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"0029542698893411G","status":"COMPLETED","amount":{"currency_code":"EUR","value":"66.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"66.00"},"paypal_fee":{"currency_code":"EUR","value":"2.59"},"net_amount":{"currency_code":"EUR","value":"63.41"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/0029542698893411G","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/0029542698893411G/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2KL20049LD1289434","rel":"up","method":"GET"}],"create_time":"2023-03-20T18:21:20Z","update_time":"2023-03-20T18:21:20Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2KL20049LD1289434","rel":"self","method":"GET"}]}
24	5F669360MX755823V	{"id":"5F669360MX755823V","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"8V840143G74920108","status":"COMPLETED","amount":{"currency_code":"EUR","value":"66.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"66.00"},"paypal_fee":{"currency_code":"EUR","value":"2.59"},"net_amount":{"currency_code":"EUR","value":"63.41"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/8V840143G74920108","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/8V840143G74920108/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/5F669360MX755823V","rel":"up","method":"GET"}],"create_time":"2023-03-20T19:12:05Z","update_time":"2023-03-20T19:12:05Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/5F669360MX755823V","rel":"self","method":"GET"}]}
25	93B759496X7574517	{"id":"93B759496X7574517","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"2C996167UL710000G","status":"COMPLETED","amount":{"currency_code":"EUR","value":"66.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"66.00"},"paypal_fee":{"currency_code":"EUR","value":"2.59"},"net_amount":{"currency_code":"EUR","value":"63.41"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/2C996167UL710000G","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/2C996167UL710000G/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/93B759496X7574517","rel":"up","method":"GET"}],"create_time":"2023-03-20T19:49:35Z","update_time":"2023-03-20T19:49:35Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/93B759496X7574517","rel":"self","method":"GET"}]}
26	1RX82795FM340371X	{"id":"1RX82795FM340371X","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"4YF66363PK231614P","status":"COMPLETED","amount":{"currency_code":"EUR","value":"66.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"66.00"},"paypal_fee":{"currency_code":"EUR","value":"2.59"},"net_amount":{"currency_code":"EUR","value":"63.41"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/4YF66363PK231614P","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/4YF66363PK231614P/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/1RX82795FM340371X","rel":"up","method":"GET"}],"create_time":"2023-03-20T19:49:56Z","update_time":"2023-03-20T19:49:56Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/1RX82795FM340371X","rel":"self","method":"GET"}]}
27	2N701624560697423	{"id":"2N701624560697423","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"71H32789MD304183B","status":"COMPLETED","amount":{"currency_code":"EUR","value":"66.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"66.00"},"paypal_fee":{"currency_code":"EUR","value":"2.59"},"net_amount":{"currency_code":"EUR","value":"63.41"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/71H32789MD304183B","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/71H32789MD304183B/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2N701624560697423","rel":"up","method":"GET"}],"create_time":"2023-03-20T19:51:30Z","update_time":"2023-03-20T19:51:30Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2N701624560697423","rel":"self","method":"GET"}]}
28	8W937226V1081230W	{"id":"8W937226V1081230W","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"5BE53910ST679421W","status":"COMPLETED","amount":{"currency_code":"EUR","value":"66.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"66.00"},"paypal_fee":{"currency_code":"EUR","value":"2.59"},"net_amount":{"currency_code":"EUR","value":"63.41"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/5BE53910ST679421W","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/5BE53910ST679421W/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/8W937226V1081230W","rel":"up","method":"GET"}],"create_time":"2023-03-20T19:59:41Z","update_time":"2023-03-20T19:59:41Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/8W937226V1081230W","rel":"self","method":"GET"}]}
29	6L7641016B383502H	{"id":"6L7641016B383502H","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"4TK44261AT040121V","status":"COMPLETED","amount":{"currency_code":"EUR","value":"216.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"216.00"},"paypal_fee":{"currency_code":"EUR","value":"7.69"},"net_amount":{"currency_code":"EUR","value":"208.31"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/4TK44261AT040121V","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/4TK44261AT040121V/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6L7641016B383502H","rel":"up","method":"GET"}],"create_time":"2023-03-20T21:28:49Z","update_time":"2023-03-20T21:28:49Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6L7641016B383502H","rel":"self","method":"GET"}]}
30	\N	15
31	8GD99884K5309932R	{"id":"8GD99884K5309932R","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"81D51810B2585302T","status":"COMPLETED","amount":{"currency_code":"EUR","value":"216.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"216.00"},"paypal_fee":{"currency_code":"EUR","value":"7.69"},"net_amount":{"currency_code":"EUR","value":"208.31"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/81D51810B2585302T","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/81D51810B2585302T/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/8GD99884K5309932R","rel":"up","method":"GET"}],"create_time":"2023-03-20T21:36:46Z","update_time":"2023-03-20T21:36:46Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/8GD99884K5309932R","rel":"self","method":"GET"}]}
32	\N	16
33	7PN39156T5276211R	{"id":"7PN39156T5276211R","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"4R338659S2880863M","status":"COMPLETED","amount":{"currency_code":"EUR","value":"216.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"216.00"},"paypal_fee":{"currency_code":"EUR","value":"7.69"},"net_amount":{"currency_code":"EUR","value":"208.31"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/4R338659S2880863M","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/4R338659S2880863M/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7PN39156T5276211R","rel":"up","method":"GET"}],"create_time":"2023-03-20T21:44:44Z","update_time":"2023-03-20T21:44:44Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7PN39156T5276211R","rel":"self","method":"GET"}]}
34	\N	17
35	3MP67386RH4593528	{"id":"3MP67386RH4593528","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"38A98738YX9825047","status":"COMPLETED","amount":{"currency_code":"EUR","value":"216.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"216.00"},"paypal_fee":{"currency_code":"EUR","value":"7.69"},"net_amount":{"currency_code":"EUR","value":"208.31"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/38A98738YX9825047","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/38A98738YX9825047/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/3MP67386RH4593528","rel":"up","method":"GET"}],"create_time":"2023-03-20T21:49:54Z","update_time":"2023-03-20T21:49:54Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/3MP67386RH4593528","rel":"self","method":"GET"}]}
36	\N	18
37	7206396567734591B	{"id":"7206396567734591B","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"12P61289MJ716661V","status":"COMPLETED","amount":{"currency_code":"EUR","value":"216.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"216.00"},"paypal_fee":{"currency_code":"EUR","value":"7.69"},"net_amount":{"currency_code":"EUR","value":"208.31"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/12P61289MJ716661V","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/12P61289MJ716661V/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7206396567734591B","rel":"up","method":"GET"}],"create_time":"2023-03-20T22:14:36Z","update_time":"2023-03-20T22:14:36Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7206396567734591B","rel":"self","method":"GET"}]}
38	\N	19
39	1NM44874DA188715H	{"id":"1NM44874DA188715H","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"5JE57750W2255944L","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/5JE57750W2255944L","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/5JE57750W2255944L/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/1NM44874DA188715H","rel":"up","method":"GET"}],"create_time":"2023-03-20T22:17:18Z","update_time":"2023-03-20T22:17:18Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/1NM44874DA188715H","rel":"self","method":"GET"}]}
40	\N	20
41	0CU07144MR7138923	{"id":"0CU07144MR7138923","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"7UB58247KL608973W","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7UB58247KL608973W","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7UB58247KL608973W/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/0CU07144MR7138923","rel":"up","method":"GET"}],"create_time":"2023-03-20T22:20:00Z","update_time":"2023-03-20T22:20:00Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/0CU07144MR7138923","rel":"self","method":"GET"}]}
42	\N	21
43	7K907272JS984484V	{"id":"7K907272JS984484V","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"Ievgenii Pipka"},"address":{"address_line_1":"Stará Vajnorská, 39","address_line_2":"2132","admin_area_2":"Bratislava","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"7X5267077S8026347","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7X5267077S8026347","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7X5267077S8026347/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7K907272JS984484V","rel":"up","method":"GET"}],"create_time":"2023-03-21T19:08:41Z","update_time":"2023-03-21T19:08:41Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7K907272JS984484V","rel":"self","method":"GET"}]}
44	\N	22
45	80906303995146504	{"id":"80906303995146504","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"44466787W07061600","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/44466787W07061600","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/44466787W07061600/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/80906303995146504","rel":"up","method":"GET"}],"create_time":"2023-03-21T19:21:49Z","update_time":"2023-03-21T19:21:49Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/80906303995146504","rel":"self","method":"GET"}]}
46	8MT938461Y922334A	{"id":"8MT938461Y922334A","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"Ievgenii Pipka"},"address":{"address_line_1":"Stará Vajnorská, 39","address_line_2":"2132","admin_area_2":"Bratislava","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"9FD88074VD287720P","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/9FD88074VD287720P","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/9FD88074VD287720P/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/8MT938461Y922334A","rel":"up","method":"GET"}],"create_time":"2023-03-21T20:37:31Z","update_time":"2023-03-21T20:37:31Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/8MT938461Y922334A","rel":"self","method":"GET"}]}
47	\N	23
48	0YP84266VA553221N	{"id":"0YP84266VA553221N","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"8PA99769WT488433H","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/8PA99769WT488433H","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/8PA99769WT488433H/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/0YP84266VA553221N","rel":"up","method":"GET"}],"create_time":"2023-03-21T20:38:22Z","update_time":"2023-03-21T20:38:22Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/0YP84266VA553221N","rel":"self","method":"GET"}]}
49	0SF88293LB014781H	{"id":"0SF88293LB014781H","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"1DM32208LA049234W","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/1DM32208LA049234W","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/1DM32208LA049234W/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/0SF88293LB014781H","rel":"up","method":"GET"}],"create_time":"2023-03-21T20:40:06Z","update_time":"2023-03-21T20:40:06Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/0SF88293LB014781H","rel":"self","method":"GET"}]}
50	25C35453AV001433K	{"id":"25C35453AV001433K","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"2XW0990263661705P","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/2XW0990263661705P","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/2XW0990263661705P/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/25C35453AV001433K","rel":"up","method":"GET"}],"create_time":"2023-03-21T20:41:28Z","update_time":"2023-03-21T20:41:28Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/25C35453AV001433K","rel":"self","method":"GET"}]}
51	1FB16684E4980420M	{"id":"1FB16684E4980420M","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"7XX75180878418149","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7XX75180878418149","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7XX75180878418149/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/1FB16684E4980420M","rel":"up","method":"GET"}],"create_time":"2023-03-21T20:58:16Z","update_time":"2023-03-21T20:58:16Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/1FB16684E4980420M","rel":"self","method":"GET"}]}
52	\N	24
53	90C87499XT865742D	{"id":"90C87499XT865742D","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"8VJ00639KL3086212","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/8VJ00639KL3086212","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/8VJ00639KL3086212/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/90C87499XT865742D","rel":"up","method":"GET"}],"create_time":"2023-03-21T21:02:35Z","update_time":"2023-03-21T21:02:35Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/90C87499XT865742D","rel":"self","method":"GET"}]}
54	\N	25
55	6X5212733W967135T	{"id":"6X5212733W967135T","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"19285247JL241033S","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/19285247JL241033S","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/19285247JL241033S/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6X5212733W967135T","rel":"up","method":"GET"}],"create_time":"2023-03-21T21:03:55Z","update_time":"2023-03-21T21:03:55Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6X5212733W967135T","rel":"self","method":"GET"}]}
56	\N	26
57	48N19529SC938413G	{"id":"48N19529SC938413G","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"5DN51178AW437084Y","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/5DN51178AW437084Y","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/5DN51178AW437084Y/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/48N19529SC938413G","rel":"up","method":"GET"}],"create_time":"2023-03-21T21:07:34Z","update_time":"2023-03-21T21:07:34Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/48N19529SC938413G","rel":"self","method":"GET"}]}
58	3R674196VC140940W	{"id":"3R674196VC140940W","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"Ievgenii Pipka"},"address":{"address_line_1":"Stará Vajnorská, 39","address_line_2":"2132","admin_area_2":"Bratislava","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"87D979133F7210819","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/87D979133F7210819","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/87D979133F7210819/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/3R674196VC140940W","rel":"up","method":"GET"}],"create_time":"2023-03-21T21:26:09Z","update_time":"2023-03-21T21:26:09Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/3R674196VC140940W","rel":"self","method":"GET"}]}
59	2NU57829R1950650U	{"id":"2NU57829R1950650U","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"Ievgenii Pipka"},"address":{"address_line_1":"Stará Vajnorská, 39","address_line_2":"2132","admin_area_2":"Bratislava","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"8N6854364V098972R","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/8N6854364V098972R","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/8N6854364V098972R/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2NU57829R1950650U","rel":"up","method":"GET"}],"create_time":"2023-03-21T21:27:24Z","update_time":"2023-03-21T21:27:24Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2NU57829R1950650U","rel":"self","method":"GET"}]}
60	0JT88036Y0216702A	{"id":"0JT88036Y0216702A","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"6LF15356SP604014K","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/6LF15356SP604014K","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/6LF15356SP604014K/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/0JT88036Y0216702A","rel":"up","method":"GET"}],"create_time":"2023-03-21T21:28:32Z","update_time":"2023-03-21T21:28:32Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/0JT88036Y0216702A","rel":"self","method":"GET"}]}
61	7VK4449476761390R	{"id":"7VK4449476761390R","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"5FS71418NS995544U","status":"COMPLETED","amount":{"currency_code":"EUR","value":"72.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"72.00"},"paypal_fee":{"currency_code":"EUR","value":"2.80"},"net_amount":{"currency_code":"EUR","value":"69.20"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/5FS71418NS995544U","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/5FS71418NS995544U/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7VK4449476761390R","rel":"up","method":"GET"}],"create_time":"2023-03-21T21:32:36Z","update_time":"2023-03-21T21:32:36Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7VK4449476761390R","rel":"self","method":"GET"}]}
62	3RY25324HE3353807	{"id":"3RY25324HE3353807","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"0C151231YU5197918","status":"COMPLETED","amount":{"currency_code":"EUR","value":"72.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"72.00"},"paypal_fee":{"currency_code":"EUR","value":"2.80"},"net_amount":{"currency_code":"EUR","value":"69.20"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/0C151231YU5197918","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/0C151231YU5197918/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/3RY25324HE3353807","rel":"up","method":"GET"}],"create_time":"2023-03-21T21:33:34Z","update_time":"2023-03-21T21:33:34Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/3RY25324HE3353807","rel":"self","method":"GET"}]}
63	38C347583R509024X	{"id":"38C347583R509024X","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"1Y587003X8744704E","status":"COMPLETED","amount":{"currency_code":"EUR","value":"124.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"124.00"},"paypal_fee":{"currency_code":"EUR","value":"4.57"},"net_amount":{"currency_code":"EUR","value":"119.43"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/1Y587003X8744704E","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/1Y587003X8744704E/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/38C347583R509024X","rel":"up","method":"GET"}],"create_time":"2023-03-21T21:35:08Z","update_time":"2023-03-21T21:35:08Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/38C347583R509024X","rel":"self","method":"GET"}]}
64	7KB705387C2507544	{"id":"7KB705387C2507544","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"4JL49974SB810761F","status":"COMPLETED","amount":{"currency_code":"EUR","value":"132.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"132.00"},"paypal_fee":{"currency_code":"EUR","value":"4.84"},"net_amount":{"currency_code":"EUR","value":"127.16"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/4JL49974SB810761F","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/4JL49974SB810761F/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7KB705387C2507544","rel":"up","method":"GET"}],"create_time":"2023-03-21T21:35:56Z","update_time":"2023-03-21T21:35:56Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7KB705387C2507544","rel":"self","method":"GET"}]}
65	1UJ84395JK477822G	{"id":"1UJ84395JK477822G","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"3JH09298EM4653525","status":"COMPLETED","amount":{"currency_code":"EUR","value":"132.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"132.00"},"paypal_fee":{"currency_code":"EUR","value":"4.84"},"net_amount":{"currency_code":"EUR","value":"127.16"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/3JH09298EM4653525","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/3JH09298EM4653525/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/1UJ84395JK477822G","rel":"up","method":"GET"}],"create_time":"2023-03-21T21:38:31Z","update_time":"2023-03-21T21:38:31Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/1UJ84395JK477822G","rel":"self","method":"GET"}]}
66	8AR850666Y8762425	{"id":"8AR850666Y8762425","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"0K894044JH698770A","status":"COMPLETED","amount":{"currency_code":"EUR","value":"132.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"132.00"},"paypal_fee":{"currency_code":"EUR","value":"4.84"},"net_amount":{"currency_code":"EUR","value":"127.16"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/0K894044JH698770A","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/0K894044JH698770A/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/8AR850666Y8762425","rel":"up","method":"GET"}],"create_time":"2023-03-21T21:39:12Z","update_time":"2023-03-21T21:39:12Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/8AR850666Y8762425","rel":"self","method":"GET"}]}
67	2PR514472E753064N	{"id":"2PR514472E753064N","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"3R240575K28404354","status":"COMPLETED","amount":{"currency_code":"EUR","value":"66.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"66.00"},"paypal_fee":{"currency_code":"EUR","value":"2.59"},"net_amount":{"currency_code":"EUR","value":"63.41"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/3R240575K28404354","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/3R240575K28404354/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2PR514472E753064N","rel":"up","method":"GET"}],"create_time":"2023-03-22T08:48:15Z","update_time":"2023-03-22T08:48:15Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2PR514472E753064N","rel":"self","method":"GET"}]}
68	61059803SP743992B	{"id":"61059803SP743992B","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"5MD25901J4391443U","status":"COMPLETED","amount":{"currency_code":"EUR","value":"66.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"66.00"},"paypal_fee":{"currency_code":"EUR","value":"2.59"},"net_amount":{"currency_code":"EUR","value":"63.41"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/5MD25901J4391443U","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/5MD25901J4391443U/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/61059803SP743992B","rel":"up","method":"GET"}],"create_time":"2023-03-22T08:52:45Z","update_time":"2023-03-22T08:52:45Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/61059803SP743992B","rel":"self","method":"GET"}]}
69	7GW31524F44687301	{"id":"7GW31524F44687301","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"71M61951FC186182M","status":"COMPLETED","amount":{"currency_code":"EUR","value":"66.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"66.00"},"paypal_fee":{"currency_code":"EUR","value":"2.59"},"net_amount":{"currency_code":"EUR","value":"63.41"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/71M61951FC186182M","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/71M61951FC186182M/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7GW31524F44687301","rel":"up","method":"GET"}],"create_time":"2023-03-22T08:54:04Z","update_time":"2023-03-22T08:54:04Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7GW31524F44687301","rel":"self","method":"GET"}]}
70	08727622JL465690S	{"id":"08727622JL465690S","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"0YJ00981SP8800307","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/0YJ00981SP8800307","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/0YJ00981SP8800307/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/08727622JL465690S","rel":"up","method":"GET"}],"create_time":"2023-03-23T19:12:41Z","update_time":"2023-03-23T19:12:41Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/08727622JL465690S","rel":"self","method":"GET"}]}
71	4XP15409KW3922114	{"id":"4XP15409KW3922114","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"3RV503993R9623425","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/3RV503993R9623425","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/3RV503993R9623425/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/4XP15409KW3922114","rel":"up","method":"GET"}],"create_time":"2023-03-23T19:14:26Z","update_time":"2023-03-23T19:14:26Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/4XP15409KW3922114","rel":"self","method":"GET"}]}
72	6JS52940YF561243J	{"id":"6JS52940YF561243J","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"0N5219578R046632K","status":"COMPLETED","amount":{"currency_code":"EUR","value":"72.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"72.00"},"paypal_fee":{"currency_code":"EUR","value":"2.80"},"net_amount":{"currency_code":"EUR","value":"69.20"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/0N5219578R046632K","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/0N5219578R046632K/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6JS52940YF561243J","rel":"up","method":"GET"}],"create_time":"2023-03-23T21:33:37Z","update_time":"2023-03-23T21:33:37Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6JS52940YF561243J","rel":"self","method":"GET"}]}
73	9TD86761J8209135S	{"id":"9TD86761J8209135S","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"2R452834M10077154","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/2R452834M10077154","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/2R452834M10077154/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/9TD86761J8209135S","rel":"up","method":"GET"}],"create_time":"2023-03-23T21:35:57Z","update_time":"2023-03-23T21:35:57Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/9TD86761J8209135S","rel":"self","method":"GET"}]}
74	7B978088S88259903	{"id":"7B978088S88259903","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"58L43507GT9980156","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/58L43507GT9980156","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/58L43507GT9980156/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7B978088S88259903","rel":"up","method":"GET"}],"create_time":"2023-03-23T21:39:01Z","update_time":"2023-03-23T21:39:01Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7B978088S88259903","rel":"self","method":"GET"}]}
75	246757977L121780J	{"id":"246757977L121780J","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"7UY15541X09551347","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7UY15541X09551347","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7UY15541X09551347/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/246757977L121780J","rel":"up","method":"GET"}],"create_time":"2023-03-23T21:41:01Z","update_time":"2023-03-23T21:41:01Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/246757977L121780J","rel":"self","method":"GET"}]}
76	6WA82434D76088641	{"id":"6WA82434D76088641","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"4YH475831U220682A","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/4YH475831U220682A","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/4YH475831U220682A/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6WA82434D76088641","rel":"up","method":"GET"}],"create_time":"2023-03-23T21:42:46Z","update_time":"2023-03-23T21:42:46Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6WA82434D76088641","rel":"self","method":"GET"}]}
77	6AT382800R333325S	{"id":"6AT382800R333325S","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"3K252776G8906970T","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/3K252776G8906970T","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/3K252776G8906970T/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6AT382800R333325S","rel":"up","method":"GET"}],"create_time":"2023-03-23T21:43:54Z","update_time":"2023-03-23T21:43:54Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6AT382800R333325S","rel":"self","method":"GET"}]}
78	2P9857118M1701327	{"id":"2P9857118M1701327","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"88L73695N5328011Y","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/88L73695N5328011Y","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/88L73695N5328011Y/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2P9857118M1701327","rel":"up","method":"GET"}],"create_time":"2023-03-23T21:44:49Z","update_time":"2023-03-23T21:44:49Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2P9857118M1701327","rel":"self","method":"GET"}]}
79	2NL758511P6017530	{"id":"2NL758511P6017530","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"7HV992982J865491S","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7HV992982J865491S","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7HV992982J865491S/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2NL758511P6017530","rel":"up","method":"GET"}],"create_time":"2023-03-23T21:45:50Z","update_time":"2023-03-23T21:45:50Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2NL758511P6017530","rel":"self","method":"GET"}]}
80	3NY18745KE848833W	{"id":"3NY18745KE848833W","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"49E85558634153923","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/49E85558634153923","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/49E85558634153923/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/3NY18745KE848833W","rel":"up","method":"GET"}],"create_time":"2023-03-24T10:22:49Z","update_time":"2023-03-24T10:22:49Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/3NY18745KE848833W","rel":"self","method":"GET"}]}
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
1	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
4	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
7	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
8	Жопка	Попка	+380689901426	kaieta.ievgenii@gmail.com	Казанова	12	Київ	KYIV	UA	01010
9	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
10	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
11	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
12	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
13	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
14	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
15	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
16	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
17	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
18	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
19	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
20	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
21	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
22	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Stará Vajnorská, 39	2132	Bratislava	\N	SK	821 01
23	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Stará Vajnorská, 39	2132	Bratislava	\N	SK	821 01
24	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
25	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
26	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
27	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
28	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Stará Vajnorská, 39	2132	Bratislava	\N	SK	821 01
29	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Stará Vajnorská, 39	2132	Bratislava	\N	SK	821 01
30	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
31	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
32	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
33	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
34	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
35	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
36	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
37	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
38	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
39	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
40	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
41	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
42	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
43	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
44	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
45	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
46	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
47	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
48	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
49	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
50	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01
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
-- Name: contact_us_id_seq; Type: SEQUENCE SET; Schema: public; Owner: printmall
--

SELECT pg_catalog.setval('public.contact_us_id_seq', 16, true);


--
-- Name: newslist_emails_newslist_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: printmall
--

SELECT pg_catalog.setval('public.newslist_emails_newslist_email_id_seq', 12, true);


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: printmall
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 30, true);


--
-- Name: payments_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: printmall
--

SELECT pg_catalog.setval('public.payments_payment_id_seq', 80, true);


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

SELECT pg_catalog.setval('public.shipping_info_shipping_info_id_seq', 50, true);


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
-- Name: contact_us contact_us_pkey; Type: CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.contact_us
    ADD CONSTRAINT contact_us_pkey PRIMARY KEY (id);


--
-- Name: newslist_emails newslist_emails_pkey; Type: CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.newslist_emails
    ADD CONSTRAINT newslist_emails_pkey PRIMARY KEY (newslist_email_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (payment_id);


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
-- Name: orders fr_orders_payments; Type: FK CONSTRAINT; Schema: public; Owner: printmall
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fr_orders_payments FOREIGN KEY (payment_id) REFERENCES public.payments(payment_id);


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

