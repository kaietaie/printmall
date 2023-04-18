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
    city character varying(200),
    country character varying(50),
    region character varying(50),
    zip character varying(10) NOT NULL,
    shipping_method character varying(20),
    warehouse character varying(200)
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
17	Evgeniy	Kaieta	kaieta.ievgenii@gmail.com	+380667232701	saddvf
18	Evgeniy	Kaieta	kaieta.ievgenii@gmail.com	+380667232701	saddvf
19	Євгеній	Каєта	kaieta.ievgenii@gmail.com	380689901426	Ой який хороший сайт!
20	Євгеній	Каєта	kaieta.ievgenii@gmail.com	380689901426	Yo! 
21	Ievgenii	Kaieta	kaieta.ievgenii@gmail.com	421094959020	Pipika
22	Євгеній	Каєта	kaieta.ievgenii@gmail.com	380689901426	Тестове повідомлення
23	Генадій	Лебовський	kaieta.ievgenii@gmail.com	380689901426	Я  тут єто... Хотів заказать. Але приїду сам
24	Ігнат 	Залупенський	kaieta.ievgenii@gmail.com	380689901426	Іва́н Петро́вич Котляре́вський — український письменник, військовий, класик нової української літератури, громадський діяч. Його поема «Енеїда» стала великим твором загальнонаціонального значення нової української літератури, написаним народною мовою.
25	Євгеній	Каєта	kaieta.ievgenii@gmail.com	380689901426	Автор поеми «Енеїда» («Енеида. На малороссійскій языкъ перелиціованная И. Котляревскимъ» 1798 р.) – першого в українській літературі твору, написаного й видрукованого живою народною мовою, який започаткував якісно новий етап розвитку української літературної мови.
26	Євгеній	Каєта	kaieta.ievgenii@gmail.com	210689901426	wqdwqdq
27	Євгеній	Каєта	kaieta.ievgenii@gmail.com	012689901426	sadasd
28	Євгеній	Каєта	kaieta.ievgenii@gmail.com	32068990142	Опис Класик нової української літератури помер у 1838 році у віці 69 років. Згідно з заповітом поета, він був похований на міському цвинтарі під розлогою тополею обабіч Кобеляцького тракту.
29	Євгеній	Каєта	kaieta.ievgenii@gmail.com	12106899014	 у Полтаві народився Іван Котляревський, письменник, поет, драматург, громадський діяч,
30	Євгеній	Каєта	kaieta.ievgenii@gmail.com	242068990142	КОТЛЯРЕВСЬКИЙ Іван Петрович (09.09(29.08).1769–10.11(29. 10).1838) – письменник, театральний і громад. діяч.
31	Євгеній	Каєта	kaieta.ievgenii@gmail.com	68990142622	{ first_name, last_name, email, phone, message, lang }
32	Євгеній	Каєта	kaieta.ievgenii@gmail.com	32068990142	Learning a little each day adds up. Research shows that students who make learning a habit are more likely to retain information and reach their goals. Set time aside to learn and get reminders using your learning event scheduler.
33	Євгеній	Каєта	kaieta.isevgenii@gmail.com	12068990142	 console.log(dataMail)
34	Євгеній	Каєта	kaieta.ievgenii@gmail.com	32068990142	Let’s examine the statement in a greater detail:\n\nFirst, specify the name of the table to which the column you want to change after the ALTER TABLE keywords.\nSecond, specify the name of the column that you want to change the data type after the ALTER COLUMN clause.
35	Ievgenii	Kaieta	kaieta.ievgenii@gmail.com	32432121312	Опис Класик нової української літератури помер у 1838 році у віці 69 років. Згідно з заповітом поета, він був похований на міському цвинтарі під розлогою тополею обабіч Кобеляцького тракту
36	Євгеній	Каєта	kaieta.ievgenii@gmail.com	206899014262	Если нет семантической причины использовать элемент <b>, использование css свойства font-weight (en-US) со значением bold будет более грамотным выбором для изменения толщины текста.
37	Євгеній	Каєта	kaieta.ievgenii@gmail.com	210689901426	Если нет семантической причины использовать элемент <b>, использование css свойства font-weight (en-US) со значением bold будет более грамотным выбором для изменения толщины текста.
38	Євгеній	Каєта	kaieta.ievgenii@gmail.com	21689901426	даному коді регулярний вираз / <b> /g використовується для пошуку всіх входжень <b> у рядку, а &lt;b&gt; є HTML-кодом для <b>. Результатом цього коду буде замінений рядок encodedString, в якому тег <b> буде замінено на його еквіва
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
13	kaieta.ievgenii@gmail.com
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
31	92	\N	58	1	58	0	58
32	92	\N	58	1	58	0	58
137	92	\N	58	1	58	0	58
137	92	\N	58	1	58	0	58
138	92	\N	58	1	58	0	58
139	92	\N	58	1	58	0	58
139	92	\N	58	1	58	0	58
140	92	\N	58	1	58	0	58
140	92	\N	58	1	58	0	58
143	92	\N	58	1	58	0	58
143	92	\N	58	1	58	0	58
145	92	\N	58	1	116	0	116
145	85	\N	58	1	116	0	116
145	92	\N	58	1	116	0	116
145	85	\N	58	1	116	0	116
147	92	\N	58	1	176	0	176
147	85	\N	58	1	176	0	176
147	115	\N	60	1	176	0	176
147	92	\N	58	1	176	0	176
147	85	\N	58	1	176	0	176
147	115	\N	60	1	176	0	176
152	108	\N	60	1	60	0	60
152	108	\N	60	1	60	0	60
172	89	\N	58	1	58	0	58
172	89	\N	58	1	58	0	58
172	89	\N	58	1	58	0	58
172	89	\N	58	1	58	0	58
174	89	\N	58	1	58	0	58
174	89	\N	58	1	58	0	58
174	89	\N	58	1	58	0	58
174	89	\N	58	1	58	0	58
174	89	\N	58	1	58	0	58
174	89	\N	58	1	58	0	58
176	84	\N	58	1	58	0	58
178	64	\N	72	1	72	0	72
178	64	\N	72	1	72	0	72
178	64	\N	72	1	72	0	72
178	64	\N	72	1	72	0	72
178	64	\N	72	1	72	0	72
178	64	\N	72	1	72	0	72
180	70	\N	72	1	72	0	72
181	89	\N	58	1	58	0	58
182	85	\N	58	1	58	0	58
183	89	\N	58	1	290	0	290
183	82	\N	58	4	290	0	290
183	89	\N	58	1	290	0	290
183	82	\N	58	4	290	0	290
183	89	\N	58	1	290	0	290
183	82	\N	58	4	290	0	290
183	89	\N	58	1	290	0	290
183	82	\N	58	4	290	0	290
183	89	\N	58	1	290	0	290
183	82	\N	58	4	290	0	290
183	89	\N	58	1	290	0	290
183	82	\N	58	4	290	0	290
186	87	\N	58	5	290	0	540
186	87	\N	58	5	290	0	540
186	87	\N	58	5	290	0	540
186	87	\N	58	5	290	0	540
186	87	\N	58	5	290	0	540
186	87	\N	58	5	290	0	540
187	87	\N	58	5	290	0	540
187	87	\N	58	5	290	0	540
187	87	\N	58	5	290	0	540
187	87	\N	58	5	290	0	540
187	87	\N	58	5	290	0	540
187	87	\N	58	5	290	0	540
188	87	\N	58	5	290	0	540
188	87	\N	58	5	290	0	540
188	87	\N	58	5	290	0	540
188	87	\N	58	5	290	0	540
188	87	\N	58	5	290	0	540
188	87	\N	58	5	290	0	540
189	87	\N	58	5	290	0	540
189	87	\N	58	5	290	0	540
189	87	\N	58	5	290	0	540
189	87	\N	58	5	290	0	540
189	87	\N	58	5	290	0	540
189	87	\N	58	5	290	0	540
190	87	\N	58	5	290	0	540
190	87	\N	58	5	290	0	540
191	87	\N	58	5	290	0	540
191	87	\N	58	5	290	0	540
192	87	\N	58	5	290	0	540
192	\N	Shipping	250	1	250	0	540
192	87	\N	58	5	290	0	540
192	\N	Shipping	250	1	250	0	540
193	87	\N	58	5	290	0	540
193	\N	Shipping	250	1	250	0	540
193	87	\N	58	5	290	0	540
193	\N	Shipping	250	1	250	0	540
194	87	\N	58	5	290	0	540
194	\N	Shipping	250	1	250	0	540
194	87	\N	58	5	290	0	540
194	\N	Shipping	250	1	250	0	540
195	87	\N	58	5	290	0	540
195	\N	Shipping	250	1	250	0	540
195	87	\N	58	5	290	0	540
195	\N	Shipping	250	1	250	0	540
196	87	\N	58	5	290	0	540
196	\N	Shipping	250	1	250	0	540
196	87	\N	58	5	290	0	540
196	\N	Shipping	250	1	250	0	540
197	84	\N	58	1	58	0	308
197	\N	Shipping	250	1	250	0	308
197	84	\N	58	1	58	0	308
197	\N	Shipping	250	1	250	0	308
198	98	\N	66	1	66	0	316
198	\N	Shipping	250	1	250	0	316
198	98	\N	66	1	66	0	316
198	\N	Shipping	250	1	250	0	316
199	92	\N	58	1	58	0	308
199	\N	Shipping	250	1	250	0	308
199	92	\N	58	1	58	0	308
199	\N	Shipping	250	1	250	0	308
209	87	\N	58	1	58	0	308
209	\N	Shipping	250	1	250	0	308
209	87	\N	58	1	58	0	308
209	\N	Shipping	250	1	250	0	308
\N	102	\N	66	1	66	0	316
215	76	\N	72	1	72	0	322
216	95	\N	66	1	66	0	316
216	\N	Shipping	250	1	250	0	316
216	95	\N	66	1	66	0	316
216	\N	Shipping	250	1	250	0	316
217	89	\N	58	1	58	0	308
218	92	\N	58	4	232	0	482
219	67	\N	72	1	72	0	322
220	83	\N	58	1	58	0	308
220	\N	Shipping	250	1	250	0	308
221	70	\N	72	2	144	0	394
222	67	\N	72	3	216	0	466
222	\N	Shipping	250	1	250	0	466
223	76	\N	72	2	144	0	394
223	\N	Shipping	250	1	250	0	394
238	92	\N	58	1	58	0	374
238	101	\N	66	1	66	0	374
238	\N	Shipping	250	1	250	0	374
239	67	\N	72	1	72	0	394
239	68	\N	72	1	72	0	394
239	\N	Shipping	250	1	250	0	394
240	92	\N	58	1	58	0	308
240	\N	Shipping	250	1	250	0	308
241	92	\N	58	1	58	0	308
241	\N	Shipping	250	1	250	0	308
243	92	\N	58	2	116	0	366
243	\N	Shipping	250	1	250	0	366
244	89	\N	58	1	58	0	308
244	\N	Shipping	250	1	250	0	308
244	89	\N	58	1	58	0	308
244	\N	Shipping	250	1	250	0	308
246	98	\N	66	2	132	0	506
246	95	\N	66	1	66	0	506
246	92	\N	58	1	58	0	506
246	\N	Shipping	250	1	250	0	506
247	83	\N	58	1	58	0	308
247	\N	Shipping	250	1	250	0	308
247	83	\N	58	1	58	0	308
247	\N	Shipping	250	1	250	0	308
247	83	\N	58	1	58	0	308
247	\N	Shipping	250	1	250	0	308
247	83	\N	58	1	58	0	308
247	\N	Shipping	250	1	250	0	308
248	92	\N	58	1	58	0	308
248	\N	Shipping	250	1	250	0	308
250	101	\N	66	1	66	0	316
250	\N	Shipping	250	1	250	0	316
255	92	\N	58	1	58	0	308
255	\N	Shipping	250	1	250	0	308
256	89	\N	58	1	58	0	308
256	\N	Shipping	250	1	250	0	308
256	89	\N	58	1	58	0	308
256	\N	Shipping	250	1	250	0	308
257	67	\N	72	1	72	0	322
257	\N	Shipping	250	1	250	0	322
258	118	\N	60	1	60	0	310
258	\N	Shipping	250	1	250	0	310
258	118	\N	60	1	60	0	310
258	\N	Shipping	250	1	250	0	310
269	89	\N	58	1	58	0	308
269	\N	Shipping	250	1	250	0	308
269	89	\N	58	1	58	0	308
269	\N	Shipping	250	1	250	0	308
270	92	\N	58	1	58	0	308
270	\N	Shipping	250	1	250	0	308
270	92	\N	58	1	58	0	308
270	\N	Shipping	250	1	250	0	308
271	89	\N	58	1	58	0	308
271	\N	Shipping	250	1	250	0	308
272	89	\N	58	1	58	0	308
272	\N	Shipping	250	1	250	0	308
274	70	\N	72	1	72	0	322
274	\N	Shipping	250	1	250	0	322
274	70	\N	72	1	72	0	NaN
274	70	\N	72	1	72	0	NaN
278	70	\N	72	1	72	0	454
278	98	\N	66	2	132	0	454
278	\N	Shipping	250	1	250	0	454
278	70	\N	72	1	72	0	NaN
278	98	\N	66	2	132	0	NaN
278	70	\N	72	1	72	0	NaN
278	98	\N	66	2	132	0	NaN
278	70	\N	72	1	72	0	NaN
278	98	\N	66	2	132	0	NaN
278	70	\N	72	1	72	0	NaN
278	98	\N	66	2	132	0	NaN
281	70	\N	72	1	72	0	520
281	98	\N	66	3	198	0	520
281	\N	Shipping	250	1	250	0	520
285	101	\N	66	1	66	0	316
285	\N	Shipping	250	1	250	0	316
291	101	\N	66	1	66	0	388
291	76	\N	72	1	72	0	388
291	\N	Shipping	250	1	250	0	388
291	101	\N	66	1	66	0	388
291	76	\N	72	1	72	0	388
291	\N	Shipping	250	1	250	0	388
291	101	\N	66	1	66	0	388
291	76	\N	72	1	72	0	388
291	\N	Shipping	250	1	250	0	388
292	81	\N	58	1	58	0	308
292	\N	Shipping	250	1	250	0	308
293	98	\N	66	1	66	0	316
293	\N	Shipping	250	1	250	0	316
302	92	\N	58	2	116	0	570
302	\N	Shipping	454	1	454	0	570
303	89	\N	58	1	58	0	313
303	\N	Shipping	255	1	255	0	313
304	92	\N	58	1	58	0	166
304	89	\N	58	1	58	0	166
304	\N	Shipping	50	1	50	0	166
307	98	\N	66	1	66	0	321
307	\N	Shipping	255	1	255	0	321
308	79	\N	72	2	144	0	214
308	\N	Shipping	70	1	70	0	214
309	68	\N	72	1	72	0	316
309	85	\N	58	1	58	0	316
309	84	\N	58	2	116	0	316
309	\N	Shipping	70	1	70	0	316
310	67	\N	72	1	72	0	142
310	\N	Shipping	70	1	70	0	142
311	70	\N	72	1	72	0	142
311	\N	Shipping	70	1	70	0	142
312	70	\N	72	1	72	0	142
312	\N	Shipping	70	1	70	0	142
320	70	\N	72	1	72	0	863
320	101	\N	66	1	66	0	863
320	81	\N	58	1	58	0	863
320	\N	Shipping	667	1	667	0	863
321	101	\N	66	1	66	0	202
321	103	\N	66	1	66	0	202
321	\N	Shipping	70	1	70	0	202
322	76	\N	72	1	72	0	142
322	\N	Shipping	70	1	70	0	142
324	73	\N	72	1	72	0	142
324	\N	Shipping	70	1	70	0	142
325	85	\N	58	1	58	0	128
325	\N	Shipping	70	1	70	0	128
326	89	\N	58	1	58	0	244
326	84	\N	58	1	58	0	244
326	87	\N	58	1	58	0	244
326	\N	Shipping	70	1	70	0	244
327	85	\N	58	1	58	0	477
327	\N	Shipping	419	1	419	0	477
328	69	\N	72	1	72	0	122
328	\N	Shipping	50	1	50	0	122
329	69	\N	72	1	72	0	142
329	\N	Shipping	70	1	70	0	142
330	69	\N	72	1	72	0	142
330	\N	Shipping	70	1	70	0	142
331	92	\N	58	1	58	0	128
331	\N	Shipping	70	1	70	0	128
332	70	\N	72	1	72	0	142
332	\N	Shipping	70	1	70	0	142
333	89	\N	58	1	58	0	128
333	\N	Shipping	70	1	70	0	128
334	92	\N	58	1	58	0	128
334	\N	Shipping	70	1	70	0	128
335	83	\N	58	1	58	0	128
335	\N	Shipping	70	1	70	0	128
336	104	\N	66	1	66	0	202
336	102	\N	66	1	66	0	202
336	\N	Shipping	70	1	70	0	202
337	92	\N	58	1	58	0	128
337	\N	Shipping	70	1	70	0	128
338	70	\N	72	1	72	0	598
338	69	\N	72	1	72	0	598
338	\N	Shipping	454	1	454	0	598
339	67	\N	72	2	144	0	598
339	\N	Shipping	454	1	454	0	598
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
31	51	81	t	f	f
32	52	82	t	f	f
33	64	\N	f	f	f
34	65	\N	f	f	f
35	66	\N	f	f	f
36	67	\N	f	f	f
37	68	\N	f	f	f
38	69	\N	f	f	f
39	70	\N	f	f	f
40	71	\N	f	f	f
41	72	\N	f	f	f
42	73	\N	f	f	f
43	74	\N	f	f	f
44	75	\N	f	f	f
45	76	\N	f	f	f
46	77	\N	f	f	f
47	78	\N	f	f	f
48	79	\N	f	f	f
49	80	\N	f	f	f
50	81	\N	f	f	f
51	82	\N	f	f	f
52	83	\N	f	f	f
53	84	\N	f	f	f
54	85	\N	f	f	f
55	86	\N	f	f	f
56	87	\N	f	f	f
57	88	\N	f	f	f
58	89	\N	f	f	f
59	90	\N	f	f	f
60	91	\N	f	f	f
61	92	\N	f	f	f
62	93	\N	f	f	f
63	94	\N	f	f	f
64	95	\N	f	f	f
65	96	\N	f	f	f
66	97	\N	f	f	f
67	98	\N	f	f	f
68	99	\N	f	f	f
69	100	\N	f	f	f
70	101	\N	f	f	f
71	102	\N	f	f	f
72	103	\N	f	f	f
73	104	\N	f	f	f
74	105	\N	f	f	f
75	106	\N	f	f	f
76	107	\N	f	f	f
77	108	\N	f	f	f
78	109	\N	f	f	f
79	110	\N	f	f	f
80	111	\N	f	f	f
81	112	\N	f	f	f
82	113	\N	f	f	f
83	114	\N	f	f	f
84	115	\N	f	f	f
85	116	\N	f	f	f
86	117	\N	f	f	f
87	118	\N	f	f	f
88	119	\N	f	f	f
89	120	\N	f	f	f
90	121	\N	f	f	f
91	124	\N	f	f	f
92	125	\N	f	f	f
93	126	\N	f	f	f
94	127	\N	f	f	f
95	128	\N	f	f	f
96	129	\N	f	f	f
97	130	\N	f	f	f
98	131	\N	f	f	f
99	132	\N	f	f	f
100	133	\N	f	f	f
101	134	\N	f	f	f
102	135	\N	f	f	f
103	136	\N	f	f	f
104	137	\N	f	f	f
105	138	\N	f	f	f
106	139	\N	f	f	f
107	140	\N	f	f	f
108	141	\N	f	f	f
109	142	\N	f	f	f
110	143	\N	f	f	f
111	144	\N	f	f	f
112	145	\N	f	f	f
113	146	\N	f	f	f
114	147	\N	f	f	f
115	148	\N	f	f	f
116	149	\N	f	f	f
117	150	\N	f	f	f
118	151	\N	f	f	f
119	152	\N	f	f	f
120	153	\N	f	f	f
121	154	\N	f	f	f
122	155	\N	f	f	f
123	156	\N	f	f	f
124	157	\N	f	f	f
125	158	\N	f	f	f
126	159	\N	f	f	f
127	160	\N	f	f	f
128	161	\N	f	f	f
129	162	\N	f	f	f
130	163	\N	f	f	f
131	164	\N	f	f	f
132	165	\N	f	f	f
133	166	\N	f	f	f
134	167	\N	f	f	f
135	168	\N	f	f	f
136	169	\N	f	f	f
137	170	\N	f	f	f
138	175	\N	f	f	f
139	176	\N	f	f	f
140	177	\N	f	f	f
141	178	\N	f	f	f
142	179	\N	f	f	f
143	180	\N	f	f	f
144	181	\N	f	f	f
145	182	\N	f	f	f
146	183	\N	f	f	f
147	184	\N	f	f	f
148	185	\N	f	f	f
149	186	\N	f	f	f
150	187	\N	f	f	f
151	188	\N	f	f	f
152	189	\N	f	f	f
153	190	\N	f	f	f
154	191	\N	f	f	f
155	192	\N	f	f	f
156	193	\N	f	f	f
157	194	\N	f	f	f
158	195	\N	f	f	f
159	196	\N	f	f	f
160	197	\N	f	f	f
161	198	\N	f	f	f
162	199	\N	f	f	f
163	200	\N	f	f	f
164	201	\N	f	f	f
165	202	\N	f	f	f
166	203	\N	f	f	f
167	204	\N	f	f	f
168	205	\N	f	f	f
169	206	\N	f	f	f
170	207	\N	f	f	f
171	208	\N	f	f	f
172	209	\N	f	f	f
173	210	\N	f	f	f
174	211	\N	f	f	f
175	212	\N	f	f	f
176	213	\N	f	f	f
177	214	117	f	f	f
179	216	\N	f	f	f
178	215	123	t	f	f
180	217	\N	f	f	f
181	218	\N	f	f	f
182	219	\N	f	f	f
184	221	\N	f	f	f
183	220	132	t	f	f
185	222	\N	f	f	f
186	223	\N	f	f	f
187	224	\N	f	f	f
188	225	\N	f	f	f
189	226	\N	f	f	f
190	227	\N	f	f	f
191	228	\N	f	f	f
302	343	200	t	f	f
192	229	134	t	f	f
303	344	201	t	f	f
193	230	136	t	f	f
194	231	138	t	f	f
304	345	202	t	f	f
195	232	140	t	f	f
305	\N	\N	f	f	f
196	233	142	t	f	f
306	\N	\N	f	f	f
197	234	144	t	f	f
198	235	146	t	f	f
307	354	203	t	f	f
199	236	148	t	f	f
200	237	\N	f	f	f
201	238	\N	f	f	f
202	239	\N	f	f	f
203	240	\N	f	f	f
204	241	\N	f	f	f
205	242	\N	f	f	f
206	243	\N	f	f	f
207	244	\N	f	f	f
208	245	\N	f	f	f
209	246	150	t	f	f
210	247	\N	f	f	f
211	248	\N	f	f	f
212	249	152	f	f	f
213	250	153	f	f	f
214	251	154	f	f	f
215	252	155	t	f	f
308	355	204	t	f	f
216	253	157	t	f	f
217	254	158	t	f	f
218	255	159	t	f	f
219	256	160	t	f	f
220	257	161	t	f	f
221	258	162	t	f	f
222	259	163	t	f	f
223	260	164	t	f	f
224	261	\N	f	f	f
225	\N	\N	f	f	f
226	\N	\N	f	f	f
227	\N	\N	f	f	f
228	\N	\N	f	f	f
229	\N	\N	f	f	f
230	\N	\N	f	f	f
231	\N	\N	f	f	f
232	\N	\N	f	f	f
233	\N	\N	f	f	f
234	\N	\N	f	f	f
235	\N	\N	f	f	f
236	\N	\N	f	f	f
237	\N	\N	f	f	f
238	\N	165	t	f	f
239	262	166	t	f	f
240	263	167	t	f	f
241	264	168	t	f	f
242	265	\N	f	f	f
243	266	169	t	f	f
244	267	171	t	f	f
245	268	\N	f	f	f
246	270	172	t	f	f
309	\N	205	t	f	f
310	\N	206	t	f	f
247	271	176	t	f	f
248	272	177	t	f	f
249	273	\N	f	f	f
250	274	178	t	f	f
251	275	\N	f	f	f
252	275	\N	f	f	f
253	275	\N	f	f	f
254	275	\N	f	f	f
255	275	179	t	f	f
256	276	181	t	f	f
257	277	182	t	f	f
311	\N	207	t	f	f
258	278	184	t	f	f
259	279	\N	f	f	f
260	280	\N	f	f	f
261	\N	\N	f	f	f
262	\N	\N	f	f	f
263	\N	\N	f	f	f
264	281	\N	f	f	f
265	282	\N	f	f	f
266	283	\N	f	f	f
267	284	\N	f	f	f
268	285	\N	f	f	f
269	286	186	t	f	f
312	356	208	t	f	f
270	287	188	t	f	f
271	288	189	t	f	f
272	289	190	t	f	f
273	290	\N	f	f	f
275	290	\N	f	f	f
274	290	191	t	f	f
276	\N	\N	f	f	f
277	\N	\N	f	f	f
278	291	192	t	f	f
279	\N	\N	f	f	f
280	\N	\N	f	f	f
313	\N	\N	f	f	f
282	293	\N	f	f	f
283	294	\N	f	f	f
284	294	\N	f	f	f
285	294	\N	f	f	f
286	295	\N	f	f	f
287	\N	\N	f	f	f
288	\N	\N	f	f	f
289	\N	\N	f	f	f
290	\N	\N	f	f	f
314	\N	\N	f	f	f
315	\N	\N	f	f	f
316	\N	\N	f	f	f
317	\N	\N	f	f	f
318	\N	\N	f	f	f
319	359	\N	f	f	f
320	364	209	t	f	f
321	365	210	t	f	f
322	366	211	t	f	f
323	367	\N	f	f	f
324	368	212	t	f	f
325	369	213	t	f	f
292	297	198	t	t	t
293	298	199	t	t	t
326	370	214	t	f	f
327	371	215	t	f	f
328	372	216	t	f	f
329	373	217	t	f	f
330	374	218	t	f	f
331	376	219	t	f	f
332	377	220	t	f	f
333	378	221	t	f	f
334	379	222	t	f	f
335	380	223	t	f	f
291	296	197	t	f	f
336	381	224	t	f	f
337	382	225	t	f	f
281	292	193	t	t	f
294	331	\N	f	f	f
295	331	\N	f	f	f
296	332	\N	f	f	f
297	333	\N	f	f	f
298	\N	\N	f	f	f
299	\N	\N	f	f	f
300	\N	\N	f	f	f
301	\N	\N	f	f	f
338	383	226	t	f	f
339	394	227	t	f	f
340	399	\N	f	f	f
341	399	\N	f	f	f
342	399	\N	f	f	f
343	400	\N	f	f	f
344	\N	\N	f	f	f
345	\N	\N	f	f	f
346	401	\N	f	f	f
347	401	\N	f	f	f
348	401	\N	f	f	f
349	401	\N	f	f	f
350	401	\N	f	f	f
351	401	\N	f	f	f
352	402	\N	f	f	f
353	403	\N	f	f	f
354	403	\N	f	f	f
355	403	\N	f	f	f
356	\N	\N	f	f	f
357	404	\N	f	f	f
358	405	\N	f	f	f
359	405	\N	f	f	f
360	405	\N	f	f	f
361	406	\N	f	f	f
362	406	\N	f	f	f
363	\N	\N	f	f	f
364	\N	\N	f	f	f
365	410	\N	f	f	f
366	410	\N	f	f	f
367	\N	\N	f	f	f
368	\N	\N	f	f	f
369	411	\N	f	f	f
370	412	\N	f	f	f
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
108	2304058VHzbHWm6TTDhM	{"maskedPan":"42424242******42","approvalCode":"585361","rrn":"072413768317","createdDate":"2023-04-05T21:55:29Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":75,"domesticCard":true,"country":"804","amount":5800,"ccy":980,"finalAmount":5800}
109	2304058VHzbHWm6TTDhM	{"maskedPan":"42424242******42","approvalCode":"585361","rrn":"072413768317","createdDate":"2023-04-05T21:55:29Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":75,"domesticCard":true,"country":"804","amount":5800,"ccy":980,"finalAmount":5800}
110	2304058VHzbHWm6TTDhM	{"maskedPan":"42424242******42","approvalCode":"585361","rrn":"072413768317","createdDate":"2023-04-05T21:55:29Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":75,"domesticCard":true,"country":"804","amount":5800,"ccy":980,"finalAmount":5800}
187	230410CvVAtHCabn6ieo	{"maskedPan":"42424242******42","approvalCode":"960257","rrn":"076029464173","createdDate":"2023-04-10T19:14:09Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":400,"domesticCard":true,"country":"804","amount":30800,"ccy":980,"finalAmount":30800}
7	07D367855E8938733	{"id":"07D367855E8938733","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"1UK97880NP965670K","status":"COMPLETED","amount":{"currency_code":"EUR","value":"60.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"60.00"},"paypal_fee":{"currency_code":"EUR","value":"2.39"},"net_amount":{"currency_code":"EUR","value":"57.61"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/1UK97880NP965670K","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/1UK97880NP965670K/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/07D367855E8938733","rel":"up","method":"GET"}],"create_time":"2023-03-18T22:04:36Z","update_time":"2023-03-18T22:04:36Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/07D367855E8938733","rel":"self","method":"GET"}]}
8	71A98284MR035082H	{"id":"71A98284MR035082H","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"2ET756119B9392456","status":"COMPLETED","amount":{"currency_code":"EUR","value":"60.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"60.00"},"paypal_fee":{"currency_code":"EUR","value":"2.39"},"net_amount":{"currency_code":"EUR","value":"57.61"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/2ET756119B9392456","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/2ET756119B9392456/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/71A98284MR035082H","rel":"up","method":"GET"}],"create_time":"2023-03-18T22:06:05Z","update_time":"2023-03-18T22:06:05Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/71A98284MR035082H","rel":"self","method":"GET"}]}
9	8VR36553PA702350A	{"id":"8VR36553PA702350A","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"98T24431ES1759046","status":"COMPLETED","amount":{"currency_code":"EUR","value":"60.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"60.00"},"paypal_fee":{"currency_code":"EUR","value":"2.39"},"net_amount":{"currency_code":"EUR","value":"57.61"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/98T24431ES1759046","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/98T24431ES1759046/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/8VR36553PA702350A","rel":"up","method":"GET"}],"create_time":"2023-03-18T22:14:48Z","update_time":"2023-03-18T22:14:48Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/8VR36553PA702350A","rel":"self","method":"GET"}]}
10	05R1926946095990P	{"id":"05R1926946095990P","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"9851004552283963G","status":"COMPLETED","amount":{"currency_code":"EUR","value":"60.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"60.00"},"paypal_fee":{"currency_code":"EUR","value":"2.39"},"net_amount":{"currency_code":"EUR","value":"57.61"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/9851004552283963G","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/9851004552283963G/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/05R1926946095990P","rel":"up","method":"GET"}],"create_time":"2023-03-18T22:19:36Z","update_time":"2023-03-18T22:19:36Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/05R1926946095990P","rel":"self","method":"GET"}]}
141	23040782VwiVAhhDGfvx	{"maskedPan":"42424242******42","approvalCode":"219943","rrn":"072497757929","createdDate":"2023-04-07T08:42:13Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":702,"domesticCard":true,"country":"804","amount":54000,"ccy":980,"finalAmount":54000}
142	23040782VwiVAhhDGfvx	{"maskedPan":"42424242******42","approvalCode":"219943","rrn":"072497757929","createdDate":"2023-04-07T08:42:13Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":702,"domesticCard":true,"country":"804","amount":54000,"ccy":980,"finalAmount":54000}
188	230410CvVAtHCabn6ieo	{"maskedPan":"42424242******42","approvalCode":"960257","rrn":"076029464173","createdDate":"2023-04-10T19:14:09Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":400,"domesticCard":true,"country":"804","amount":30800,"ccy":980,"finalAmount":30800}
11	21E70418FM2245127	{"id":"21E70418FM2245127","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"8MC40744VA0068250","status":"COMPLETED","amount":{"currency_code":"EUR","value":"60.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"60.00"},"paypal_fee":{"currency_code":"EUR","value":"2.39"},"net_amount":{"currency_code":"EUR","value":"57.61"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/8MC40744VA0068250","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/8MC40744VA0068250/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/21E70418FM2245127","rel":"up","method":"GET"}],"create_time":"2023-03-18T22:27:21Z","update_time":"2023-03-18T22:27:21Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/21E70418FM2245127","rel":"self","method":"GET"}]}
12	22E91026AK864832S	{"id":"22E91026AK864832S","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"408295690C412342T","status":"COMPLETED","amount":{"currency_code":"EUR","value":"60.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"60.00"},"paypal_fee":{"currency_code":"EUR","value":"2.39"},"net_amount":{"currency_code":"EUR","value":"57.61"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/408295690C412342T","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/408295690C412342T/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/22E91026AK864832S","rel":"up","method":"GET"}],"create_time":"2023-03-18T22:27:47Z","update_time":"2023-03-18T22:27:47Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/22E91026AK864832S","rel":"self","method":"GET"}]}
13	0T271033LA1473848	{"id":"0T271033LA1473848","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"8GA47419WD381925C","status":"COMPLETED","amount":{"currency_code":"EUR","value":"60.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"60.00"},"paypal_fee":{"currency_code":"EUR","value":"2.39"},"net_amount":{"currency_code":"EUR","value":"57.61"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/8GA47419WD381925C","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/8GA47419WD381925C/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/0T271033LA1473848","rel":"up","method":"GET"}],"create_time":"2023-03-18T22:31:18Z","update_time":"2023-03-18T22:31:18Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/0T271033LA1473848","rel":"self","method":"GET"}]}
14	89E57633S72230805	{"id":"89E57633S72230805","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"83P82489G75053920","status":"COMPLETED","amount":{"currency_code":"EUR","value":"60.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"60.00"},"paypal_fee":{"currency_code":"EUR","value":"2.39"},"net_amount":{"currency_code":"EUR","value":"57.61"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/83P82489G75053920","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/83P82489G75053920/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/89E57633S72230805","rel":"up","method":"GET"}],"create_time":"2023-03-18T22:34:56Z","update_time":"2023-03-18T22:34:56Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/89E57633S72230805","rel":"self","method":"GET"}]}
143	2304075njFxEjf7LVCtV	{"maskedPan":"42424242******42","approvalCode":"803582","rrn":"074177366875","createdDate":"2023-04-07T09:00:48Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":400,"domesticCard":true,"country":"804","amount":30800,"ccy":980,"finalAmount":30800}
144	2304075njFxEjf7LVCtV	{"maskedPan":"42424242******42","approvalCode":"803582","rrn":"074177366875","createdDate":"2023-04-07T09:00:48Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":400,"domesticCard":true,"country":"804","amount":30800,"ccy":980,"finalAmount":30800}
189	230410Eo69YtqeZtG6yA	{"maskedPan":"42424242******42","approvalCode":"166960","rrn":"073417465216","createdDate":"2023-04-10T19:20:59Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":400,"domesticCard":true,"country":"804","amount":30800,"ccy":980,"finalAmount":30800}
15	5LL22108VS398274C	{"id":"5LL22108VS398274C","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"5XS12308VY802261B","status":"COMPLETED","amount":{"currency_code":"EUR","value":"60.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"60.00"},"paypal_fee":{"currency_code":"EUR","value":"2.39"},"net_amount":{"currency_code":"EUR","value":"57.61"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/5XS12308VY802261B","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/5XS12308VY802261B/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/5LL22108VS398274C","rel":"up","method":"GET"}],"create_time":"2023-03-18T23:31:38Z","update_time":"2023-03-18T23:31:38Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/5LL22108VS398274C","rel":"self","method":"GET"}]}
16	5UP35488CK1890222	{"id":"5UP35488CK1890222","status":"COMPLETED","payment_source":{"paypal":{"email_address":"kaieta.ievgenii@gmail.com","account_id":"KRW7VPXJZ9AH8","name":{"given_name":"Ievgenii","surname":"Kas"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"Ievgenii Kas"},"address":{"address_line_1":"Stará Vajnorská, 39","admin_area_2":"Bratislava","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"1G868122LW729025A","status":"COMPLETED","amount":{"currency_code":"EUR","value":"60.00"},"final_capture":true,"seller_protection":{"status":"NOT_ELIGIBLE"},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"60.00"},"paypal_fee":{"currency_code":"EUR","value":"2.39"},"net_amount":{"currency_code":"EUR","value":"57.61"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/1G868122LW729025A","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/1G868122LW729025A/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/5UP35488CK1890222","rel":"up","method":"GET"}],"create_time":"2023-03-18T23:36:38Z","update_time":"2023-03-18T23:36:38Z"}]}}],"payer":{"name":{"given_name":"Ievgenii","surname":"Kas"},"email_address":"kaieta.ievgenii@gmail.com","payer_id":"KRW7VPXJZ9AH8","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/5UP35488CK1890222","rel":"self","method":"GET"}]}
17	5N924478MN629703K	{"id":"5N924478MN629703K","status":"COMPLETED","payment_source":{"paypal":{"email_address":"kaieta.ievgenii@gmail.com","account_id":"JA7F8ELCAASAJ","name":{"given_name":"Ien","surname":"Ijsa"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"Ien Ijsa"},"address":{"address_line_1":"Rumančeková 861/52","admin_area_2":"Bratislava","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"54221528FY016645C","status":"COMPLETED","amount":{"currency_code":"EUR","value":"60.00"},"final_capture":true,"seller_protection":{"status":"NOT_ELIGIBLE"},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"60.00"},"paypal_fee":{"currency_code":"EUR","value":"2.39"},"net_amount":{"currency_code":"EUR","value":"57.61"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/54221528FY016645C","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/54221528FY016645C/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/5N924478MN629703K","rel":"up","method":"GET"}],"create_time":"2023-03-18T23:40:32Z","update_time":"2023-03-18T23:40:32Z"}]}}],"payer":{"name":{"given_name":"Ien","surname":"Ijsa"},"email_address":"kaieta.ievgenii@gmail.com","payer_id":"JA7F8ELCAASAJ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/5N924478MN629703K","rel":"self","method":"GET"}]}
18	4VA75649YX233931X	{"id":"4VA75649YX233931X","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"36Y734133W0920908","status":"COMPLETED","amount":{"currency_code":"EUR","value":"60.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"60.00"},"paypal_fee":{"currency_code":"EUR","value":"2.39"},"net_amount":{"currency_code":"EUR","value":"57.61"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/36Y734133W0920908","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/36Y734133W0920908/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/4VA75649YX233931X","rel":"up","method":"GET"}],"create_time":"2023-03-19T11:14:20Z","update_time":"2023-03-19T11:14:20Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/4VA75649YX233931X","rel":"self","method":"GET"}]}
19	5YN34935BC0218231	{"id":"5YN34935BC0218231","status":"COMPLETED","payment_source":{"paypal":{"email_address":"kaieta.ievgenii@gmail.com","account_id":"QURGVQEGJ8ENG","name":{"given_name":"Isdj","surname":"Knbdakjb"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"Isdj Knbdakjb"},"address":{"address_line_1":"Na Pasekách 12","admin_area_2":"Bratislava","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"7WF965399P8739232","status":"COMPLETED","amount":{"currency_code":"EUR","value":"60.00"},"final_capture":true,"seller_protection":{"status":"NOT_ELIGIBLE"},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"60.00"},"paypal_fee":{"currency_code":"EUR","value":"2.39"},"net_amount":{"currency_code":"EUR","value":"57.61"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7WF965399P8739232","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7WF965399P8739232/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/5YN34935BC0218231","rel":"up","method":"GET"}],"create_time":"2023-03-19T11:16:24Z","update_time":"2023-03-19T11:16:24Z"}]}}],"payer":{"name":{"given_name":"Isdj","surname":"Knbdakjb"},"email_address":"kaieta.ievgenii@gmail.com","payer_id":"QURGVQEGJ8ENG","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/5YN34935BC0218231","rel":"self","method":"GET"}]}
20	7EK421446T769081C	{"id":"7EK421446T769081C","status":"COMPLETED","payment_source":{"paypal":{"email_address":"kaieta.ievgenii@gmail.com","account_id":"5E9E5SZ3AZ8JJ","name":{"given_name":"Женя","surname":"Жук"},"address":{"country_code":"UA"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"Ievgenii Kai"},"address":{"address_line_1":"Stará Vajnorská, 39","admin_area_2":"Bratislava","postal_code":"83506","country_code":"SK"}},"payments":{"captures":[{"id":"8H9893309J168042L","status":"COMPLETED","amount":{"currency_code":"EUR","value":"60.00"},"final_capture":true,"seller_protection":{"status":"NOT_ELIGIBLE"},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"60.00"},"paypal_fee":{"currency_code":"EUR","value":"2.69"},"net_amount":{"currency_code":"EUR","value":"57.31"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/8H9893309J168042L","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/8H9893309J168042L/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7EK421446T769081C","rel":"up","method":"GET"}],"create_time":"2023-03-19T16:51:52Z","update_time":"2023-03-19T16:51:52Z"}]}}],"payer":{"name":{"given_name":"Женя","surname":"Жук"},"email_address":"kaieta.ievgenii@gmail.com","payer_id":"5E9E5SZ3AZ8JJ","address":{"country_code":"UA"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7EK421446T769081C","rel":"self","method":"GET"}]}
21	6SH43040N7784062L	{"id":"6SH43040N7784062L","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"67348954CX976054C","status":"COMPLETED","amount":{"currency_code":"EUR","value":"182.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"182.00"},"paypal_fee":{"currency_code":"EUR","value":"6.54"},"net_amount":{"currency_code":"EUR","value":"175.46"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/67348954CX976054C","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/67348954CX976054C/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6SH43040N7784062L","rel":"up","method":"GET"}],"create_time":"2023-03-20T18:08:53Z","update_time":"2023-03-20T18:08:53Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6SH43040N7784062L","rel":"self","method":"GET"}]}
22	6SK10315GG698883U	{"id":"6SK10315GG698883U","status":"COMPLETED","payment_source":{"paypal":{"email_address":"kaieta.ievgenii@gmail.com","account_id":"BNKSBAYBVH9DY","name":{"given_name":"Жопка","surname":"Попка"},"address":{"country_code":"UA"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"Жопка Попка"},"address":{"address_line_1":"Казанова","address_line_2":"12","admin_area_2":"Київ","admin_area_1":"KYIV","postal_code":"01010","country_code":"UA"}},"payments":{"captures":[{"id":"7CW08652LD178323A","status":"COMPLETED","amount":{"currency_code":"EUR","value":"66.00"},"final_capture":true,"seller_protection":{"status":"NOT_ELIGIBLE"},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"66.00"},"paypal_fee":{"currency_code":"EUR","value":"2.92"},"net_amount":{"currency_code":"EUR","value":"63.08"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7CW08652LD178323A","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7CW08652LD178323A/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6SK10315GG698883U","rel":"up","method":"GET"}],"create_time":"2023-03-20T18:11:35Z","update_time":"2023-03-20T18:11:35Z"}]}}],"payer":{"name":{"given_name":"Жопка","surname":"Попка"},"email_address":"kaieta.ievgenii@gmail.com","payer_id":"BNKSBAYBVH9DY","address":{"country_code":"UA"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6SK10315GG698883U","rel":"self","method":"GET"}]}
23	2KL20049LD1289434	{"id":"2KL20049LD1289434","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"0029542698893411G","status":"COMPLETED","amount":{"currency_code":"EUR","value":"66.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"66.00"},"paypal_fee":{"currency_code":"EUR","value":"2.59"},"net_amount":{"currency_code":"EUR","value":"63.41"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/0029542698893411G","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/0029542698893411G/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2KL20049LD1289434","rel":"up","method":"GET"}],"create_time":"2023-03-20T18:21:20Z","update_time":"2023-03-20T18:21:20Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2KL20049LD1289434","rel":"self","method":"GET"}]}
145	230407A9dFfq9AfMoHQX	{"maskedPan":"42424242******42","approvalCode":"668524","rrn":"073376067372","createdDate":"2023-04-07T09:43:53Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":411,"domesticCard":true,"country":"804","amount":31600,"ccy":980,"finalAmount":31600}
146	230407A9dFfq9AfMoHQX	{"maskedPan":"42424242******42","approvalCode":"668524","rrn":"073376067372","createdDate":"2023-04-07T09:43:53Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":411,"domesticCard":true,"country":"804","amount":31600,"ccy":980,"finalAmount":31600}
24	5F669360MX755823V	{"id":"5F669360MX755823V","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"8V840143G74920108","status":"COMPLETED","amount":{"currency_code":"EUR","value":"66.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"66.00"},"paypal_fee":{"currency_code":"EUR","value":"2.59"},"net_amount":{"currency_code":"EUR","value":"63.41"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/8V840143G74920108","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/8V840143G74920108/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/5F669360MX755823V","rel":"up","method":"GET"}],"create_time":"2023-03-20T19:12:05Z","update_time":"2023-03-20T19:12:05Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/5F669360MX755823V","rel":"self","method":"GET"}]}
25	93B759496X7574517	{"id":"93B759496X7574517","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"2C996167UL710000G","status":"COMPLETED","amount":{"currency_code":"EUR","value":"66.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"66.00"},"paypal_fee":{"currency_code":"EUR","value":"2.59"},"net_amount":{"currency_code":"EUR","value":"63.41"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/2C996167UL710000G","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/2C996167UL710000G/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/93B759496X7574517","rel":"up","method":"GET"}],"create_time":"2023-03-20T19:49:35Z","update_time":"2023-03-20T19:49:35Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/93B759496X7574517","rel":"self","method":"GET"}]}
26	1RX82795FM340371X	{"id":"1RX82795FM340371X","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"4YF66363PK231614P","status":"COMPLETED","amount":{"currency_code":"EUR","value":"66.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"66.00"},"paypal_fee":{"currency_code":"EUR","value":"2.59"},"net_amount":{"currency_code":"EUR","value":"63.41"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/4YF66363PK231614P","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/4YF66363PK231614P/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/1RX82795FM340371X","rel":"up","method":"GET"}],"create_time":"2023-03-20T19:49:56Z","update_time":"2023-03-20T19:49:56Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/1RX82795FM340371X","rel":"self","method":"GET"}]}
27	2N701624560697423	{"id":"2N701624560697423","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"71H32789MD304183B","status":"COMPLETED","amount":{"currency_code":"EUR","value":"66.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"66.00"},"paypal_fee":{"currency_code":"EUR","value":"2.59"},"net_amount":{"currency_code":"EUR","value":"63.41"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/71H32789MD304183B","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/71H32789MD304183B/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2N701624560697423","rel":"up","method":"GET"}],"create_time":"2023-03-20T19:51:30Z","update_time":"2023-03-20T19:51:30Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2N701624560697423","rel":"self","method":"GET"}]}
147	230407E8rJMAJFQJcuEy	{"maskedPan":"42424242******42","approvalCode":"510795","rrn":"073855504698","createdDate":"2023-04-07T09:47:46Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":400,"domesticCard":true,"country":"804","amount":30800,"ccy":980,"finalAmount":30800}
148	230407E8rJMAJFQJcuEy	{"maskedPan":"42424242******42","approvalCode":"510795","rrn":"073855504698","createdDate":"2023-04-07T09:47:46Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":400,"domesticCard":true,"country":"804","amount":30800,"ccy":980,"finalAmount":30800}
28	8W937226V1081230W	{"id":"8W937226V1081230W","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"5BE53910ST679421W","status":"COMPLETED","amount":{"currency_code":"EUR","value":"66.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"66.00"},"paypal_fee":{"currency_code":"EUR","value":"2.59"},"net_amount":{"currency_code":"EUR","value":"63.41"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/5BE53910ST679421W","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/5BE53910ST679421W/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/8W937226V1081230W","rel":"up","method":"GET"}],"create_time":"2023-03-20T19:59:41Z","update_time":"2023-03-20T19:59:41Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/8W937226V1081230W","rel":"self","method":"GET"}]}
29	6L7641016B383502H	{"id":"6L7641016B383502H","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"4TK44261AT040121V","status":"COMPLETED","amount":{"currency_code":"EUR","value":"216.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"216.00"},"paypal_fee":{"currency_code":"EUR","value":"7.69"},"net_amount":{"currency_code":"EUR","value":"208.31"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/4TK44261AT040121V","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/4TK44261AT040121V/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6L7641016B383502H","rel":"up","method":"GET"}],"create_time":"2023-03-20T21:28:49Z","update_time":"2023-03-20T21:28:49Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6L7641016B383502H","rel":"self","method":"GET"}]}
30	\N	15
31	8GD99884K5309932R	{"id":"8GD99884K5309932R","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"81D51810B2585302T","status":"COMPLETED","amount":{"currency_code":"EUR","value":"216.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"216.00"},"paypal_fee":{"currency_code":"EUR","value":"7.69"},"net_amount":{"currency_code":"EUR","value":"208.31"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/81D51810B2585302T","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/81D51810B2585302T/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/8GD99884K5309932R","rel":"up","method":"GET"}],"create_time":"2023-03-20T21:36:46Z","update_time":"2023-03-20T21:36:46Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/8GD99884K5309932R","rel":"self","method":"GET"}]}
32	\N	16
33	7PN39156T5276211R	{"id":"7PN39156T5276211R","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"4R338659S2880863M","status":"COMPLETED","amount":{"currency_code":"EUR","value":"216.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"216.00"},"paypal_fee":{"currency_code":"EUR","value":"7.69"},"net_amount":{"currency_code":"EUR","value":"208.31"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/4R338659S2880863M","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/4R338659S2880863M/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7PN39156T5276211R","rel":"up","method":"GET"}],"create_time":"2023-03-20T21:44:44Z","update_time":"2023-03-20T21:44:44Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7PN39156T5276211R","rel":"self","method":"GET"}]}
34	\N	17
149	2304074z17wGn9cigJuB	{"maskedPan":"42424242******42","approvalCode":"554349","rrn":"074731088627","createdDate":"2023-04-07T10:32:53Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":400,"domesticCard":true,"country":"804","amount":30800,"ccy":980,"finalAmount":30800}
35	3MP67386RH4593528	{"id":"3MP67386RH4593528","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"38A98738YX9825047","status":"COMPLETED","amount":{"currency_code":"EUR","value":"216.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"216.00"},"paypal_fee":{"currency_code":"EUR","value":"7.69"},"net_amount":{"currency_code":"EUR","value":"208.31"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/38A98738YX9825047","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/38A98738YX9825047/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/3MP67386RH4593528","rel":"up","method":"GET"}],"create_time":"2023-03-20T21:49:54Z","update_time":"2023-03-20T21:49:54Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/3MP67386RH4593528","rel":"self","method":"GET"}]}
36	\N	18
37	7206396567734591B	{"id":"7206396567734591B","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"12P61289MJ716661V","status":"COMPLETED","amount":{"currency_code":"EUR","value":"216.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"216.00"},"paypal_fee":{"currency_code":"EUR","value":"7.69"},"net_amount":{"currency_code":"EUR","value":"208.31"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/12P61289MJ716661V","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/12P61289MJ716661V/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7206396567734591B","rel":"up","method":"GET"}],"create_time":"2023-03-20T22:14:36Z","update_time":"2023-03-20T22:14:36Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7206396567734591B","rel":"self","method":"GET"}]}
38	\N	19
39	1NM44874DA188715H	{"id":"1NM44874DA188715H","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"5JE57750W2255944L","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/5JE57750W2255944L","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/5JE57750W2255944L/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/1NM44874DA188715H","rel":"up","method":"GET"}],"create_time":"2023-03-20T22:17:18Z","update_time":"2023-03-20T22:17:18Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/1NM44874DA188715H","rel":"self","method":"GET"}]}
40	\N	20
41	0CU07144MR7138923	{"id":"0CU07144MR7138923","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"7UB58247KL608973W","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7UB58247KL608973W","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7UB58247KL608973W/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/0CU07144MR7138923","rel":"up","method":"GET"}],"create_time":"2023-03-20T22:20:00Z","update_time":"2023-03-20T22:20:00Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/0CU07144MR7138923","rel":"self","method":"GET"}]}
42	\N	21
150	2304074z17wGn9cigJuB	{"maskedPan":"42424242******42","approvalCode":"554349","rrn":"074731088627","createdDate":"2023-04-07T10:32:53Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":400,"domesticCard":true,"country":"804","amount":30800,"ccy":980,"finalAmount":30800}
43	7K907272JS984484V	{"id":"7K907272JS984484V","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"Ievgenii Pipka"},"address":{"address_line_1":"Stará Vajnorská, 39","address_line_2":"2132","admin_area_2":"Bratislava","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"7X5267077S8026347","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7X5267077S8026347","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7X5267077S8026347/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7K907272JS984484V","rel":"up","method":"GET"}],"create_time":"2023-03-21T19:08:41Z","update_time":"2023-03-21T19:08:41Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7K907272JS984484V","rel":"self","method":"GET"}]}
44	\N	22
45	80906303995146504	{"id":"80906303995146504","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"44466787W07061600","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/44466787W07061600","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/44466787W07061600/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/80906303995146504","rel":"up","method":"GET"}],"create_time":"2023-03-21T19:21:49Z","update_time":"2023-03-21T19:21:49Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/80906303995146504","rel":"self","method":"GET"}]}
46	8MT938461Y922334A	{"id":"8MT938461Y922334A","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"Ievgenii Pipka"},"address":{"address_line_1":"Stará Vajnorská, 39","address_line_2":"2132","admin_area_2":"Bratislava","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"9FD88074VD287720P","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/9FD88074VD287720P","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/9FD88074VD287720P/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/8MT938461Y922334A","rel":"up","method":"GET"}],"create_time":"2023-03-21T20:37:31Z","update_time":"2023-03-21T20:37:31Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/8MT938461Y922334A","rel":"self","method":"GET"}]}
47	\N	23
48	0YP84266VA553221N	{"id":"0YP84266VA553221N","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"8PA99769WT488433H","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/8PA99769WT488433H","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/8PA99769WT488433H/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/0YP84266VA553221N","rel":"up","method":"GET"}],"create_time":"2023-03-21T20:38:22Z","update_time":"2023-03-21T20:38:22Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/0YP84266VA553221N","rel":"self","method":"GET"}]}
174	230410EddaZ756vLmN98	{"maskedPan":"42424242******42","approvalCode":"700444","rrn":"074851052542","createdDate":"2023-04-10T17:31:43Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":400,"domesticCard":true,"country":"804","amount":30800,"ccy":980,"finalAmount":30800}
49	0SF88293LB014781H	{"id":"0SF88293LB014781H","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"1DM32208LA049234W","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/1DM32208LA049234W","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/1DM32208LA049234W/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/0SF88293LB014781H","rel":"up","method":"GET"}],"create_time":"2023-03-21T20:40:06Z","update_time":"2023-03-21T20:40:06Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/0SF88293LB014781H","rel":"self","method":"GET"}]}
50	25C35453AV001433K	{"id":"25C35453AV001433K","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"2XW0990263661705P","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/2XW0990263661705P","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/2XW0990263661705P/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/25C35453AV001433K","rel":"up","method":"GET"}],"create_time":"2023-03-21T20:41:28Z","update_time":"2023-03-21T20:41:28Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/25C35453AV001433K","rel":"self","method":"GET"}]}
51	1FB16684E4980420M	{"id":"1FB16684E4980420M","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"7XX75180878418149","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7XX75180878418149","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7XX75180878418149/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/1FB16684E4980420M","rel":"up","method":"GET"}],"create_time":"2023-03-21T20:58:16Z","update_time":"2023-03-21T20:58:16Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/1FB16684E4980420M","rel":"self","method":"GET"}]}
52	\N	24
53	90C87499XT865742D	{"id":"90C87499XT865742D","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"8VJ00639KL3086212","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/8VJ00639KL3086212","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/8VJ00639KL3086212/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/90C87499XT865742D","rel":"up","method":"GET"}],"create_time":"2023-03-21T21:02:35Z","update_time":"2023-03-21T21:02:35Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/90C87499XT865742D","rel":"self","method":"GET"}]}
54	\N	25
175	230410EddaZ756vLmN98	{"maskedPan":"42424242******42","approvalCode":"700444","rrn":"074851052542","createdDate":"2023-04-10T17:31:43Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":400,"domesticCard":true,"country":"804","amount":30800,"ccy":980,"finalAmount":30800}
55	6X5212733W967135T	{"id":"6X5212733W967135T","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"19285247JL241033S","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/19285247JL241033S","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/19285247JL241033S/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6X5212733W967135T","rel":"up","method":"GET"}],"create_time":"2023-03-21T21:03:55Z","update_time":"2023-03-21T21:03:55Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6X5212733W967135T","rel":"self","method":"GET"}]}
56	\N	26
57	48N19529SC938413G	{"id":"48N19529SC938413G","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"5DN51178AW437084Y","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/5DN51178AW437084Y","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/5DN51178AW437084Y/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/48N19529SC938413G","rel":"up","method":"GET"}],"create_time":"2023-03-21T21:07:34Z","update_time":"2023-03-21T21:07:34Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/48N19529SC938413G","rel":"self","method":"GET"}]}
58	3R674196VC140940W	{"id":"3R674196VC140940W","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"Ievgenii Pipka"},"address":{"address_line_1":"Stará Vajnorská, 39","address_line_2":"2132","admin_area_2":"Bratislava","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"87D979133F7210819","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/87D979133F7210819","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/87D979133F7210819/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/3R674196VC140940W","rel":"up","method":"GET"}],"create_time":"2023-03-21T21:26:09Z","update_time":"2023-03-21T21:26:09Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/3R674196VC140940W","rel":"self","method":"GET"}]}
59	2NU57829R1950650U	{"id":"2NU57829R1950650U","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"Ievgenii Pipka"},"address":{"address_line_1":"Stará Vajnorská, 39","address_line_2":"2132","admin_area_2":"Bratislava","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"8N6854364V098972R","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/8N6854364V098972R","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/8N6854364V098972R/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2NU57829R1950650U","rel":"up","method":"GET"}],"create_time":"2023-03-21T21:27:24Z","update_time":"2023-03-21T21:27:24Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2NU57829R1950650U","rel":"self","method":"GET"}]}
176	230410EddaZ756vLmN98	{"maskedPan":"42424242******42","approvalCode":"700444","rrn":"074851052542","createdDate":"2023-04-10T17:31:43Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":400,"domesticCard":true,"country":"804","amount":30800,"ccy":980,"finalAmount":30800}
202	230415CMVmPwMDu15iQy	{"maskedPan":"42424242******42","approvalCode":"212438","rrn":"073553978654","createdDate":"2023-04-15T16:14:45Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":216,"domesticCard":true,"country":"804","amount":16600,"ccy":980,"finalAmount":16600}
60	0JT88036Y0216702A	{"id":"0JT88036Y0216702A","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"6LF15356SP604014K","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/6LF15356SP604014K","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/6LF15356SP604014K/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/0JT88036Y0216702A","rel":"up","method":"GET"}],"create_time":"2023-03-21T21:28:32Z","update_time":"2023-03-21T21:28:32Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/0JT88036Y0216702A","rel":"self","method":"GET"}]}
61	7VK4449476761390R	{"id":"7VK4449476761390R","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"5FS71418NS995544U","status":"COMPLETED","amount":{"currency_code":"EUR","value":"72.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"72.00"},"paypal_fee":{"currency_code":"EUR","value":"2.80"},"net_amount":{"currency_code":"EUR","value":"69.20"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/5FS71418NS995544U","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/5FS71418NS995544U/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7VK4449476761390R","rel":"up","method":"GET"}],"create_time":"2023-03-21T21:32:36Z","update_time":"2023-03-21T21:32:36Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7VK4449476761390R","rel":"self","method":"GET"}]}
62	3RY25324HE3353807	{"id":"3RY25324HE3353807","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"0C151231YU5197918","status":"COMPLETED","amount":{"currency_code":"EUR","value":"72.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"72.00"},"paypal_fee":{"currency_code":"EUR","value":"2.80"},"net_amount":{"currency_code":"EUR","value":"69.20"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/0C151231YU5197918","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/0C151231YU5197918/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/3RY25324HE3353807","rel":"up","method":"GET"}],"create_time":"2023-03-21T21:33:34Z","update_time":"2023-03-21T21:33:34Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/3RY25324HE3353807","rel":"self","method":"GET"}]}
63	38C347583R509024X	{"id":"38C347583R509024X","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"1Y587003X8744704E","status":"COMPLETED","amount":{"currency_code":"EUR","value":"124.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"124.00"},"paypal_fee":{"currency_code":"EUR","value":"4.57"},"net_amount":{"currency_code":"EUR","value":"119.43"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/1Y587003X8744704E","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/1Y587003X8744704E/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/38C347583R509024X","rel":"up","method":"GET"}],"create_time":"2023-03-21T21:35:08Z","update_time":"2023-03-21T21:35:08Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/38C347583R509024X","rel":"self","method":"GET"}]}
177	2304107Vkm4VpXbJpLWG	{"maskedPan":"42424242******42","approvalCode":"461248","rrn":"076099150568","createdDate":"2023-04-10T17:38:34Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":400,"domesticCard":true,"country":"804","amount":30800,"ccy":980,"finalAmount":30800}
203	230415DWaUf1ZXWhzZWy	{"maskedPan":"42424242******42","approvalCode":"431403","rrn":"075560584828","createdDate":"2023-04-15T20:15:30Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":417,"domesticCard":true,"country":"804","amount":32100,"ccy":980,"finalAmount":32100}
64	7KB705387C2507544	{"id":"7KB705387C2507544","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"4JL49974SB810761F","status":"COMPLETED","amount":{"currency_code":"EUR","value":"132.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"132.00"},"paypal_fee":{"currency_code":"EUR","value":"4.84"},"net_amount":{"currency_code":"EUR","value":"127.16"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/4JL49974SB810761F","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/4JL49974SB810761F/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7KB705387C2507544","rel":"up","method":"GET"}],"create_time":"2023-03-21T21:35:56Z","update_time":"2023-03-21T21:35:56Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7KB705387C2507544","rel":"self","method":"GET"}]}
65	1UJ84395JK477822G	{"id":"1UJ84395JK477822G","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"3JH09298EM4653525","status":"COMPLETED","amount":{"currency_code":"EUR","value":"132.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"132.00"},"paypal_fee":{"currency_code":"EUR","value":"4.84"},"net_amount":{"currency_code":"EUR","value":"127.16"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/3JH09298EM4653525","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/3JH09298EM4653525/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/1UJ84395JK477822G","rel":"up","method":"GET"}],"create_time":"2023-03-21T21:38:31Z","update_time":"2023-03-21T21:38:31Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/1UJ84395JK477822G","rel":"self","method":"GET"}]}
66	8AR850666Y8762425	{"id":"8AR850666Y8762425","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"0K894044JH698770A","status":"COMPLETED","amount":{"currency_code":"EUR","value":"132.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"132.00"},"paypal_fee":{"currency_code":"EUR","value":"4.84"},"net_amount":{"currency_code":"EUR","value":"127.16"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/0K894044JH698770A","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/0K894044JH698770A/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/8AR850666Y8762425","rel":"up","method":"GET"}],"create_time":"2023-03-21T21:39:12Z","update_time":"2023-03-21T21:39:12Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/8AR850666Y8762425","rel":"self","method":"GET"}]}
67	2PR514472E753064N	{"id":"2PR514472E753064N","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"3R240575K28404354","status":"COMPLETED","amount":{"currency_code":"EUR","value":"66.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"66.00"},"paypal_fee":{"currency_code":"EUR","value":"2.59"},"net_amount":{"currency_code":"EUR","value":"63.41"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/3R240575K28404354","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/3R240575K28404354/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2PR514472E753064N","rel":"up","method":"GET"}],"create_time":"2023-03-22T08:48:15Z","update_time":"2023-03-22T08:48:15Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2PR514472E753064N","rel":"self","method":"GET"}]}
178	2304108MAuoScPooBAe3	{"maskedPan":"42424242******42","approvalCode":"944023","rrn":"073119889358","createdDate":"2023-04-10T17:45:52Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":411,"domesticCard":true,"country":"804","amount":31600,"ccy":980,"finalAmount":31600}
204	230415AgpUuYntQCUrcq	{"maskedPan":"42424242******42","approvalCode":"902206","rrn":"074966013801","createdDate":"2023-04-15T20:20:18Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":278,"domesticCard":true,"country":"804","amount":21400,"ccy":980,"finalAmount":21400}
68	61059803SP743992B	{"id":"61059803SP743992B","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"5MD25901J4391443U","status":"COMPLETED","amount":{"currency_code":"EUR","value":"66.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"66.00"},"paypal_fee":{"currency_code":"EUR","value":"2.59"},"net_amount":{"currency_code":"EUR","value":"63.41"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/5MD25901J4391443U","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/5MD25901J4391443U/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/61059803SP743992B","rel":"up","method":"GET"}],"create_time":"2023-03-22T08:52:45Z","update_time":"2023-03-22T08:52:45Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/61059803SP743992B","rel":"self","method":"GET"}]}
69	7GW31524F44687301	{"id":"7GW31524F44687301","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"71M61951FC186182M","status":"COMPLETED","amount":{"currency_code":"EUR","value":"66.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"66.00"},"paypal_fee":{"currency_code":"EUR","value":"2.59"},"net_amount":{"currency_code":"EUR","value":"63.41"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/71M61951FC186182M","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/71M61951FC186182M/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7GW31524F44687301","rel":"up","method":"GET"}],"create_time":"2023-03-22T08:54:04Z","update_time":"2023-03-22T08:54:04Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7GW31524F44687301","rel":"self","method":"GET"}]}
70	08727622JL465690S	{"id":"08727622JL465690S","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"0YJ00981SP8800307","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/0YJ00981SP8800307","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/0YJ00981SP8800307/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/08727622JL465690S","rel":"up","method":"GET"}],"create_time":"2023-03-23T19:12:41Z","update_time":"2023-03-23T19:12:41Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/08727622JL465690S","rel":"self","method":"GET"}]}
71	4XP15409KW3922114	{"id":"4XP15409KW3922114","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"3RV503993R9623425","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/3RV503993R9623425","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/3RV503993R9623425/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/4XP15409KW3922114","rel":"up","method":"GET"}],"create_time":"2023-03-23T19:14:26Z","update_time":"2023-03-23T19:14:26Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/4XP15409KW3922114","rel":"self","method":"GET"}]}
179	2304103UzYjeBTn9HFBD	{"maskedPan":"42424242******42","approvalCode":"658718","rrn":"075697842450","createdDate":"2023-04-10T18:20:11Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":400,"domesticCard":true,"country":"804","amount":30800,"ccy":980,"finalAmount":30800}
205	230416AGFTTKp3j6goFB	{"maskedPan":"42424242******42","approvalCode":"853180","rrn":"075533455334","createdDate":"2023-04-16T08:30:30Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":411,"domesticCard":true,"country":"804","amount":31600,"ccy":980,"finalAmount":31600}
72	6JS52940YF561243J	{"id":"6JS52940YF561243J","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"0N5219578R046632K","status":"COMPLETED","amount":{"currency_code":"EUR","value":"72.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"72.00"},"paypal_fee":{"currency_code":"EUR","value":"2.80"},"net_amount":{"currency_code":"EUR","value":"69.20"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/0N5219578R046632K","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/0N5219578R046632K/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6JS52940YF561243J","rel":"up","method":"GET"}],"create_time":"2023-03-23T21:33:37Z","update_time":"2023-03-23T21:33:37Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6JS52940YF561243J","rel":"self","method":"GET"}]}
73	9TD86761J8209135S	{"id":"9TD86761J8209135S","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"2R452834M10077154","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/2R452834M10077154","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/2R452834M10077154/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/9TD86761J8209135S","rel":"up","method":"GET"}],"create_time":"2023-03-23T21:35:57Z","update_time":"2023-03-23T21:35:57Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/9TD86761J8209135S","rel":"self","method":"GET"}]}
74	7B978088S88259903	{"id":"7B978088S88259903","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"58L43507GT9980156","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/58L43507GT9980156","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/58L43507GT9980156/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7B978088S88259903","rel":"up","method":"GET"}],"create_time":"2023-03-23T21:39:01Z","update_time":"2023-03-23T21:39:01Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7B978088S88259903","rel":"self","method":"GET"}]}
75	246757977L121780J	{"id":"246757977L121780J","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"7UY15541X09551347","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7UY15541X09551347","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7UY15541X09551347/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/246757977L121780J","rel":"up","method":"GET"}],"create_time":"2023-03-23T21:41:01Z","update_time":"2023-03-23T21:41:01Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/246757977L121780J","rel":"self","method":"GET"}]}
180	2304105oXPEr7eTaRqCD	{"maskedPan":"42424242******42","approvalCode":"000246","rrn":"073281933247","createdDate":"2023-04-10T18:23:55Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":400,"domesticCard":true,"country":"804","amount":30800,"ccy":980,"finalAmount":30800}
206	2304165QBVjnvQB8ak5a	{"maskedPan":"42424242******42","approvalCode":"903978","rrn":"072476294325","createdDate":"2023-04-16T08:42:55Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":185,"domesticCard":true,"country":"804","amount":14200,"ccy":980,"finalAmount":14200}
76	6WA82434D76088641	{"id":"6WA82434D76088641","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"4YH475831U220682A","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/4YH475831U220682A","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/4YH475831U220682A/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6WA82434D76088641","rel":"up","method":"GET"}],"create_time":"2023-03-23T21:42:46Z","update_time":"2023-03-23T21:42:46Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6WA82434D76088641","rel":"self","method":"GET"}]}
77	6AT382800R333325S	{"id":"6AT382800R333325S","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"3K252776G8906970T","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/3K252776G8906970T","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/3K252776G8906970T/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6AT382800R333325S","rel":"up","method":"GET"}],"create_time":"2023-03-23T21:43:54Z","update_time":"2023-03-23T21:43:54Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6AT382800R333325S","rel":"self","method":"GET"}]}
78	2P9857118M1701327	{"id":"2P9857118M1701327","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"88L73695N5328011Y","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/88L73695N5328011Y","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/88L73695N5328011Y/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2P9857118M1701327","rel":"up","method":"GET"}],"create_time":"2023-03-23T21:44:49Z","update_time":"2023-03-23T21:44:49Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2P9857118M1701327","rel":"self","method":"GET"}]}
79	2NL758511P6017530	{"id":"2NL758511P6017530","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"7HV992982J865491S","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7HV992982J865491S","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7HV992982J865491S/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2NL758511P6017530","rel":"up","method":"GET"}],"create_time":"2023-03-23T21:45:50Z","update_time":"2023-03-23T21:45:50Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2NL758511P6017530","rel":"self","method":"GET"}]}
181	2304105oXPEr7eTaRqCD	{"maskedPan":"42424242******42","approvalCode":"000246","rrn":"073281933247","createdDate":"2023-04-10T18:23:55Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":400,"domesticCard":true,"country":"804","amount":30800,"ccy":980,"finalAmount":30800}
207	2304169Hec4U3me3Tdk2	{"maskedPan":"42424242******42","approvalCode":"940881","rrn":"075115695542","createdDate":"2023-04-16T08:45:53Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":185,"domesticCard":true,"country":"804","amount":14200,"ccy":980,"finalAmount":14200}
80	3NY18745KE848833W	{"id":"3NY18745KE848833W","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"49E85558634153923","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/49E85558634153923","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/49E85558634153923/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/3NY18745KE848833W","rel":"up","method":"GET"}],"create_time":"2023-03-24T10:22:49Z","update_time":"2023-03-24T10:22:49Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/3NY18745KE848833W","rel":"self","method":"GET"}]}
81	8F8899505N2730711	{"id":"8F8899505N2730711","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"1XM552354B3534022","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/1XM552354B3534022","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/1XM552354B3534022/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/8F8899505N2730711","rel":"up","method":"GET"}],"create_time":"2023-03-28T09:58:07Z","update_time":"2023-03-28T09:58:07Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/8F8899505N2730711","rel":"self","method":"GET"}]}
82	2DR08974KX187322V	{"id":"2DR08974KX187322V","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"0DG851593N0330449","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/0DG851593N0330449","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/0DG851593N0330449/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2DR08974KX187322V","rel":"up","method":"GET"}],"create_time":"2023-03-28T10:06:15Z","update_time":"2023-03-28T10:06:15Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2DR08974KX187322V","rel":"self","method":"GET"}]}
83	6BG848890X9584546	{"id":"6BG848890X9584546","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"06L15957448426711","status":"COMPLETED","amount":{"currency_code":"EUR","value":"60.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"60.00"},"paypal_fee":{"currency_code":"EUR","value":"2.39"},"net_amount":{"currency_code":"EUR","value":"57.61"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/06L15957448426711","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/06L15957448426711/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6BG848890X9584546","rel":"up","method":"GET"}],"create_time":"2023-03-29T11:49:00Z","update_time":"2023-03-29T11:49:00Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6BG848890X9584546","rel":"self","method":"GET"}]}
182	23041093m79QncADEzVZ	{"maskedPan":"42424242******42","approvalCode":"483837","rrn":"074530564274","createdDate":"2023-04-10T18:26:28Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":419,"domesticCard":true,"country":"804","amount":32200,"ccy":980,"finalAmount":32200}
208	230416EQFrjjYnVyZyP7	{"maskedPan":"42424242******42","approvalCode":"185106","rrn":"073388547400","createdDate":"2023-04-16T08:48:56Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":185,"domesticCard":true,"country":"804","amount":14200,"ccy":980,"finalAmount":14200}
84	8PX05787RC5973939	{"id":"8PX05787RC5973939","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"0DL38183KB404152E","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/0DL38183KB404152E","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/0DL38183KB404152E/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/8PX05787RC5973939","rel":"up","method":"GET"}],"create_time":"2023-03-31T15:45:06Z","update_time":"2023-03-31T15:45:06Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/8PX05787RC5973939","rel":"self","method":"GET"}]}
85	77B990955G923103H	{"id":"77B990955G923103H","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"7FH56338RY240281S","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7FH56338RY240281S","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7FH56338RY240281S/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/77B990955G923103H","rel":"up","method":"GET"}],"create_time":"2023-03-31T15:54:55Z","update_time":"2023-03-31T15:54:55Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/77B990955G923103H","rel":"self","method":"GET"}]}
86	3B383038E3443632M	{"id":"3B383038E3443632M","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"17088730CD883753N","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/17088730CD883753N","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/17088730CD883753N/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/3B383038E3443632M","rel":"up","method":"GET"}],"create_time":"2023-03-31T16:18:23Z","update_time":"2023-03-31T16:18:23Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/3B383038E3443632M","rel":"self","method":"GET"}]}
87	7A142309G0755981T	{"id":"7A142309G0755981T","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"60C51180R69698340","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/60C51180R69698340","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/60C51180R69698340/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7A142309G0755981T","rel":"up","method":"GET"}],"create_time":"2023-03-31T16:31:40Z","update_time":"2023-03-31T16:31:40Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7A142309G0755981T","rel":"self","method":"GET"}]}
183	2304109J3aQFWetcuiWz	{"maskedPan":"42424242******42","approvalCode":"224014","rrn":"073426594617","createdDate":"2023-04-10T18:29:33Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":403,"domesticCard":true,"country":"804","amount":31000,"ccy":980,"finalAmount":31000}
88	2JV314118L520574V	{"id":"2JV314118L520574V","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"0PE941565M7681157","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/0PE941565M7681157","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/0PE941565M7681157/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2JV314118L520574V","rel":"up","method":"GET"}],"create_time":"2023-03-31T17:08:11Z","update_time":"2023-03-31T17:08:11Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2JV314118L520574V","rel":"self","method":"GET"}]}
89	2303314p69JJV6YGdRTA	{"maskedPan":"45959800******29","approvalCode":"429646","rrn":"072740384626","createdDate":"2023-03-31T17:36:11Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":75,"domesticCard":true,"country":"804","amount":5800,"ccy":980,"finalAmount":5800}
90	2303314p69JJV6YGdRTA	{"maskedPan":"45959800******29","approvalCode":"429646","rrn":"072740384626","createdDate":"2023-03-31T17:36:11Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":75,"domesticCard":true,"country":"804","amount":5800,"ccy":980,"finalAmount":5800}
91	2304014vg4w5tNfpdAb8	{"maskedPan":"45959800******29","approvalCode":"189089","rrn":"073027750672","createdDate":"2023-04-01T10:14:37Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":75,"domesticCard":true,"country":"804","amount":5800,"ccy":980,"finalAmount":5800}
92	2304014vg4w5tNfpdAb8	{"maskedPan":"45959800******29","approvalCode":"189089","rrn":"073027750672","createdDate":"2023-04-01T10:14:37Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":75,"domesticCard":true,"country":"804","amount":5800,"ccy":980,"finalAmount":5800}
93	2304017iTxkwmieZER3M	{"maskedPan":"45959800******29","approvalCode":"048364","rrn":"075947385946","createdDate":"2023-04-01T13:26:38Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":151,"domesticCard":true,"country":"804","amount":11600,"ccy":980,"finalAmount":11600}
94	2304017iTxkwmieZER3M	{"maskedPan":"45959800******29","approvalCode":"048364","rrn":"075947385946","createdDate":"2023-04-01T13:26:38Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":151,"domesticCard":true,"country":"804","amount":11600,"ccy":980,"finalAmount":11600}
95	230404DjqvUtDncBWFGL	{"maskedPan":"42424242******42","approvalCode":"544205","rrn":"073283806204","createdDate":"2023-04-04T20:55:14Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":229,"domesticCard":true,"country":"804","amount":17600,"ccy":980,"finalAmount":17600}
96	230404DjqvUtDncBWFGL	{"maskedPan":"42424242******42","approvalCode":"544205","rrn":"073283806204","createdDate":"2023-04-04T20:55:14Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":229,"domesticCard":true,"country":"804","amount":17600,"ccy":980,"finalAmount":17600}
97	230404DjqvUtDncBWFGL	{"maskedPan":"42424242******42","approvalCode":"544205","rrn":"073283806204","createdDate":"2023-04-04T20:55:14Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":229,"domesticCard":true,"country":"804","amount":17600,"ccy":980,"finalAmount":17600}
98	230404DjqvUtDncBWFGL	{"maskedPan":"42424242******42","approvalCode":"544205","rrn":"073283806204","createdDate":"2023-04-04T20:55:14Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":229,"domesticCard":true,"country":"804","amount":17600,"ccy":980,"finalAmount":17600}
99	2304049mBaYTm4JeoCd3	{"maskedPan":"42424242******42","approvalCode":"341008","rrn":"075096491452","createdDate":"2023-04-04T21:29:11Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":78,"domesticCard":true,"country":"804","amount":6000,"ccy":980,"finalAmount":6000}
100	2304049mBaYTm4JeoCd3	{"maskedPan":"42424242******42","approvalCode":"341008","rrn":"075096491452","createdDate":"2023-04-04T21:29:11Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":78,"domesticCard":true,"country":"804","amount":6000,"ccy":980,"finalAmount":6000}
101	2304055kTRf998MQu2jx	{"maskedPan":"42424242******42","approvalCode":"004332","rrn":"073312195784","createdDate":"2023-04-05T21:42:43Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":75,"domesticCard":true,"country":"804","amount":5800,"ccy":980,"finalAmount":5800}
102	2304055kTRf998MQu2jx	{"maskedPan":"42424242******42","approvalCode":"004332","rrn":"073312195784","createdDate":"2023-04-05T21:42:43Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":75,"domesticCard":true,"country":"804","amount":5800,"ccy":980,"finalAmount":5800}
103	2304055kTRf998MQu2jx	{"maskedPan":"42424242******42","approvalCode":"004332","rrn":"073312195784","createdDate":"2023-04-05T21:42:43Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":75,"domesticCard":true,"country":"804","amount":5800,"ccy":980,"finalAmount":5800}
104	2304055kTRf998MQu2jx	{"maskedPan":"42424242******42","approvalCode":"004332","rrn":"073312195784","createdDate":"2023-04-05T21:42:43Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":75,"domesticCard":true,"country":"804","amount":5800,"ccy":980,"finalAmount":5800}
105	2304058VHzbHWm6TTDhM	{"maskedPan":"42424242******42","approvalCode":"585361","rrn":"072413768317","createdDate":"2023-04-05T21:55:29Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":75,"domesticCard":true,"country":"804","amount":5800,"ccy":980,"finalAmount":5800}
106	2304058VHzbHWm6TTDhM	{"maskedPan":"42424242******42","approvalCode":"585361","rrn":"072413768317","createdDate":"2023-04-05T21:55:29Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":75,"domesticCard":true,"country":"804","amount":5800,"ccy":980,"finalAmount":5800}
107	2304058VHzbHWm6TTDhM	{"maskedPan":"42424242******42","approvalCode":"585361","rrn":"072413768317","createdDate":"2023-04-05T21:55:29Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":75,"domesticCard":true,"country":"804","amount":5800,"ccy":980,"finalAmount":5800}
111	3EY971434V3981846	{"id":"3EY971434V3981846","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"91Y48475P1772111Y","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/91Y48475P1772111Y","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/91Y48475P1772111Y/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/3EY971434V3981846","rel":"up","method":"GET"}],"create_time":"2023-04-05T21:58:10Z","update_time":"2023-04-05T21:58:10Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/3EY971434V3981846","rel":"self","method":"GET"}]}
112	2304062SLNFxcAV3Avc3	{"maskedPan":"42424242******42","approvalCode":"907148","rrn":"075326090700","createdDate":"2023-04-06T20:35:18Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":86,"domesticCard":true,"country":"804","amount":6600,"ccy":980,"finalAmount":6600}
113	2304062SLNFxcAV3Avc3	{"maskedPan":"42424242******42","approvalCode":"907148","rrn":"075326090700","createdDate":"2023-04-06T20:35:18Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":86,"domesticCard":true,"country":"804","amount":6600,"ccy":980,"finalAmount":6600}
114	2304062SLNFxcAV3Avc3	{"maskedPan":"42424242******42","approvalCode":"907148","rrn":"075326090700","createdDate":"2023-04-06T20:35:18Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":86,"domesticCard":true,"country":"804","amount":6600,"ccy":980,"finalAmount":6600}
115	2304062SLNFxcAV3Avc3	{"maskedPan":"42424242******42","approvalCode":"907148","rrn":"075326090700","createdDate":"2023-04-06T20:35:18Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":86,"domesticCard":true,"country":"804","amount":6600,"ccy":980,"finalAmount":6600}
116	2304062SLNFxcAV3Avc3	{"maskedPan":"42424242******42","approvalCode":"907148","rrn":"075326090700","createdDate":"2023-04-06T20:35:18Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":86,"domesticCard":true,"country":"804","amount":6600,"ccy":980,"finalAmount":6600}
117	2304062SLNFxcAV3Avc3	{"maskedPan":"42424242******42","approvalCode":"907148","rrn":"075326090700","createdDate":"2023-04-06T20:35:18Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":86,"domesticCard":true,"country":"804","amount":6600,"ccy":980,"finalAmount":6600}
118	2304067zyvHeuYXwzCEz	{"maskedPan":"42424242******42","approvalCode":"335260","rrn":"075507561750","createdDate":"2023-04-06T20:51:21Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":94,"domesticCard":true,"country":"804","amount":7200,"ccy":980,"finalAmount":7200}
119	2304067zyvHeuYXwzCEz	{"maskedPan":"42424242******42","approvalCode":"335260","rrn":"075507561750","createdDate":"2023-04-06T20:51:21Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":94,"domesticCard":true,"country":"804","amount":7200,"ccy":980,"finalAmount":7200}
120	2304067zyvHeuYXwzCEz	{"maskedPan":"42424242******42","approvalCode":"335260","rrn":"075507561750","createdDate":"2023-04-06T20:51:21Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":94,"domesticCard":true,"country":"804","amount":7200,"ccy":980,"finalAmount":7200}
121	2304067zyvHeuYXwzCEz	{"maskedPan":"42424242******42","approvalCode":"335260","rrn":"075507561750","createdDate":"2023-04-06T20:51:21Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":94,"domesticCard":true,"country":"804","amount":7200,"ccy":980,"finalAmount":7200}
122	2304067zyvHeuYXwzCEz	{"maskedPan":"42424242******42","approvalCode":"335260","rrn":"075507561750","createdDate":"2023-04-06T20:51:21Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":94,"domesticCard":true,"country":"804","amount":7200,"ccy":980,"finalAmount":7200}
123	2304067zyvHeuYXwzCEz	{"maskedPan":"42424242******42","approvalCode":"335260","rrn":"075507561750","createdDate":"2023-04-06T20:51:21Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":94,"domesticCard":true,"country":"804","amount":7200,"ccy":980,"finalAmount":7200}
124	8W7623177U967851P	{"id":"8W7623177U967851P","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"7R169443TS155543W","status":"COMPLETED","amount":{"currency_code":"EUR","value":"72.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"72.00"},"paypal_fee":{"currency_code":"EUR","value":"2.80"},"net_amount":{"currency_code":"EUR","value":"69.20"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7R169443TS155543W","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7R169443TS155543W/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/8W7623177U967851P","rel":"up","method":"GET"}],"create_time":"2023-04-06T21:09:40Z","update_time":"2023-04-06T21:09:40Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/8W7623177U967851P","rel":"self","method":"GET"}]}
184	2304109J3aQFWetcuiWz	{"maskedPan":"42424242******42","approvalCode":"224014","rrn":"073426594617","createdDate":"2023-04-10T18:29:33Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":403,"domesticCard":true,"country":"804","amount":31000,"ccy":980,"finalAmount":31000}
125	6WR21468B86386224	{"id":"6WR21468B86386224","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"19N42301KR0539406","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/19N42301KR0539406","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/19N42301KR0539406/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6WR21468B86386224","rel":"up","method":"GET"}],"create_time":"2023-04-06T21:41:34Z","update_time":"2023-04-06T21:41:34Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6WR21468B86386224","rel":"self","method":"GET"}]}
126	36630344AH682031S	{"id":"36630344AH682031S","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"44P59367RD520041N","status":"COMPLETED","amount":{"currency_code":"EUR","value":"58.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"58.00"},"paypal_fee":{"currency_code":"EUR","value":"2.32"},"net_amount":{"currency_code":"EUR","value":"55.68"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/44P59367RD520041N","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/44P59367RD520041N/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/36630344AH682031S","rel":"up","method":"GET"}],"create_time":"2023-04-06T21:46:19Z","update_time":"2023-04-06T21:46:19Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/36630344AH682031S","rel":"self","method":"GET"}]}
127	230406FCgQE5KVP8DkZ4	{"maskedPan":"42424242******42","approvalCode":"632221","rrn":"073629173998","createdDate":"2023-04-06T22:31:23Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":377,"domesticCard":true,"country":"804","amount":29000,"ccy":980,"finalAmount":29000}
128	230406FCgQE5KVP8DkZ4	{"maskedPan":"42424242******42","approvalCode":"632221","rrn":"073629173998","createdDate":"2023-04-06T22:31:23Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":377,"domesticCard":true,"country":"804","amount":29000,"ccy":980,"finalAmount":29000}
129	230406FCgQE5KVP8DkZ4	{"maskedPan":"42424242******42","approvalCode":"632221","rrn":"073629173998","createdDate":"2023-04-06T22:31:23Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":377,"domesticCard":true,"country":"804","amount":29000,"ccy":980,"finalAmount":29000}
130	230406FCgQE5KVP8DkZ4	{"maskedPan":"42424242******42","approvalCode":"632221","rrn":"073629173998","createdDate":"2023-04-06T22:31:23Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":377,"domesticCard":true,"country":"804","amount":29000,"ccy":980,"finalAmount":29000}
131	230406FCgQE5KVP8DkZ4	{"maskedPan":"42424242******42","approvalCode":"632221","rrn":"073629173998","createdDate":"2023-04-06T22:31:23Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":377,"domesticCard":true,"country":"804","amount":29000,"ccy":980,"finalAmount":29000}
132	230406FCgQE5KVP8DkZ4	{"maskedPan":"42424242******42","approvalCode":"632221","rrn":"073629173998","createdDate":"2023-04-06T22:31:23Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":377,"domesticCard":true,"country":"804","amount":29000,"ccy":980,"finalAmount":29000}
133	2304076R8WcUhz3jcGNv	{"maskedPan":"42424242******42","approvalCode":"748063","rrn":"072799680862","createdDate":"2023-04-07T08:19:47Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":702,"domesticCard":true,"country":"804","amount":54000,"ccy":980,"finalAmount":54000}
134	2304076R8WcUhz3jcGNv	{"maskedPan":"42424242******42","approvalCode":"748063","rrn":"072799680862","createdDate":"2023-04-07T08:19:47Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":702,"domesticCard":true,"country":"804","amount":54000,"ccy":980,"finalAmount":54000}
135	2304072b8RYEYgDzMkxY	{"maskedPan":"42424242******42","approvalCode":"542355","rrn":"073485650625","createdDate":"2023-04-07T08:37:29Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":702,"domesticCard":true,"country":"804","amount":54000,"ccy":980,"finalAmount":54000}
136	2304072b8RYEYgDzMkxY	{"maskedPan":"42424242******42","approvalCode":"542355","rrn":"073485650625","createdDate":"2023-04-07T08:37:29Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":702,"domesticCard":true,"country":"804","amount":54000,"ccy":980,"finalAmount":54000}
137	2304072CMLAi98qxUZCe	{"maskedPan":"42424242******42","approvalCode":"446980","rrn":"073971599152","createdDate":"2023-04-07T08:39:24Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":702,"domesticCard":true,"country":"804","amount":54000,"ccy":980,"finalAmount":54000}
138	2304072CMLAi98qxUZCe	{"maskedPan":"42424242******42","approvalCode":"446980","rrn":"073971599152","createdDate":"2023-04-07T08:39:24Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":702,"domesticCard":true,"country":"804","amount":54000,"ccy":980,"finalAmount":54000}
139	2304073EfSEF4bUSxsM1	{"maskedPan":"42424242******42","approvalCode":"277819","rrn":"073996510019","createdDate":"2023-04-07T08:40:10Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":702,"domesticCard":true,"country":"804","amount":54000,"ccy":980,"finalAmount":54000}
140	2304073EfSEF4bUSxsM1	{"maskedPan":"42424242******42","approvalCode":"277819","rrn":"073996510019","createdDate":"2023-04-07T08:40:10Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":702,"domesticCard":true,"country":"804","amount":54000,"ccy":980,"finalAmount":54000}
151	57X51605C8607910S	{"id":"57X51605C8607910S","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"62T42524MV1866248","status":"COMPLETED","amount":{"currency_code":"EUR","value":"308.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"308.00"},"paypal_fee":{"currency_code":"EUR","value":"10.82"},"net_amount":{"currency_code":"EUR","value":"297.18"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/62T42524MV1866248","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/62T42524MV1866248/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/57X51605C8607910S","rel":"up","method":"GET"}],"create_time":"2023-04-07T10:58:30Z","update_time":"2023-04-07T10:58:30Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/57X51605C8607910S","rel":"self","method":"GET"}]}
152	8U704306NW669832N	{"id":"8U704306NW669832N","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"9FR1648789672821J","status":"COMPLETED","amount":{"currency_code":"EUR","value":"308.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"308.00"},"paypal_fee":{"currency_code":"EUR","value":"10.82"},"net_amount":{"currency_code":"EUR","value":"297.18"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/9FR1648789672821J","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/9FR1648789672821J/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/8U704306NW669832N","rel":"up","method":"GET"}],"create_time":"2023-04-07T11:20:06Z","update_time":"2023-04-07T11:20:06Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/8U704306NW669832N","rel":"self","method":"GET"}]}
153	9E662835BG222141E	{"id":"9E662835BG222141E","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"1G614951BT4318616","status":"COMPLETED","amount":{"currency_code":"EUR","value":"308.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"308.00"},"paypal_fee":{"currency_code":"EUR","value":"10.82"},"net_amount":{"currency_code":"EUR","value":"297.18"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/1G614951BT4318616","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/1G614951BT4318616/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/9E662835BG222141E","rel":"up","method":"GET"}],"create_time":"2023-04-07T11:21:36Z","update_time":"2023-04-07T11:21:36Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/9E662835BG222141E","rel":"self","method":"GET"}]}
154	14H90411L3102703R	{"id":"14H90411L3102703R","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"2CE059748P917442S","status":"COMPLETED","amount":{"currency_code":"EUR","value":"316.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"316.00"},"paypal_fee":{"currency_code":"EUR","value":"11.09"},"net_amount":{"currency_code":"EUR","value":"304.91"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/2CE059748P917442S","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/2CE059748P917442S/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/14H90411L3102703R","rel":"up","method":"GET"}],"create_time":"2023-04-07T11:35:51Z","update_time":"2023-04-07T11:35:51Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/14H90411L3102703R","rel":"self","method":"GET"}]}
185	230410EBqAzwwgPoryos	{"maskedPan":"42424242******42","approvalCode":"716395","rrn":"072707732326","createdDate":"2023-04-10T19:11:58Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":400,"domesticCard":true,"country":"804","amount":30800,"ccy":980,"finalAmount":30800}
155	3D470591JX891370G	{"id":"3D470591JX891370G","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"10016712CS3891113","status":"COMPLETED","amount":{"currency_code":"EUR","value":"322.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"322.00"},"paypal_fee":{"currency_code":"EUR","value":"11.30"},"net_amount":{"currency_code":"EUR","value":"310.70"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/10016712CS3891113","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/10016712CS3891113/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/3D470591JX891370G","rel":"up","method":"GET"}],"create_time":"2023-04-07T11:43:53Z","update_time":"2023-04-07T11:43:53Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/3D470591JX891370G","rel":"self","method":"GET"}]}
156	2304077P7hxNgKXeACQP	{"maskedPan":"42424242******42","approvalCode":"584793","rrn":"074209781458","createdDate":"2023-04-07T11:45:43Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":411,"domesticCard":true,"country":"804","amount":31600,"ccy":980,"finalAmount":31600}
157	2304077P7hxNgKXeACQP	{"maskedPan":"42424242******42","approvalCode":"584793","rrn":"074209781458","createdDate":"2023-04-07T11:45:43Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":411,"domesticCard":true,"country":"804","amount":31600,"ccy":980,"finalAmount":31600}
158	2VG23666LX404151N	{"id":"2VG23666LX404151N","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"55H214113V8199234","status":"COMPLETED","amount":{"currency_code":"EUR","value":"308.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"308.00"},"paypal_fee":{"currency_code":"EUR","value":"10.82"},"net_amount":{"currency_code":"EUR","value":"297.18"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/55H214113V8199234","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/55H214113V8199234/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2VG23666LX404151N","rel":"up","method":"GET"}],"create_time":"2023-04-07T11:51:56Z","update_time":"2023-04-07T11:51:56Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2VG23666LX404151N","rel":"self","method":"GET"}]}
159	10Y78185YN2158536	{"id":"10Y78185YN2158536","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"6TL437237J3695016","status":"COMPLETED","amount":{"currency_code":"EUR","value":"482.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"482.00"},"paypal_fee":{"currency_code":"EUR","value":"16.74"},"net_amount":{"currency_code":"EUR","value":"465.26"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/6TL437237J3695016","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/6TL437237J3695016/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/10Y78185YN2158536","rel":"up","method":"GET"}],"create_time":"2023-04-07T11:58:23Z","update_time":"2023-04-07T11:58:23Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/10Y78185YN2158536","rel":"self","method":"GET"}]}
160	9SH343203G986604F	{"id":"9SH343203G986604F","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"4X768520LM368660P","status":"COMPLETED","amount":{"currency_code":"EUR","value":"322.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"322.00"},"paypal_fee":{"currency_code":"EUR","value":"11.30"},"net_amount":{"currency_code":"EUR","value":"310.70"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/4X768520LM368660P","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/4X768520LM368660P/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/9SH343203G986604F","rel":"up","method":"GET"}],"create_time":"2023-04-07T12:12:01Z","update_time":"2023-04-07T12:12:01Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/9SH343203G986604F","rel":"self","method":"GET"}]}
161	230407ATPyu4AMjrvx7d	{"maskedPan":"42424242******42","approvalCode":"501862","rrn":"074726309120","createdDate":"2023-04-07T12:13:07Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":400,"domesticCard":true,"country":"804","amount":30800,"ccy":980,"finalAmount":30800}
186	230410EBqAzwwgPoryos	{"maskedPan":"42424242******42","approvalCode":"716395","rrn":"072707732326","createdDate":"2023-04-10T19:11:58Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":400,"domesticCard":true,"country":"804","amount":30800,"ccy":980,"finalAmount":30800}
162	0GG5084957065654U	{"id":"0GG5084957065654U","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"8L0731852F5266626","status":"COMPLETED","amount":{"currency_code":"EUR","value":"394.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"394.00"},"paypal_fee":{"currency_code":"EUR","value":"13.75"},"net_amount":{"currency_code":"EUR","value":"380.25"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/8L0731852F5266626","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/8L0731852F5266626/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/0GG5084957065654U","rel":"up","method":"GET"}],"create_time":"2023-04-07T12:21:03Z","update_time":"2023-04-07T12:21:03Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/0GG5084957065654U","rel":"self","method":"GET"}]}
163	6WU9767094776505P	{"id":"6WU9767094776505P","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"51247500GL214023N","status":"COMPLETED","amount":{"currency_code":"EUR","value":"466.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"466.00"},"paypal_fee":{"currency_code":"EUR","value":"16.19"},"net_amount":{"currency_code":"EUR","value":"449.81"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/51247500GL214023N","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/51247500GL214023N/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6WU9767094776505P","rel":"up","method":"GET"}],"create_time":"2023-04-07T12:23:41Z","update_time":"2023-04-07T12:23:41Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6WU9767094776505P","rel":"self","method":"GET"}]}
164	230407DTztFhewGUByjJ	{"maskedPan":"42424242******42","approvalCode":"047548","rrn":"073304394511","createdDate":"2023-04-07T12:27:09Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":512,"domesticCard":true,"country":"804","amount":39400,"ccy":980,"finalAmount":39400}
165	2304083MPmG8qjoapaoX	{"maskedPan":"42424242******42","approvalCode":"491965","rrn":"073322120705","createdDate":"2023-04-08T11:33:59Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":486,"domesticCard":true,"country":"804","amount":37400,"ccy":980,"finalAmount":37400}
166	2L843570AA1966400	{"id":"2L843570AA1966400","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"63M076089B4145402","status":"COMPLETED","amount":{"currency_code":"EUR","value":"394.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"394.00"},"paypal_fee":{"currency_code":"EUR","value":"13.75"},"net_amount":{"currency_code":"EUR","value":"380.25"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/63M076089B4145402","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/63M076089B4145402/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2L843570AA1966400","rel":"up","method":"GET"}],"create_time":"2023-04-08T12:26:14Z","update_time":"2023-04-08T12:26:14Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2L843570AA1966400","rel":"self","method":"GET"}]}
167	230408AYTksCryLrnY2e	{"maskedPan":"42424242******42","approvalCode":"379220","rrn":"073012060355","createdDate":"2023-04-08T12:27:34Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":400,"domesticCard":true,"country":"804","amount":30800,"ccy":980,"finalAmount":30800}
168	230408DLdoYkBZVZPQDX	{"maskedPan":"42424242******42","approvalCode":"936335","rrn":"074260524118","createdDate":"2023-04-08T12:43:27Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":400,"domesticCard":true,"country":"804","amount":30800,"ccy":980,"finalAmount":30800}
169	2304084uTysnFid4Nqan	{"maskedPan":"42424242******42","approvalCode":"840001","rrn":"073847081280","createdDate":"2023-04-08T13:07:51Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":476,"domesticCard":true,"country":"804","amount":36600,"ccy":980,"finalAmount":36600}
170	230408BkD5ZoiqJK8G8a	{"maskedPan":"42424242******42","approvalCode":"784181","rrn":"074620252564","createdDate":"2023-04-08T13:16:49Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":400,"domesticCard":true,"country":"804","amount":30800,"ccy":980,"finalAmount":30800}
171	230408BkD5ZoiqJK8G8a	{"maskedPan":"42424242******42","approvalCode":"784181","rrn":"074620252564","createdDate":"2023-04-08T13:16:49Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":400,"domesticCard":true,"country":"804","amount":30800,"ccy":980,"finalAmount":30800}
172	23041022dcacHpKEeCry	{"maskedPan":"42424242******42","approvalCode":"072371","rrn":"073024499096","createdDate":"2023-04-10T16:44:07Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":658,"domesticCard":true,"country":"804","amount":50600,"ccy":980,"finalAmount":50600}
173	230410EddaZ756vLmN98	{"maskedPan":"42424242******42","approvalCode":"700444","rrn":"074851052542","createdDate":"2023-04-10T17:31:43Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":400,"domesticCard":true,"country":"804","amount":30800,"ccy":980,"finalAmount":30800}
190	6AW08040P0363861D	{"id":"6AW08040P0363861D","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"6PB01260K1073021K","status":"COMPLETED","amount":{"currency_code":"EUR","value":"308.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"308.00"},"paypal_fee":{"currency_code":"EUR","value":"10.82"},"net_amount":{"currency_code":"EUR","value":"297.18"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/6PB01260K1073021K","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/6PB01260K1073021K/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6AW08040P0363861D","rel":"up","method":"GET"}],"create_time":"2023-04-11T13:46:01Z","update_time":"2023-04-11T13:46:01Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/6AW08040P0363861D","rel":"self","method":"GET"}]}
191	230411DVPWDTVKgM9Hxc	{"maskedPan":"42424242******42","approvalCode":"099557","rrn":"073663285906","createdDate":"2023-04-11T13:51:08Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":419,"domesticCard":true,"country":"804","amount":32200,"ccy":980,"finalAmount":32200}
192	2304117yU23SrZPGdVYk	{"maskedPan":"42424242******42","approvalCode":"598720","rrn":"072598758754","createdDate":"2023-04-11T14:06:12Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":590,"domesticCard":true,"country":"804","amount":45400,"ccy":980,"finalAmount":45400}
193	2304113bn6XPuxZJDwWn	{"maskedPan":"42424242******42","approvalCode":"958976","rrn":"073512863824","createdDate":"2023-04-11T14:10:07Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":676,"domesticCard":true,"country":"804","amount":52000,"ccy":980,"finalAmount":52000}
194	2304118UqvcZBhQqshYt	{"maskedPan":"42424242******42","approvalCode":"666330","rrn":"074637711693","createdDate":"2023-04-11T20:08:00Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":411,"domesticCard":true,"country":"804","amount":31600,"ccy":980,"finalAmount":31600}
195	2304118QrkgueQYW1zhq	{"maskedPan":"42424242******42","approvalCode":"757355","rrn":"072610197072","createdDate":"2023-04-11T20:24:47Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":504,"domesticCard":true,"country":"804","amount":38800,"ccy":980,"finalAmount":38800}
196	2304118QrkgueQYW1zhq	{"maskedPan":"42424242******42","approvalCode":"757355","rrn":"072610197072","createdDate":"2023-04-11T20:24:47Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":504,"domesticCard":true,"country":"804","amount":38800,"ccy":980,"finalAmount":38800}
197	2304118QrkgueQYW1zhq	{"maskedPan":"42424242******42","approvalCode":"757355","rrn":"072610197072","createdDate":"2023-04-11T20:24:47Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":504,"domesticCard":true,"country":"804","amount":38800,"ccy":980,"finalAmount":38800}
198	8MB62441S2463774A	{"id":"8MB62441S2463774A","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"5D9855783F956720Y","status":"COMPLETED","amount":{"currency_code":"EUR","value":"308.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"308.00"},"paypal_fee":{"currency_code":"EUR","value":"10.82"},"net_amount":{"currency_code":"EUR","value":"297.18"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/5D9855783F956720Y","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/5D9855783F956720Y/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/8MB62441S2463774A","rel":"up","method":"GET"}],"create_time":"2023-04-11T20:33:18Z","update_time":"2023-04-11T20:33:18Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/8MB62441S2463774A","rel":"self","method":"GET"}]}
199	230411De4iUoEMJzhaC9	{"maskedPan":"42424242******42","approvalCode":"039718","rrn":"072571194438","createdDate":"2023-04-11T20:38:15Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":411,"domesticCard":true,"country":"804","amount":31600,"ccy":980,"finalAmount":31600}
200	230415CALY1B8auxEAN1	{"maskedPan":"42424242******42","approvalCode":"950356","rrn":"073602400026","createdDate":"2023-04-15T15:16:31Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":741,"domesticCard":true,"country":"804","amount":57000,"ccy":980,"finalAmount":57000}
201	5XN46327TL012412N	{"id":"5XN46327TL012412N","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"09088614UF293780E","status":"COMPLETED","amount":{"currency_code":"EUR","value":"313.00"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"313.00"},"paypal_fee":{"currency_code":"EUR","value":"10.99"},"net_amount":{"currency_code":"EUR","value":"302.01"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/09088614UF293780E","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/09088614UF293780E/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/5XN46327TL012412N","rel":"up","method":"GET"}],"create_time":"2023-04-15T15:18:18Z","update_time":"2023-04-15T15:18:18Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/5XN46327TL012412N","rel":"self","method":"GET"}]}
209	95H36275SA022282V	{"id":"95H36275SA022282V","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"9NV16725EN619650A","status":"COMPLETED","amount":{"currency_code":"EUR","value":"23.60"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"23.60"},"paypal_fee":{"currency_code":"EUR","value":"1.15"},"net_amount":{"currency_code":"EUR","value":"22.45"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/9NV16725EN619650A","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/9NV16725EN619650A/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/95H36275SA022282V","rel":"up","method":"GET"}],"create_time":"2023-04-16T10:49:57Z","update_time":"2023-04-16T10:49:57Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/95H36275SA022282V","rel":"self","method":"GET"}]}
210	2304162vppJFU8n3vBiB	{"maskedPan":"42424242******42","approvalCode":"571029","rrn":"076322661447","createdDate":"2023-04-16T10:53:33Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":263,"domesticCard":true,"country":"804","amount":20200,"ccy":980,"finalAmount":20200}
211	2304164zxYX5APaYfjmZ	{"maskedPan":"42424242******42","approvalCode":"951477","rrn":"073600190904","createdDate":"2023-04-16T11:32:33Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":185,"domesticCard":true,"country":"804","amount":14200,"ccy":980,"finalAmount":14200}
212	2304166Fd11o95LW9VRu	{"maskedPan":"42424242******42","approvalCode":"581907","rrn":"072501858318","createdDate":"2023-04-16T11:43:51Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":185,"domesticCard":true,"country":"804","amount":14200,"ccy":980,"finalAmount":14200}
213	230416FF3Q9Em2sGeCM9	{"maskedPan":"42424242******42","approvalCode":"621630","rrn":"074662220304","createdDate":"2023-04-16T11:47:01Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":166,"domesticCard":true,"country":"804","amount":12800,"ccy":980,"finalAmount":12800}
214	230416DPezRh8p744xdr	{"maskedPan":"42424242******42","approvalCode":"526134","rrn":"075103263473","createdDate":"2023-04-16T11:50:42Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":317,"domesticCard":true,"country":"804","amount":24400,"ccy":980,"finalAmount":24400}
215	23041656NhXmNwA75DES	{"maskedPan":"42424242******42","approvalCode":"821066","rrn":"073109064888","createdDate":"2023-04-16T11:59:58Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":620,"domesticCard":true,"country":"804","amount":47700,"ccy":980,"finalAmount":47700}
216	0R756362BJ979942S	{"id":"0R756362BJ979942S","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"16318726YP890401K","status":"COMPLETED","amount":{"currency_code":"EUR","value":"3.34"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"3.34"},"paypal_fee":{"currency_code":"EUR","value":"0.46"},"net_amount":{"currency_code":"EUR","value":"2.88"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/16318726YP890401K","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/16318726YP890401K/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/0R756362BJ979942S","rel":"up","method":"GET"}],"create_time":"2023-04-16T12:04:31Z","update_time":"2023-04-16T12:04:31Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/0R756362BJ979942S","rel":"self","method":"GET"}]}
217	7AJ80529K5350244P	{"id":"7AJ80529K5350244P","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"0C086702PH1716733","status":"COMPLETED","amount":{"currency_code":"EUR","value":"3.88"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"3.88"},"paypal_fee":{"currency_code":"EUR","value":"0.48"},"net_amount":{"currency_code":"EUR","value":"3.40"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/0C086702PH1716733","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/0C086702PH1716733/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7AJ80529K5350244P","rel":"up","method":"GET"}],"create_time":"2023-04-16T12:06:06Z","update_time":"2023-04-16T12:06:06Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7AJ80529K5350244P","rel":"self","method":"GET"}]}
218	4JL37627NV924704D	{"id":"4JL37627NV924704D","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"8S31240356811980F","status":"COMPLETED","amount":{"currency_code":"EUR","value":"3.88"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"3.88"},"paypal_fee":{"currency_code":"EUR","value":"0.48"},"net_amount":{"currency_code":"EUR","value":"3.40"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/8S31240356811980F","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/8S31240356811980F/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/4JL37627NV924704D","rel":"up","method":"GET"}],"create_time":"2023-04-16T12:07:34Z","update_time":"2023-04-16T12:07:34Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/4JL37627NV924704D","rel":"self","method":"GET"}]}
219	2SD35566R53144816	{"id":"2SD35566R53144816","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"7RW028383X176304L","status":"COMPLETED","amount":{"currency_code":"EUR","value":"3.50"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"3.50"},"paypal_fee":{"currency_code":"EUR","value":"0.47"},"net_amount":{"currency_code":"EUR","value":"3.03"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7RW028383X176304L","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7RW028383X176304L/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2SD35566R53144816","rel":"up","method":"GET"}],"create_time":"2023-04-16T12:26:14Z","update_time":"2023-04-16T12:26:14Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/2SD35566R53144816","rel":"self","method":"GET"}]}
220	230416CDwFXDjrrbF35a	{"maskedPan":"42424242******42","approvalCode":"657539","rrn":"074268280287","createdDate":"2023-04-16T12:45:42Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":185,"domesticCard":true,"country":"804","amount":14200,"ccy":980,"finalAmount":14200}
221	0HE652239U292974J	{"id":"0HE652239U292974J","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"82J02942VY193123M","status":"COMPLETED","amount":{"currency_code":"EUR","value":"3.50"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"3.50"},"paypal_fee":{"currency_code":"EUR","value":"0.47"},"net_amount":{"currency_code":"EUR","value":"3.03"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/82J02942VY193123M","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/82J02942VY193123M/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/0HE652239U292974J","rel":"up","method":"GET"}],"create_time":"2023-04-16T12:48:01Z","update_time":"2023-04-16T12:48:01Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/0HE652239U292974J","rel":"self","method":"GET"}]}
222	02441698EP6054247	{"id":"02441698EP6054247","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"7AP2479164206003P","status":"COMPLETED","amount":{"currency_code":"EUR","value":"3.50"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"3.50"},"paypal_fee":{"currency_code":"EUR","value":"0.47"},"net_amount":{"currency_code":"EUR","value":"3.03"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7AP2479164206003P","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/7AP2479164206003P/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/02441698EP6054247","rel":"up","method":"GET"}],"create_time":"2023-04-16T16:33:32Z","update_time":"2023-04-16T16:33:32Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/02441698EP6054247","rel":"self","method":"GET"}]}
223	7XH96342UG976300X	{"id":"7XH96342UG976300X","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"0PG82832TL415384D","status":"COMPLETED","amount":{"currency_code":"EUR","value":"3.50"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"3.50"},"paypal_fee":{"currency_code":"EUR","value":"0.47"},"net_amount":{"currency_code":"EUR","value":"3.03"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/0PG82832TL415384D","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/0PG82832TL415384D/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7XH96342UG976300X","rel":"up","method":"GET"}],"create_time":"2023-04-16T16:38:45Z","update_time":"2023-04-16T16:38:45Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/7XH96342UG976300X","rel":"self","method":"GET"}]}
224	230416DRwYa3x4D5hRqA	{"maskedPan":"42424242******42","approvalCode":"923870","rrn":"075181184455","createdDate":"2023-04-16T16:40:27Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":263,"domesticCard":true,"country":"804","amount":20200,"ccy":980,"finalAmount":20200}
225	0F4749957C167824F	{"id":"0F4749957C167824F","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"2HK76094BF951881J","status":"COMPLETED","amount":{"currency_code":"EUR","value":"3.50"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"3.50"},"paypal_fee":{"currency_code":"EUR","value":"0.47"},"net_amount":{"currency_code":"EUR","value":"3.03"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/2HK76094BF951881J","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/2HK76094BF951881J/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/0F4749957C167824F","rel":"up","method":"GET"}],"create_time":"2023-04-16T16:42:02Z","update_time":"2023-04-16T16:42:02Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/0F4749957C167824F","rel":"self","method":"GET"}]}
226	23041796HrBYGmS3xSio	{"maskedPan":"42424242******42","approvalCode":"156865","rrn":"075623126972","createdDate":"2023-04-17T07:40:15Z","terminal":"MI000000","paymentScheme":"full","paymentMethod":"pan","fee":777,"domesticCard":true,"country":"804","amount":59800,"ccy":980,"finalAmount":59800}
227	5BX4712748559191Y	{"id":"5BX4712748559191Y","status":"COMPLETED","payment_source":{"paypal":{"email_address":"sb-nznbz25252771@personal.example.com","account_id":"4XLXBJQFDMBKQ","name":{"given_name":"John","surname":"Doe"},"address":{"country_code":"SK"}}},"purchase_units":[{"reference_id":"default","shipping":{"name":{"full_name":"John Doe"},"address":{"address_line_1":"Ružinovská 1","admin_area_2":"Bratislava","admin_area_1":"Slovenská Republika","postal_code":"821 01","country_code":"SK"}},"payments":{"captures":[{"id":"8AH06172MN524524D","status":"COMPLETED","amount":{"currency_code":"EUR","value":"16.40"},"final_capture":true,"seller_protection":{"status":"ELIGIBLE","dispute_categories":["ITEM_NOT_RECEIVED","UNAUTHORIZED_TRANSACTION"]},"seller_receivable_breakdown":{"gross_amount":{"currency_code":"EUR","value":"16.40"},"paypal_fee":{"currency_code":"EUR","value":"0.91"},"net_amount":{"currency_code":"EUR","value":"15.49"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/payments/captures/8AH06172MN524524D","rel":"self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v2/payments/captures/8AH06172MN524524D/refund","rel":"refund","method":"POST"},{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/5BX4712748559191Y","rel":"up","method":"GET"}],"create_time":"2023-04-17T08:07:43Z","update_time":"2023-04-17T08:07:43Z"}]}}],"payer":{"name":{"given_name":"John","surname":"Doe"},"email_address":"sb-nznbz25252771@personal.example.com","payer_id":"4XLXBJQFDMBKQ","address":{"country_code":"SK"}},"links":[{"href":"https://api.sandbox.paypal.com/v2/checkout/orders/5BX4712748559191Y","rel":"self","method":"GET"}]}
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

COPY public.shipping_info (shipping_info_id, first_name, last_name, phone, email, address_line_1, address_line_2, city, country, region, zip, shipping_method, warehouse) FROM stdin;
1	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
4	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
7	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
8	Жопка	Попка	+380689901426	kaieta.ievgenii@gmail.com	Казанова	12	Київ	KYIV	UA	01010	\N	\N
9	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
10	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
11	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
12	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
13	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
14	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
15	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
16	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
17	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
18	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
19	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
20	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
21	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
22	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Stará Vajnorská, 39	2132	Bratislava	\N	SK	821 01	\N	\N
23	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Stará Vajnorská, 39	2132	Bratislava	\N	SK	821 01	\N	\N
24	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
25	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
26	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
27	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
28	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Stará Vajnorská, 39	2132	Bratislava	\N	SK	821 01	\N	\N
29	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Stará Vajnorská, 39	2132	Bratislava	\N	SK	821 01	\N	\N
30	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
31	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
32	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
33	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
34	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
35	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
36	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
37	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
38	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
39	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
40	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
41	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
42	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
43	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
44	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
45	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
46	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
47	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
48	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
49	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
50	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
51	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
52	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
53	John	Doe	+380689901426	sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
57	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
58	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
59	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	82101	\N	\N
60	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	82101	\N	\N
61	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	82101	\N	\N
62	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
63	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
64	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
65	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
66	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
67	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
68	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
69	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
70	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
71	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
72	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
73	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
74	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
75	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
76	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
77	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
78	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
79	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
80	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
81	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
82	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
83	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
84	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
85	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
86	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
87	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
88	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
89	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
90	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
91	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
92	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
93	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
94	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
95	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
96	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
97	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
98	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
99	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
100	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
101	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
102	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
103	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
104	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
105	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
106	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
107	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
108	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
109	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
110	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
111	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
112	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
113	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
114	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
115	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
116	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
117	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
118	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
119	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
120	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
121	John	Doe	+380689901426	kaieta.ievgenii@gmail.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
124	фіуа	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	UA	Київська область	07540	\N	\N
125	фіуа	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	UA	Київська область	07540	\N	\N
126	фіуа	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	UA	Київська область	07540	\N	\N
127	фіуа	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	UA	Київська область	07540	\N	\N
128	фіуа	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	UA	Київська область	07540	\N	\N
129	фіуа	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	UA	Київська область	07540	\N	\N
130	фіуа	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	UA	Київська область	07540	\N	\N
131	фіуа	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	UA	Київська область	07540	\N	\N
132	фіуа	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	UA	Київська область	07540	\N	\N
133	фіуа	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	UA	Київська область	07540	\N	\N
134	фіуа	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	UA	Київська область	07540	\N	\N
135	фіуа	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	UA	Київська область	07540	\N	\N
136	фіуа	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	UA	Київська область	07540	\N	\N
137	фіуа	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	UA	Київська область	07540	\N	\N
138	фіуа	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	UA	Київська область	07540	\N	\N
139	фіуа	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	UA	Київська область	07540	\N	\N
140	фіуа	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	UA	Київська область	07540	\N	\N
141	фіуа	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	UA	Київська область	07540	\N	\N
142	фіуа	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	UA	Київська область	07540	\N	\N
143	фіуа	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	UA	Київська область	07540	\N	\N
144	фіуа	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	UA	Київська область	07540	\N	\N
145	фіуа	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	UA	Київська область	07540	\N	\N
146	фіуа	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	UA	Київська область	07540	\N	\N
147	фіуа	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	UA	Київська область	07540	\N	\N
148	фіуа	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	UA	Київська область	07540	\N	\N
149	фіуа	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	UA	Київська область	07540	\N	\N
150	фіуа	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	UA	Київська область	07540	\N	\N
151	фіуа	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	UA	Київська область	07540	\N	\N
152	фіуа	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	UA	Київська область	07540	\N	\N
153	фіуа	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	UA	Київська область	07540	\N	\N
154	фіуа	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	UA	Київська область	07540	\N	\N
155	фіуа	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	UA	Київська область	07540	\N	\N
156	фіуа	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	UA	Київська область	07540	\N	\N
157	фіуа	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	UA	Київська область	07540	\N	\N
158	фіуа	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	UA	Київська область	07540	\N	\N
159	Василь	Недолугий	380689901426	kaieta.ievgenii@gmail.com	Вулична 1		Київ		Київ	01101	\N	\N
160	kaieta.ievgenii@gmail.com	Каєта	380689901426	kaieta.ievgenii@gmail.com	Stará Vajnorská	39	Дніпро		Дніпро	42400	\N	\N
161	kaieta.ievgenii@gmail.com	Каєта	380689901426	kaieta.ievgenii@gmail.com	Stará Vajnorská	39	Дніпро		Дніпро	83506	\N	\N
162	kaieta.ievgenii@gmail.com	Каєта	380689901426	kaieta.ievgenii@gmail.com	fwe	edw	Дніпро		Дніпро	21222	\N	\N
163	sadadasd	cdsafsadfa	380689901426	kaieta.ievgenii@gmail.com	sadas		Дніпро		Дніпро	12312	\N	\N
164	sferfe	Каєта	380689901426	kaieta.ievgenii@gmail.com	DSEterg		Дніпро		Дніпро	123	\N	\N
165	ewfdserfe	frefrer	380689901426	kaieta.ievgenii@gmail.com	wefw		Дніпро		Дніпро	222	\N	\N
166	sa	asd	380689901426	kaieta.ievgenii@gmail.com	Stará Vajnorská	39	Дніпро		Дніпро	83506	\N	\N
167	kaieta.ievgenii@gmail.com	.n 	380689901426	kaieta.ievgenii@gmail.com	Stará Vajnorská	39	Дніпро		Дніпро	33	\N	\N
168	qwsdwefw	SDFASDF	380689901426	kaieta.ievgenii@gmail.com	ASDA		Дніпро		Дніпро	213123	\N	\N
169	фіуа	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	UA	Київська область	07540	\N	\N
170	цуафук	івмафвма	380689901426	kaieta.ievgenii@gmail.com	всів		Дніпро		Дніпро	1231	\N	\N
175	John	Doe		sb-nznbz25252771@personal.example.com	Ružinovská 1	\N	Bratislava	Slovenská Republika	SK	821 01	\N	\N
176	Женя 	Коржик	380689901426	kaieta.ievgenii@gmail.com	Sumska 25	4	Краснопілля		Сумська обл	42400	\N	\N
177	Женя	Коржик	380689901426	kaieta.ievgenii@gmail.com	Sumska 25	4	Краснопілля		Сумська обл	42400	\N	\N
178	Жук	Жопа	380689901426	kaieta.ievgenii@gmail.com	фівфів		Дніпро		Дніпро	12121	\N	\N
179	ваі	вмісів	380689901426	kaieta.ievgenii@gmail.com	іфв		Дніпро	UA	Дніпро	12	\N	\N
180	іфвівф	іваівасів	380689901426	kaieta.ievgenii@gmail.com	Sumska 25	4	Krasopillia	UA	Дніпро	42400	\N	\N
181	іфвівф	іваівасів	380689901426	kaieta.ievgenii@gmail.com	Sumska 25	4	Krasopillia	UA	Дніпро	42400	\N	\N
182	mhgfi	yjgfjg	380689901426	kaieta.ievgenii@gmail.com	Sumska 25	4	Krasopillia	UA	Ukrajina	42400	\N	\N
183	Жон	Бубон	421949590207	kaieta.ievgenii@gmail.com	Stará Vajnorská	39	Bratislava	SK	Ukrajina	83506	\N	\N
184	Жон	Бубон	421949590207	kaieta.ievgenii@gmail.com	Stará Vajnorská	39	Bratislava	SK	Ukrajina	83506	\N	\N
185	Жока	ЖДоп	380689901426	kaieta.ievgenii@gmail.com	Sumska 25	4	Krasopillia	UA	і	42400	\N	\N
186	Жока	ЖДоп	380689901426	kaieta.ievgenii@gmail.com	Sumska 25	4	Krasopillia	UA	і	42400	\N	\N
187	Жока	ЖДоп	380689901426	kaieta.ievgenii@gmail.com	Sumska 25	4	Krasopillia	UA	і	42400	\N	\N
188	Жока	ЖДоп	380689901426	kaieta.ievgenii@gmail.com	Sumska 25	4	Krasopillia	UA	і	42400	\N	\N
189	:dl	dlskfn;s	30949590207	kaieta.ievgenii@gmail.com	Rumančeková 861/52		Bratislava	SK	sada	82110	\N	\N
190	Stará Vajnorská	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Sumska 25	Sumska 25	Krasopillia	UA	s	42400	\N	\N
191	Na Pasekách 12	Kaieta	380689901426	kaieta.ievgenii@gmail.com	Stará Vajnorská	Stará Vajnorská	Bratislava	UA	Ukrajina	42400	\N	\N
192	Na Pasekách 12	Kaieta	380689901426	kaieta.ievgenii@gmail.com	Stará Vajnorská	Stará Vajnorská	Bratislava	UA	Ukrajina	42400	\N	\N
193	Stará Vajnorská	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Stará Vajnorská	Stará Vajnorská	sss	UA	Ukrajina	21311	\N	\N
194	Stará Vajnorská	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Stará Vajnorská	Stará Vajnorská	Bratislava	UA	Ukrajina	21312	\N	\N
195	Stará Vajnorská	Kaieta	421949590207	kaieta.ievgenii@gmail.com	qqw		Дніпро	UA	Дніпро	1212	\N	\N
196	Stará Vajnorská	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Na Pasekách 12	Na Pasekách 12	Bratislava	SK	.khvjf	83506	\N	\N
197	Stará Vajnorská	Kaieta	421949590207	kaieta.ievgenii@gmail.com	sdwe	Rumančeková 861/52	Bratislava	SK	qwqd	82101	\N	\N
198	Sumska 25	Kaieta	380689901426	kaieta.ievgenii@gmail.com	Stará Vajnorská	Stará Vajnorská	Bratislava	UA	Ukrajina	13231	\N	\N
199	qwdqedwe	edwedfw	380689901426	kaieta.ievgenii@gmail.com	Rumančeková 861/52	Rumančeková 861/52	Bratislava	SK	qwdqw	82101	\N	\N
200	Stará Vajnorská	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Na Pasekách 12	Na Pasekách 12	Bratislava	SK	asda	83506	\N	\N
201	Stará Vajnorská	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Rumančeková 861/52	Rumančeková 861/52	Bratislava	SK	sdad	82101	\N	\N
202	Stará Vajnorská	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Stará Vajnorská	Stará Vajnorská	Bratislava	UA	Ukrajina	67485	\N	\N
203	da	dsafs	380667232701	sale@ltd-greenway.com	Stará Vajnorská	Stará Vajnorská	Bratislava	UA	Ukrajina	123	\N	\N
204	qwdqedwe	sadqwq	421949590207	kaieta.ievgenii@gmail.com	Stará Vajnorská	Stará Vajnorská	Bratislava	UA	Ukrajina	13123	\N	\N
205	Stará Vajnorská	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Stará Vajnorská	Stará Vajnorská	Bratislava	UA	Ukrajina	123123	\N	\N
206	Rumančeková 861/52	Kaieta	380949590207	kaieta.ievgenii@gmail.com	Sumska 25	Sumska 25	Krasopillia	UA	dasda	42400	\N	\N
207	dfwfefre	dfdvrgrsgt	312068990142	kaieta.ievgenii@gmail.com	Stará Vajnorská	Stará Vajnorská	Bratislava	UA	Ukrajina	123123	\N	\N
208	sdfs	Каєта	380689901426	kaieta.ievgenii@gmail.com	Stará Vajnorská	Stará Vajnorská	Bratislava	UA	Ukrajina	123123	\N	\N
209	Rumančeková 861/52	Kaieta	350949590207	kaieta.ievgenii@gmail.com	Stará Vajnorská	Stará Vajnorská	Bratislava	UA	Ukrajina	65	\N	\N
210	Rumančeková 861/52	Kaieta	380949590207	kaieta.ievgenii@gmail.com	Rumančeková 861/52	Rumančeková 861/52	Bratislava	SK	vcx	82101	\N	\N
211	Sumska 25	Kaieta	13206899014	kaieta.ievgenii@gmail.com	Stará Vajnorská	Stará Vajnorská	Bratislava	UA	Ukrajina	12312	\N	\N
212	Sumska 25	Kaieta	10689901426	kaieta.ievgenii@gmail.com	Rumančeková 861/52	Rumančeková 861/52	Bratislava	SK	s	82	\N	\N
213	Sumska 25	Kaieta	10689901426	kaieta.ievgenii@gmail.com	Rumančeková 861/52	Rumančeková 861/52	Bratislava	SK	s	82	\N	\N
214	Ігор	Вікторчук	421949590207	kaieta.ievgenii@gmail.com	Любченка 43	квартира 2	Суми	UA	Сумьска	54500	\N	\N
215	Віктор	Павлик	380454561877	vikero@dlkfn	Лабораторна 3	22	Кишинів	UA	Одеська	81923	\N	\N
216	43252	63463	380454468877	leshakozachok@gmail.com	Na Pasekách 12	Na Pasekách 12	Bratislava	SK	Ukrajina	83506	\N	\N
217	43252	63463	380454468877	leshakozachok@gmail.com	Na Pasekách 12	Na Pasekách 12	Bratislava	SK	Ukrajina	83506	\N	\N
218	Петро	Сагайдачний	380565545454	lolka@com	Na Pasekách 12	Na Pasekách 12	Bratislava	SK	Oblast	83506	\N	\N
219	Дмитро	Вишневецький	380468468488	postra@als	Чернівецька 2	1	Хмельницький	UA	Область	32112	\N	\N
220	іван	коломия	380689901426	trew@dsoifnl	Кололо	Трололо	Кололо	UA	толоіво	1231234	\N	\N
221	Артем	Смірнов	380546868787	Cvds@sad	Rumančeková 861/52	Rumančeková 861/52	Bratislava	SK	SDa	82112	\N	\N
222	Артем	Смірнов	380546868787	Cvds@sad	Rumančeková 861/52	Rumančeková 861/52	Bratislava	SK	SDa	82112	\N	\N
223	Артем	Смірнов	380546868787	Cvds@sad	Rumančeková 861/52	Rumančeková 861/52	Bratislava	SK	SDa	82112	\N	\N
224	Артем	Смірнов	380546868787	Cvds@sad	Rumančeková 861/52	Rumančeková 861/52	Bratislava	SK	SDa	82112	\N	\N
225	Артем	Смірнов	380546868787	Cvds@sad	Rumančeková 861/52	Rumančeková 861/52	Bratislava	SK	SDa	82112	\N	\N
226	Артем	Смірнов	380546868787	Cvds@sad	Rumančeková 861/52	Rumančeková 861/52	Bratislava	SK	SDa	82112	\N	\N
227	Артем	Смірнов	380546868787	Cvds@sad	Rumančeková 861/52	Rumančeková 861/52	Bratislava	SK	SDa	82112	\N	\N
228	Артем	Смірнов	380546868787	Cvds@sad	Rumančeková 861/52	Rumančeková 861/52	Bratislava	SK	SDa	82112	\N	\N
229	Артем	Смірнов	380546868787	Cvds@sad	Rumančeková 861/52	Rumančeková 861/52	Bratislava	SK	SDa	82112	\N	\N
230	Артем	Смірнов	380546868787	Cvds@sad	Rumančeková 861/52	Rumančeková 861/52	Bratislava	SK	SDa	82112	\N	\N
231	Артем	Смірнов	380546868787	Cvds@sad	Rumančeková 861/52	Rumančeková 861/52	Bratislava	SK	SDa	82112	\N	\N
232	Артем	Смірнов	380546868787	Cvds@sad	Rumančeková 861/52	Rumančeková 861/52	Bratislava	SK	SDa	82112	\N	\N
233	Артем	Смірнов	380546868787	Cvds@sad	Rumančeková 861/52	Rumančeková 861/52	Bratislava	SK	SDa	82112	\N	\N
234	Владилена	Тарарский	380546846846	lol@lol	Stará Vajnorská	Stará Vajnorská	Bratislava	UA	Ukrajina	21313	\N	\N
235	Stara	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Na Pasekách 12	Na Pasekách 12	Bratislava	SK	21312	83506	\N	\N
236	lKALK	Kaieta	380545465468	kaieta.ievgenii@gmail.com	Stará Vajnorská	Stará Vajnorská	Bratislava	UA	Ukrajina	13123	\N	\N
237	Ivan	Disognhed	380143548468	dis@toloo.com	Na Pasekách 12	Na Pasekách 12	Bratislava	SK	sdSD	83506	\N	\N
238	Ivan	Disognhed	380143548468	dis@toloo.com	Na Pasekách 12	Na Pasekách 12	Bratislava	SK	sdSD	83506	\N	\N
239	Ivan	Disognhed	380143548468	dis@toloo.com	Na Pasekách 12	Na Pasekách 12	Bratislava	SK	sdSD	83506	\N	\N
240	Ivan	Disognhed	380143548468	dis@toloo.com	Na Pasekách 12	Na Pasekách 12	Bratislava	SK	sdSD	83506	\N	\N
241	Ivan	Disognhed	380143548468	dis@toloo.com	Na Pasekách 12	Na Pasekách 12	Bratislava	SK	sdSD	83506	\N	\N
242	Ivan	Disognhed	380143548468	dis@toloo.com	Na Pasekách 12	Na Pasekách 12	Bratislava	SK	sdSD	83506	\N	\N
243	Ivan	Disognhed	380143548468	dis@toloo.com	Na Pasekách 12	Na Pasekách 12	Bratislava	SK	sdSD	83506	\N	\N
244	Ivan	Disognhed	380143548468	dis@toloo.com	Na Pasekách 12	Na Pasekách 12	Bratislava	SK	sdSD	83506	\N	\N
245	Ivan	Disognhed	380143548468	dis@toloo.com	Na Pasekách 12	Na Pasekách 12	Bratislava	SK	sdSD	83506	\N	\N
246	Ivan	Disognhed	380143548468	dis@toloo.com	Na Pasekách 12	Na Pasekách 12	Bratislava	SK	sdSD	83506	\N	\N
247	Stat	Slokke	380315484351	slokek@slolo.cpm	Sumska 25	Sumska 25	Krasopillia	UA	LLL	42400	\N	\N
248	LJGL	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Stará Vajnorská	Stará Vajnorská	Bratislava	UA	Ukrajina	13212	\N	\N
249	Sumska	Kaieta	380689901426	kaieta.ievgenii@gmail.com	Sumska 25	Sumska 25	Krasopillia	UA	LH	42400	\N	\N
250	Sumska	Kaieta	380689901426	kaieta.ievgenii@gmail.com	Sumska 25	Sumska 25	Krasopillia	UA	LH	42400	\N	\N
251	Lola	Kuznicova	380146288544	kuzia@lola.com	Grand	21	Krak	UA	Kla	37373	\N	\N
252	Falyna	Faoll	380546847687	loall@fala.com	Pazdo 2		Lviv	UA	Lviv	13584	\N	\N
253	Kola	Cola	380894762958	loalo@cola.koka	Durnev	2	Klra	UA	JJJ	13874	\N	\N
254	lgkg	Kaieta	380949590207	kaieta.ievgenii@gmail.com	Stará Vajnorská	Stará Vajnorská	Bratislava	UA	Ukrajina	12312	\N	\N
255	KJf	gkuf	380897890876	dfjh@lugfdli.com	Kjlglhg 678		KJhgl	UA	lkjhl	67521	\N	\N
256	sdlkjbfslkjd	dsflksb	380864327890	sadfgas@dfs.com	влордіовпшд	дроіивпдмсрівди	sdjkfhlsk	UA	івдломиідврим	12312	\N	\N
257	laskg	sdknb	380675467892	kjbv@vsdlijb.com	sldkjhs	dlsjhvcsl	sdlvkhb	BL	vsd;kjb	12321	\N	\N
258	lsa	sdlkfns	380397492843	lsdknv@dkf.com	dlshfs	lvhksd	lmvnsl	UA	lkh	21987	\N	\N
259	lskdjb	lsdkjbh	380836738768	jdbh@dshbf.pc	kjhv	kjhg	kjh	UA	hvl	12123	\N	\N
260	іфовали	лвоиіаівл	380924718461	asfjkakfl@dl.com	влоидло	вюоилд	іфдвшра	UA	длоа	12314	\N	\N
261	івюолаиіжв	ловмиіжолви	548468458425	kaieta.ievgenii@gmail.com	Stará Vajnorská	Stará Vajnorská	Bratislava	UA	Ukrajina	12444	\N	\N
262	sflks	alsdfh	421949590207	kaieta.ievgenii@gmail.com	sdfsjhn	;jsdblfhsb	sdfsd	LA	sdfsd	21312	\N	\N
263	sadasd	dd	380689901426	kaieta.ievgenii@gmail.com	dsedw	Na Pasekách 12	Bratislava	SK	das	83506	\N	\N
264	jkndkjsbd	jkdsfklds	421949590207	kaieta.ievgenii@gmail.com	sdcs	dc	dscds	UA	dcs	32121	\N	\N
265	Ruma	Kaieta	380949590207	kaieta.ievgenii@gmail.com	Stará Vajnorská	Stará Vajnorská	Bratislava	SK	Ukrajina	83506	\N	\N
266	Sanya	Yobar	421949590207	kaieta.ievgenii@gmail.com	Рябка 1		Черкаси	UA	Черкаська обл	21456	\N	\N
267	AKug	Kaieta	380468468513	kaieta.ievgenii@gmail.com	Rumančeková 861/52	Rumančeková 861/52	Bratislava	SK	sdfa	82101	\N	\N
268	Kelvin	Klain	380689901426	kaieta.ievgenii@gmail.com	Шота Руставелі 22		Київ	UA	Київ	01101	\N	\N
269	Ievgenii	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Rumančeková 861/52	Rumančeková 861/52	Bratislava	SK	Bratislava	82101	\N	\N
270	Євгеній 	Каєта	380689901426	kaieta.ievgenii@gmail.com	Шота Руставелі 22	Шота Руставелі 22	Київ	UA	Київ	01101	\N	\N
271	Міша	Шаповал	421949590207	kaieta.ievgenii@gmail.com	Rumančeková 861/52	Rumančeková 861/52	Bratislava	SK	Bratislava	82101	\N	\N
272	lugli	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Na Pasekách 12	Na Pasekách 12	Bratislava	SK	Ukrajina	83506	\N	\N
273	sdfs	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Sumska 25	Sumska 25	Krasopillia	UA	ds	42400	\N	\N
274	Шота	Kaieta	380689901426	kaieta.ievgenii@gmail.com	Na Pasekách 12	Na Pasekách 12	Bratislava	SK	hvm	83506	\N	\N
275	Kjk	iiIYT	380689901426	kaieta.ievgenii@gmail.com	Шота Руставелі 22	Шота Руставелі 22	Київ	UA	Київ	01101	\N	\N
276	лїі	Каєта	380689901426	kaieta.ievgenii@gmail.com	Шота Руставелі 22	Шота Руставелі 22	Київ	UA	Київ	01101	\N	\N
277	ss	Каєта	380689901426	kaieta.ievgenii@gmail.com	Шота Руставелі 22	Шота Руставелі 22	Київ	UA	Київ	01101	\N	\N
278	aaa	Каєта	380689901426	kaieta.ievgenii@gmail.com	Шота Руставелі 22	Шота Руставелі 22	Київ	UA	Київ	01101	\N	\N
279	wqs	Каєта	380689901426	kaieta.ievgenii@gmail.com	Шота Руставелі 22	Шота Руставелі 22	Київ	UA	Київ	01101	\N	\N
280	sdsd	Каєта	380689901426	kaieta.ievgenii@gmail.com	Шота Руставелі 22	Шота Руставелі 22	Київ	UA	Київ	01101	\N	\N
281	sss	Каєта	380689901426	kaieta.ievgenii@gmail.com	Шота Руставелі 22	Шота Руставелі 22	Київ	UA	Київ	01101	\N	\N
282	ljhlh	Каєта	380689901426	kaieta.ievgenii@gmail.com	Шота Руставелі 22	Шота Руставелі 22	Київ	UA	Київ	01101	\N	\N
283	sss	Каєта	380667232701	sale@ltd-greenway.com	Шота Руставелі 22	Шота Руставелі 22	Київ	UA	Київ	01101	\N	\N
284	Kjjhgf	Kaieta	380689901426	kaieta.ievgenii@gmail.com	Шота Руставелі 22	Шота Руставелі 22	Київ	UA	Київ	01101	\N	\N
285	kjhgg	Каєта	380689901426	kaieta.ievgenii@gmail.com	Шота Руставелі 22	Шота Руставелі 22	Київ	UA	Київ	01101	\N	\N
286	wwq	Каєта	380689901426	kaieta.ievgenii@gmail.com	Шота Руставелі 22	Шота Руставелі 22	Київ	UA	Київ	01101	\N	\N
287	ss	Каєта	380689901426	sale@ltd-greenway.com	Шота Руставелі 22	Шота Руставелі 22	Київ	UA	Київ	01101	\N	\N
288	mmm	Каєта	380689901426	kaieta.ievgenii@gmail.com	Шота Руставелі 22	Шота Руставелі 22	Київ	UA	Київ	01101	\N	\N
289	Jonh	Huyou	380155854787	martestgoa@gmail.com	Шота Руставелі 22	Шота Руставелі 22	Київ	UA	Київ	01101	\N	\N
290	Jonh	Huje	380949590207	kaieta.ievgenii@gmail.com	Шота Руставелі 22	Шота Руставелі 22	Київ	UA	Київ	01101	\N	\N
291	Jong	Hoy	380949590207	kaieta.ievgenii@gmail.com	Шота Руставелі 22	Шота Руставелі 22	Київ	UA	Київ	01101	\N	\N
292	Johd	Hoo	380574778888	kaieta.ievgenii@gmail.com	Шота Руставелі 22	Шота Руставелі 22	Київ	UA	Київ	01101	\N	\N
293	Шота	Kaieta	031689901426	kaieta.ievgenii@gmail.com	Шота Руставелі 22	Шота Руставелі 22	Київ	UA	Київ	01101	\N	\N
294	Sdf	Foe	380689901426	kaieta.ievgenii@gmail.com	Шота Руставелі 22	Шота Руставелі 22	Київ	UA	Lvia	01101	\N	\N
295	sdf	sdf	380212121212	kaieta.ievgenii@gmail.com	Шота Руставелі 22	Шота Руставелі 22	Київ	UA	Київ	01101	\N	\N
296	sart	ghj	32094959020	kaieta.ievgenii@gmail.com	Шота Руставелі 22	Шота Руставелі 22	Київ	UA	Київ	01101	\N	\N
297	hg	hgh	32068990142	kaieta.ievgenii@gmail.com	Шота Руставелі 22	Шота Руставелі 22	Київ	UA	Київ	01101	\N	\N
298	hgffg	ggdgd	380689901426	kaieta.ievgenii@gmail.com	Шота Руставелі 22	Шота Руставелі 22	Київ	UA	Київ	01101	\N	\N
299	sdf	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	AX	Київська область	07540	\N	\N
300	sdf	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	AX	Київська область	07540	\N	\N
301	sdf	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	AX	Київська область	07540	\N	\N
302	sdf	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	AX	Київська область	07540	\N	\N
303	sdf	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	DE	Київська область	07540	\N	\N
304	sdf	Smirnov	380639366753	aratatem2013@gmail.com	м. Березань, вул. Шевченків шлях, б. 112, кв 10	м. Березань, вул. Шевченків шлях, б. 112, кв 10	Berezan	DE	Київська область	07540	\N	\N
305	Artem	Smirnov	380639366753	aratatem2013@gmail.com			b1a78da1-cfab-11e0-baa0-c8912765d3f7	UA			\N	\N
306	Artem	Smirnov	380639366753	aratatem2013@gmail.com			b1a78da1-cfab-11e0-baa0-c8912765d3f7	UA			\N	\N
307	Artem	Smirnov	380639366753	aratatem2013@gmail.com			b1a78da1-cfab-11e0-baa0-c8912765d3f7	UA			\N	\N
308	Artem	Smirnov	380639366753	aratatem2013@gmail.com			b1a78da1-cfab-11e0-baa0-c8912765d3f7	UA			\N	\N
309	Artem	Smirnov	380639366753	aratatem2013@gmail.com			b1a78da1-cfab-11e0-baa0-c8912765d3f7	UA			\N	\N
310	Artem	Smirnov	380639366753	aratatem2013@gmail.com			b1a78da1-cfab-11e0-baa0-c8912765d3f7	UA			\N	\N
311	Artem	Smirnov	380639366753	aratatem2013@gmail.com			b1a78da1-cfab-11e0-baa0-c8912765d3f7	UA			\N	\N
312	Artem	Smirnov	380639366753	aratatem2013@gmail.com			b1a78da1-cfab-11e0-baa0-c8912765d3f7	UA			\N	\N
313	Artem	Smirnov	380639366753	aratatem2013@gmail.com			b1a78da1-cfab-11e0-baa0-c8912765d3f7	UA			\N	\N
314	Artem	Smirnov	380639366753	aratatem2013@gmail.com			b1a78da1-cfab-11e0-baa0-c8912765d3f7	UA			\N	\N
315	Artem	Smirnov	380639366753	aratatem2013@gmail.com			b1a78da1-cfab-11e0-baa0-c8912765d3f7	UA			\N	\N
316	Artem	Smirnov	380639366753	aratatem2013@gmail.com			b1a78da1-cfab-11e0-baa0-c8912765d3f7	UA			\N	\N
317	Artem	Smirnov	380639366753	aratatem2013@gmail.com			b1a78da1-cfab-11e0-baa0-c8912765d3f7	UA			\N	\N
318	Artem	Smirnov	380639366753	aratatem2013@gmail.com			b1a78da1-cfab-11e0-baa0-c8912765d3f7	UA			\N	\N
319	Artem	Smirnov	380639366753	aratatem2013@gmail.com			b1a78da1-cfab-11e0-baa0-c8912765d3f7	UA			\N	\N
320	Artem	Smirnov	380639366753	aratatem2013@gmail.com			b1a78da1-cfab-11e0-baa0-c8912765d3f7	UA			\N	\N
321	Artem	Smirnov	380639366753	aratatem2013@gmail.com			b1a78da1-cfab-11e0-baa0-c8912765d3f7	UA			\N	\N
322	Artem	Smirnov	380639366753	aratatem2013@gmail.com			b1a78da1-cfab-11e0-baa0-c8912765d3f7	UA			\N	\N
323	Євгеній	Каєта	380689901426	kaieta.ievgenii@gmail.com			a4502bed-577e-11de-b9fc-0021918b679a	UA			\N	\N
324	Євгеній	Каєта	380689901426	kaieta.ievgenii@gmail.com			a4502bed-577e-11de-b9fc-0021918b679a	UA			\N	\N
325	Євгеній	Каєта	380689901426	kaieta.ievgenii@gmail.com			a4502bed-577e-11de-b9fc-0021918b679a	UA			\N	\N
326	Євгеній	Каєта	380689901426	kaieta.ievgenii@gmail.com	Stará Vajnorská	Stará Vajnorská	Liux	DE	Ukrajina	83506	\N	\N
327	Євгеній	Каєта	380689901426	kaieta.ievgenii@gmail.com			db5c88f5-391c-11dd-90d9-001a92567626	UA			\N	\N
328	Ievgenii	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Stará Vajnorská	Stará Vajnorská	Bratislava	CZ	Ukrajina	01101	\N	\N
329	Ievgenii	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Na Pasekách 12	Na Pasekách 12	Krasopillia	FR	safsda	83506	\N	\N
330	Ievgenii	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Rumančeková 861/52	Rumančeková 861/52	Bratislava	SK	Bratislava	82101	\N	\N
331	Ievgenii	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Stará Vajnorská	Stará Vajnorská	Bratislava	SK	Bratislava	83506	\N	\N
332	Ievgenii	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Stará Vajnorská	Stará Vajnorská	Krasopillia	DE	Ukrajina	12121	\N	\N
333	Ievgenii	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Stará Vajnorská	Stará Vajnorská	Krasopillia	DE	Ukrajina	12123	\N	\N
334	Ievgenii	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Na Pasekách 12	Na Pasekách 12	Bratislava	DE	wads	83506	\N	\N
335	Ievgenii	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Шота Руставелі 22	Шота Руставелі 22	Bratislava	DE	Київ	01101	\N	\N
336	Ievgenii	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Шота Руставелі 22	Шота Руставелі 22	Bratislava	DE	Київ	01101	\N	\N
337	Ievgenii	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Шота Руставелі 22	Шота Руставелі 22	Bratislava	DE	Київ	01101	\N	\N
338	Ievgenii	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Шота Руставелі 22	Шота Руставелі 22	Bratislava	DE	Київ	01101	\N	\N
339	Sta	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Шота Руставелі 22	Шота Руставелі 22	Bratislava	GE	Київ	01101	\N	\N
340	Ievgenii	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Stará Vajnorská	Stará Vajnorská	Bratislava	AX	Ukrajina	31233	\N	\N
341	Ievgenii	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Шота Руставелі 22	Шота Руставелі 22	Дніпро	DZ	Київ	01101	\N	\N
342	Ievgenii	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Stará Vajnorská	Stará Vajnorská	Дніпро	AL	Ukrajina	21111	\N	\N
343	Ievgenii	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Шота Руставелі 22	Шота Руставелі 22	Дніпро	DZ	Київ	01101	\N	\N
344	Angelo	Bulucci	421949596448	kaieta.ievgenii@gmail.com	Sumska 25	Sumska 25	Duseldorf	DE	dqwd	42400	\N	\N
345	Євгеній	Каєта	380689901426	kaieta.ievgenii@gmail.com			8d5a980d-391c-11dd-90d9-001a92567626	UA			\N	\N
346	Євгеній	Каєта	380689901426	kaieta.ievgenii@gmail.com	Stará Vajnorská	Stará Vajnorská	Bratislava	DE	Ukrajina	01101	ukr_post	
347	Ivan	Asimov	380667232701	sale@ltd-greenway.com			db5c88d0-391c-11dd-90d9-001a92567626	UA			nova_post	1ec09d63-e1c2-11e3-8c4a-0050568002cf
348	Євгеній	Каєта	380689901426	kaieta.ievgenii@gmail.com			db5c88e0-391c-11dd-90d9-001a92567626	UA			nova_post	1ec09d93-e1c2-11e3-8c4a-0050568002cf
349	Євгеній	Каєта	380689901426	kaieta.ievgenii@gmail.com			db5c88e0-391c-11dd-90d9-001a92567626	UA			nova_post	7b422fba-e1b8-11e3-8c4a-0050568002cf
350	Євгеній	Каєта	380689901426	kaieta.ievgenii@gmail.com			db5c88f5-391c-11dd-90d9-001a92567626	UA			nova_post	16922806-e1c2-11e3-8c4a-0050568002cf
351	Євгеній	Каєта	380689901426	kaieta.ievgenii@gmail.com			db5c88f5-391c-11dd-90d9-001a92567626	UA			nova_post	1ec09daf-e1c2-11e3-8c4a-0050568002cf
352	Євгеній	Каєта	380689901426	kaieta.ievgenii@gmail.com			db5c88d0-391c-11dd-90d9-001a92567626	UA			nova_post	169227dc-e1c2-11e3-8c4a-0050568002cf
353	Євгеній	Каєта	380689901426	kaieta.ievgenii@gmail.com			db5c88f5-391c-11dd-90d9-001a92567626	UA			nova_post	39931b6c-e1c2-11e3-8c4a-0050568002cf
354	Alex	Lapte	380689901426	kaieta.ievgenii@gmail.com	Rumančeková	861/52	Prague	CZ	Prague	82101	ukr_post	
355	Igot	Lovo	380689901426	kaieta.ievgenii@gmail.com			db5c88f5-391c-11dd-90d9-001a92567626	UA			nova_post	1ec09daf-e1c2-11e3-8c4a-0050568002cf
356	Сергій	Корж	380213102391	korg@lolo.com			{"value":"db5c88f0-391c-11dd-90d9-001a92567626","label":"Дніпро"}	UA			nova_post	{"label":"Відділення №8: смт. Слобожанське, вул. Василя Сухомлинського, 61","value":"336de19e-e1c2-11e3-8c4a-0050568002cf"}
357	Stefan	Jonson	420554898988	jonson@g.com	Rumančeková 861/52		{"value":"","label":"Prague"}	CZ	Prague 2	82101	ukr_post	{"value":"","label":""}
358	Jozef	Lopster	420554898988	lop@g.com	Rumančeková 861/52	Rumančeková 861/52	{"value":"","label":"Prague"}	CZ	Prague 2	82101	ukr_post	{"value":"","label":""}
359	Євгеній	Каєта	380689901426	kaieta.ievgenii@gmail.com	Rumančeková 861/52		{"value":"","label":"Prague"}	CZ	Prague 2	82101	ukr_post	{"value":"","label":""}
360	Євгеній	Каєта	380689901426	kaieta.ievgenii@gmail.com	Na Pasekách 12		{"value":"","label":"Prague"}	CZ	Prague 2	83506	ukr_post	{"value":"","label":""}
361	Євгеній	Каєта	380689901426	kaieta.ievgenii@gmail.com	Na Pasekách 12		{"value":"","label":"Prague"}	CZ	Prague 2	83506	ukr_post	{"value":"","label":""}
362	Євгеній	Каєта	380689901426	kaieta.ievgenii@gmail.com	Na Pasekách 12		{"value":"","label":"Prague"}	CZ	Prague 2	83506	ukr_post	{"value":"","label":""}
363	Євгеній	Каєта	380689901426	kaieta.ievgenii@gmail.com	Na Pasekách 12		{"value":"","label":"Prague"}	CZ	Prague 2	83506	ukr_post	{"value":"","label":""}
364	Євгеній	Каєта	380689901426	kaieta.ievgenii@gmail.com	Шота Руставелі 22	Шота Руставелі 22	Krasopillia	DK	Київ	01101	\N	\N
365	Ievgenii	Kaieta	421949590207	kaieta.ievgenii@gmail.com			db5c88d0-391c-11dd-90d9-001a92567626	UA			\N	\N
366	Євгеній	Каєта	380689901426	kaieta.ievgenii@gmail.com			db5c88f5-391c-11dd-90d9-001a92567626	UA			\N	\N
367	Лампотій	Грамотний	380689901426	kaieta.ievgenii@gmail.com			{"value":"db5c88f5-391c-11dd-90d9-001a92567626","label":"Львів"}	UA			\N	\N
368	Лампотій	Грамотний	380689901426	kaieta.ievgenii@gmail.com			{"value":"db5c88d0-391c-11dd-90d9-001a92567626","label":"Одеса"}	UA			\N	\N
369	Генадій	Павлик	380689901426	kaieta.ievgenii@gmail.com			{"value":"db5c88f5-391c-11dd-90d9-001a92567626","label":"Львів"}	UA			\N	\N
370	Лобзик	Кандратович	380689901426	kaieta.ievgenii@gmail.com			{"label":"м. Жмеринка, Жмеринський р-н, Вінницька обл.","value":"17e0c2cb-b5b9-11dd-81ea-001d92f78697"}	UA			\N	\N
371	Андрій	Лузан	380689901426	kaieta.ievgenii@gmail.com	Stará Vajnorská	21	{"value":"","label":"Krasopillia"}	BB	Bar	25599	\N	\N
372	Лопух	Березовський	380689901426	kaieta.ievgenii@gmail.com			{"value":"8d5a980d-391c-11dd-90d9-001a92567626","label":"Київ"}	UA			\N	\N
373	Лопух	Лебовський	380689901426	kaieta.ievgenii@gmail.com			{"value":"db5c88d0-391c-11dd-90d9-001a92567626","label":"Одеса"}	UA			\N	\N
374	Лопух	Лебовський	380689901426	kaieta.ievgenii@gmail.com			{"value":"db5c88e0-391c-11dd-90d9-001a92567626","label":"Харків"}	UA			\N	\N
375	Юрій	Стоянов	380689901426	kaieta.ievgenii@gmail.com			{"value":"8d5a980d-391c-11dd-90d9-001a92567626","label":"Київ"}	UA			\N	\N
376	Юрій	Стоянов	380689901426	kaieta.ievgenii@gmail.com			{"value":"db5c88f5-391c-11dd-90d9-001a92567626","label":"Львів"}	UA			\N	\N
377	Євгеній	Каєта	380689901426	kaieta.ievgenii@gmail.com			{"value":"db5c88f5-391c-11dd-90d9-001a92567626","label":"Львів"}	UA			\N	\N
378	Євгеній	Каєта	380689901426	kaieta.ievgenii@gmail.com			{"value":"db5c88f5-391c-11dd-90d9-001a92567626","label":"Львів"}	UA			\N	\N
379	Євгеній	Каєта	380689901426	kaieta.ievgenii@gmail.com			db5c88d0-391c-11dd-90d9-001a92567626	UA			\N	\N
380	Євгеній	Каєта	380689901426	kaieta.ievgenii@gmail.com			{"value":"db5c88d0-391c-11dd-90d9-001a92567626","label":"Одеса"}	UA			nova_post	{"label":"Відділення №5 (до 30 кг на одне місце): вул. Академіка Філатова, 24","value":"40498333-e1c2-11e3-8c4a-0050568002cf"}
381	Ievgenii	Kaieta	421949590207	kaieta.ievgenii@gmail.com			{"value":"db5c88f0-391c-11dd-90d9-001a92567626","label":"Дніпро"}	UA			nova_post	{"label":"Відділення №9 (до 30 кг): вул. Шмідта, 10/3","value":"511fcfd3-e1c2-11e3-8c4a-0050568002cf"}
382	Гляб	Дуда	380998293032	sdlnj@lkcmd.com			{"value":"db5c88f5-391c-11dd-90d9-001a92567626","label":"Львів"}	UA			nova_post	{"label":"Відділення №8 (до 30 кг): вул. Грінченка, 2а","value":"47402e72-e1c2-11e3-8c4a-0050568002cf"}
383	Ostin	Powers	380689901426	kaieta.ievgenii@gmail.com	Kodaňská 1392/97		{"value":"","label":"Prague"}	CZ	Praha 10-Vršovice	10100	ukr_post	{"value":"","label":""}
384	Artem	Samojlov	380689901426	kaieta.ievgenii@gmail.com	Rumančeková 861/52		{"value":"","label":"Bratislava"}	SK	Travniki	82101	ukr_post	{"value":"","label":""}
385	Antot	Samojlov	421949590207	kaieta.ievgenii@gmail.com	Rumančeková 861/52		{"value":"","label":"Bratislava"}	SK	Travniki	82101	ukr_post	{"value":"","label":""}
386	Anton	Samojlov	380689901426	kaieta.ievgenii@gmail.com	Rumančeková 861/52		{"value":"","label":"Bratislava"}	SK	Travniki	82101	ukr_post	{"value":"","label":""}
387	Ievgenii	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Rumančeková 861/52		{"value":"","label":"Bratislava"}	SK	Travniki	82101	ukr_post	{"value":"","label":""}
388	Ievgenii	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Rumančeková 861/52		{"value":"","label":"Bratislava"}	SK	Travniki	82101	ukr_post	{"value":"","label":""}
389	Ievgenii	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Rumančeková 861/52		{"value":"","label":"Bratislava"}	SK	Travniki	82101	ukr_post	{"value":"","label":""}
390	Ievgenii	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Rumančeková 861/52		{"value":"","label":"Bratislava"}	SK	Travniki	82101	ukr_post	{"value":"","label":""}
391	Ievgenii	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Rumančeková 861/52		{"value":"","label":"Bratislava"}	SK	Travniki	82101	ukr_post	{"value":"","label":""}
392	Ievgenii	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Rumančeková 861/52		{"value":"","label":"Bratislava"}	SK	Travniki	82101	ukr_post	{"value":"","label":""}
393	Ievgenii	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Rumančeková 861/52		{"value":"","label":"Bratislava"}	SK	Travniki	82101	ukr_post	{"value":"","label":""}
394	Ievgenii	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Rumančeková 861/52		{"value":"","label":"Bratislava"}	SK	Travniki	82101	ukr_post	{"value":"","label":""}
395	Ievgenii	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Rumančeková 861/52		{"value":"","label":"Krakow"}	PL	Krakow	82101	ukr_post	{"value":"","label":""}
396	Ievgenii	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Rumančeková 861/52	Rumančeková 861/52	{"value":"","label":"Bratislava"}	SK	Travniki	82101	ukr_post	{"value":"","label":""}
397	Ievgenii	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Rumančeková 861/52	Rumančeková 861/52	{"value":"","label":"Bratislava"}	SK	Travniki	82101	ukr_post	{"value":"","label":""}
398	Ievgenii	Kaieta	32306899014	kaieta.ievgenii@gmail.com	Rumančeková 861/52	Rumančeková 861/52	{"value":"","label":"Bratislava"}	SK	Travniki	82101	ukr_post	{"value":"","label":""}
399	Ievgenii	Kaieta	421949590207	kaieta.ievgenii@gmail.com	Rumančeková 861/52	Rumančeková 861/52	{"value":"","label":"Bratislava"}	SK	Travniki	82101	ukr_post	{"value":"","label":""}
400	Ievgenii	Kaieta	421949590207	kaieta.ievgenii@gmail.com			{"value":"db5c88d0-391c-11dd-90d9-001a92567626","label":"Одеса"}	UA			nova_post	{"label":"Відділення №7 (до 30 кг): вул. Жуковського, 10","value":"4049833b-e1c2-11e3-8c4a-0050568002cf"}
401	Ievgenii	Kaieta	421949590207	kaieta.ievgenii@gmail.com			{"value":"db5c88f5-391c-11dd-90d9-001a92567626","label":"Львів"}	UA			nova_post	{"label":"Відділення №1: вул. Городоцька, 359","value":"1ec09d2e-e1c2-11e3-8c4a-0050568002cf"}
402	Ievgenii	Kaieta	421949590207	kaieta.ievgenii@gmail.com			{"value":"db5c88d0-391c-11dd-90d9-001a92567626","label":"Одеса"}	UA			nova_post	{"label":"Відділення №2: вул. Базова, 16 (Промринок, 7 км)","value":"7b422fc4-e1b8-11e3-8c4a-0050568002cf"}
403	Євгеній	Каєта	380689901426	kaieta.ievgenii@gmail.com			{"value":"db5c88f5-391c-11dd-90d9-001a92567626","label":"Львів"}	UA			nova_post	{"label":"Відділення №6 (до 30 кг): вул. Сихівська, 8","value":"16922858-e1c2-11e3-8c4a-0050568002cf"}
404	Євгеній	Каєта	380689901426	kaieta.ievgenii@gmail.com			{"value":"8d5a980d-391c-11dd-90d9-001a92567626","label":"Київ"}	UA			nova_post	{"label":"Відділення №1: вул. Пирогівський шлях, 135","value":"1ec09d88-e1c2-11e3-8c4a-0050568002cf"}
405	Євгеній	Каєта	380689901426	kaieta.ievgenii@gmail.com			{"value":"db5c88f5-391c-11dd-90d9-001a92567626","label":"Львів"}	UA			nova_post	{"label":"Відділення №5 (до 30 кг): вул. Данилишина, 6","value":"16922806-e1c2-11e3-8c4a-0050568002cf"}
406	Євгеній	Каєта	380689901426	kaieta.ievgenii@gmail.com			{"value":"db5c88e0-391c-11dd-90d9-001a92567626","label":"Харків"}	UA			nova_post	{"label":"Відділення №2 (до 30 кг на одне місце): просп.Героїв Харкова (ран. Московський), 54а","value":"7b422fba-e1b8-11e3-8c4a-0050568002cf"}
407	Ievgenii	Kaieta	421949590207	kaieta.ievgenii@gmail.com			{"value":"db5c88d0-391c-11dd-90d9-001a92567626","label":"Одеса"}	UA			nova_post	{"label":"Відділення №4: вул. Академіка Вільямса, 86","value":"1ec09d63-e1c2-11e3-8c4a-0050568002cf"}
408	Ievgenii	Kaieta	421949590207	kaieta.ievgenii@gmail.com			{"value":"db5c88f5-391c-11dd-90d9-001a92567626","label":"Львів"}	UA			nova_post	{"label":"Відділення №3: вул. Угорська, 22 (заїзд із вул. Луганської)","value":"39931b10-e1c2-11e3-8c4a-0050568002cf"}
409	Євгеній	Каєта	380689901426	kaieta.ievgenii@gmail.com			{"value":"db5c88f5-391c-11dd-90d9-001a92567626","label":"Львів"}	UA			nova_post	{"label":"Відділення №5 (до 30 кг): вул. Данилишина, 6","value":"16922806-e1c2-11e3-8c4a-0050568002cf"}
410	Євгеній	Каєта	380689901426	kaieta.ievgenii@gmail.com			{"value":"8d5a980d-391c-11dd-90d9-001a92567626","label":"Київ"}	UA			nova_post	{"label":"Відділення №6: вул. Миколи Василенка, 2 (метро Берестейська)","value":"1ec09d8b-e1c2-11e3-8c4a-0050568002cf"}
411	Ievgenii	Kaieta	421949590207	kaieta.ievgenii@gmail.com			{"value":"8d5a980d-391c-11dd-90d9-001a92567626","label":"Київ"}	UA			nova_post	{"label":"Відділення №3 (до 30 кг на одне місце): вул. Калачівська, 13 (Стара Дарниця)","value":"7b422fc3-e1b8-11e3-8c4a-0050568002cf"}
412	Євгеній	Каєта	380689901426	kaieta.ievgenii@gmail.com			{"value":"db5c88e0-391c-11dd-90d9-001a92567626","label":"Харків"}	UA			nova_post	{"label":"Відділення №3: вул. Тюрінська (ран. Якіра), 124","value":"7b422fbb-e1b8-11e3-8c4a-0050568002cf"}
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

SELECT pg_catalog.setval('public.contact_us_id_seq', 38, true);


--
-- Name: newslist_emails_newslist_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: printmall
--

SELECT pg_catalog.setval('public.newslist_emails_newslist_email_id_seq', 13, true);


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: printmall
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 370, true);


--
-- Name: payments_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: printmall
--

SELECT pg_catalog.setval('public.payments_payment_id_seq', 227, true);


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

SELECT pg_catalog.setval('public.shipping_info_shipping_info_id_seq', 412, true);


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

