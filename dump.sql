--
-- PostgreSQL database dump
--

-- Dumped from database version 12.19
-- Dumped by pg_dump version 12.19

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
-- Name: addtocart; Type: TABLE; Schema: public; Owner: restau
--

CREATE TABLE public.addtocart (
    id bigint NOT NULL,
    iddishe integer NOT NULL,
    iduser bigint NOT NULL,
    quantity integer NOT NULL,
    CONSTRAINT qtt_check CHECK ((quantity > 0))
);


ALTER TABLE public.addtocart OWNER TO restau;

--
-- Name: addtocart_id_seq; Type: SEQUENCE; Schema: public; Owner: restau
--

CREATE SEQUENCE public.addtocart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.addtocart_id_seq OWNER TO restau;

--
-- Name: addtocart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: restau
--

ALTER SEQUENCE public.addtocart_id_seq OWNED BY public.addtocart.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: restau
--

CREATE TABLE public.comments (
    id bigint NOT NULL,
    idcustomer bigint NOT NULL,
    comment text NOT NULL
);


ALTER TABLE public.comments OWNER TO restau;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: restau
--

CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO restau;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: restau
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: restau
--

CREATE TABLE public.customers (
    id bigint NOT NULL,
    firstname character varying(200) NOT NULL,
    name character varying(250) NOT NULL,
    mail character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    isactive boolean NOT NULL,
    uniqid character varying(50) NOT NULL,
    idestablishment integer NOT NULL,
    isadmin boolean DEFAULT false
);


ALTER TABLE public.customers OWNER TO restau;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: restau
--

CREATE SEQUENCE public.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO restau;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: restau
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: dishetype; Type: TABLE; Schema: public; Owner: restau
--

CREATE TABLE public.dishetype (
    id integer NOT NULL,
    libelle character varying(255) NOT NULL,
    image_name character varying(250) NOT NULL
);


ALTER TABLE public.dishetype OWNER TO restau;

--
-- Name: dishe_type_id_seq; Type: SEQUENCE; Schema: public; Owner: restau
--

CREATE SEQUENCE public.dishe_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dishe_type_id_seq OWNER TO restau;

--
-- Name: dishe_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: restau
--

ALTER SEQUENCE public.dishe_type_id_seq OWNED BY public.dishetype.id;


--
-- Name: dishes; Type: TABLE; Schema: public; Owner: restau
--

CREATE TABLE public.dishes (
    id integer NOT NULL,
    dishesname character varying(250) NOT NULL,
    idsupplier integer NOT NULL,
    sellingprice numeric(8,2) NOT NULL,
    purchaseprice numeric(8,2) NOT NULL,
    idtype integer NOT NULL,
    image character varying(250) NOT NULL
);


ALTER TABLE public.dishes OWNER TO restau;

--
-- Name: dishes_id_seq; Type: SEQUENCE; Schema: public; Owner: restau
--

CREATE SEQUENCE public.dishes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dishes_id_seq OWNER TO restau;

--
-- Name: dishes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: restau
--

ALTER SEQUENCE public.dishes_id_seq OWNED BY public.dishes.id;


--
-- Name: dishesmarks; Type: TABLE; Schema: public; Owner: restau
--

CREATE TABLE public.dishesmarks (
    id bigint NOT NULL,
    iddishe integer NOT NULL,
    idcustomer bigint NOT NULL,
    mark integer NOT NULL
);


ALTER TABLE public.dishesmarks OWNER TO restau;

--
-- Name: dishesmarks_id_seq; Type: SEQUENCE; Schema: public; Owner: restau
--

CREATE SEQUENCE public.dishesmarks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dishesmarks_id_seq OWNER TO restau;

--
-- Name: dishesmarks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: restau
--

ALTER SEQUENCE public.dishesmarks_id_seq OWNED BY public.dishesmarks.id;


--
-- Name: establishment; Type: TABLE; Schema: public; Owner: restau
--

CREATE TABLE public.establishment (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    location character varying(255) NOT NULL
);


ALTER TABLE public.establishment OWNER TO restau;

--
-- Name: establishment_id_seq; Type: SEQUENCE; Schema: public; Owner: restau
--

CREATE SEQUENCE public.establishment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.establishment_id_seq OWNER TO restau;

--
-- Name: establishment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: restau
--

ALTER SEQUENCE public.establishment_id_seq OWNED BY public.establishment.id;


--
-- Name: establismentemployee; Type: TABLE; Schema: public; Owner: restau
--

CREATE TABLE public.establismentemployee (
    id character varying(50) NOT NULL,
    idestablishment integer NOT NULL,
    nameemployee character varying(255) NOT NULL
);


ALTER TABLE public.establismentemployee OWNER TO restau;

--
-- Name: foodorder; Type: TABLE; Schema: public; Owner: restau
--

CREATE TABLE public.foodorder (
    id bigint NOT NULL,
    paymenttypeid integer NOT NULL,
    iddishes integer NOT NULL,
    customerid bigint NOT NULL,
    ordertime timestamp(0) without time zone NOT NULL,
    disheprice numeric(8,2) NOT NULL,
    dishepurchaseprice numeric(8,2) NOT NULL,
    idaddtocart bigint
);


ALTER TABLE public.foodorder OWNER TO restau;

--
-- Name: foodorder_id_seq; Type: SEQUENCE; Schema: public; Owner: restau
--

CREATE SEQUENCE public.foodorder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.foodorder_id_seq OWNER TO restau;

--
-- Name: foodorder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: restau
--

ALTER SEQUENCE public.foodorder_id_seq OWNED BY public.foodorder.id;


--
-- Name: indebtcustomers; Type: TABLE; Schema: public; Owner: restau
--

CREATE TABLE public.indebtcustomers (
    id integer NOT NULL,
    idcustomer bigint NOT NULL,
    debtamount numeric(8,2) NOT NULL,
    amountrefunded numeric(8,2) NOT NULL
);


ALTER TABLE public.indebtcustomers OWNER TO restau;

--
-- Name: indebtcustomers_id_seq; Type: SEQUENCE; Schema: public; Owner: restau
--

CREATE SEQUENCE public.indebtcustomers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indebtcustomers_id_seq OWNER TO restau;

--
-- Name: indebtcustomers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: restau
--

ALTER SEQUENCE public.indebtcustomers_id_seq OWNED BY public.indebtcustomers.id;


--
-- Name: modeofpayment; Type: TABLE; Schema: public; Owner: restau
--

CREATE TABLE public.modeofpayment (
    id integer NOT NULL,
    name character varying(250) NOT NULL
);


ALTER TABLE public.modeofpayment OWNER TO restau;

--
-- Name: modeofpayment_id_seq; Type: SEQUENCE; Schema: public; Owner: restau
--

CREATE SEQUENCE public.modeofpayment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modeofpayment_id_seq OWNER TO restau;

--
-- Name: modeofpayment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: restau
--

ALTER SEQUENCE public.modeofpayment_id_seq OWNED BY public.modeofpayment.id;


--
-- Name: movementtype; Type: TABLE; Schema: public; Owner: restau
--

CREATE TABLE public.movementtype (
    id integer NOT NULL,
    type character varying(255) NOT NULL
);


ALTER TABLE public.movementtype OWNER TO restau;

--
-- Name: movementtype_id_seq; Type: SEQUENCE; Schema: public; Owner: restau
--

CREATE SEQUENCE public.movementtype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movementtype_id_seq OWNER TO restau;

--
-- Name: movementtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: restau
--

ALTER SEQUENCE public.movementtype_id_seq OWNED BY public.movementtype.id;


--
-- Name: orderstate; Type: TABLE; Schema: public; Owner: restau
--

CREATE TABLE public.orderstate (
    id bigint NOT NULL,
    idorder bigint NOT NULL,
    ispending boolean NOT NULL
);


ALTER TABLE public.orderstate OWNER TO restau;

--
-- Name: orderstate_id_seq; Type: SEQUENCE; Schema: public; Owner: restau
--

CREATE SEQUENCE public.orderstate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orderstate_id_seq OWNER TO restau;

--
-- Name: orderstate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: restau
--

ALTER SEQUENCE public.orderstate_id_seq OWNED BY public.orderstate.id;


--
-- Name: spring_session; Type: TABLE; Schema: public; Owner: restau
--

CREATE TABLE public.spring_session (
    primary_id character(36) NOT NULL,
    session_id character(36) NOT NULL,
    creation_time bigint NOT NULL,
    last_access_time bigint NOT NULL,
    max_inactive_interval integer NOT NULL,
    expiry_time bigint NOT NULL,
    principal_name character varying(100)
);


ALTER TABLE public.spring_session OWNER TO restau;

--
-- Name: spring_session_attributes; Type: TABLE; Schema: public; Owner: restau
--

CREATE TABLE public.spring_session_attributes (
    session_primary_id character(36) NOT NULL,
    attribute_name character varying(200) NOT NULL,
    attribute_bytes bytea NOT NULL
);


ALTER TABLE public.spring_session_attributes OWNER TO restau;

--
-- Name: stockbyestablishment; Type: TABLE; Schema: public; Owner: restau
--

CREATE TABLE public.stockbyestablishment (
    id bigint NOT NULL,
    iddishes bigint NOT NULL,
    idestablishment bigint NOT NULL,
    remainingstock bigint NOT NULL,
    idmovementtype integer NOT NULL
);


ALTER TABLE public.stockbyestablishment OWNER TO restau;

--
-- Name: stockbyestablishment_id_seq; Type: SEQUENCE; Schema: public; Owner: restau
--

CREATE SEQUENCE public.stockbyestablishment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stockbyestablishment_id_seq OWNER TO restau;

--
-- Name: stockbyestablishment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: restau
--

ALTER SEQUENCE public.stockbyestablishment_id_seq OWNED BY public.stockbyestablishment.id;


--
-- Name: supplier; Type: TABLE; Schema: public; Owner: restau
--

CREATE TABLE public.supplier (
    id integer NOT NULL,
    namesupplier character varying(255) NOT NULL
);


ALTER TABLE public.supplier OWNER TO restau;

--
-- Name: supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: restau
--

CREATE SEQUENCE public.supplier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supplier_id_seq OWNER TO restau;

--
-- Name: supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: restau
--

ALTER SEQUENCE public.supplier_id_seq OWNED BY public.supplier.id;


--
-- Name: v_active_cart; Type: VIEW; Schema: public; Owner: restau
--

CREATE VIEW public.v_active_cart AS
 SELECT addtocart.id,
    addtocart.iddishe,
    addtocart.iduser,
    addtocart.quantity
   FROM (public.addtocart
     LEFT JOIN public.foodorder cc ON ((addtocart.id = cc.idaddtocart)))
  WHERE (cc.idaddtocart IS NULL);


ALTER TABLE public.v_active_cart OWNER TO restau;

--
-- Name: v_dishes; Type: VIEW; Schema: public; Owner: restau
--

CREATE VIEW public.v_dishes AS
 SELECT t1.id,
    t1.dishesname,
    t1.namesupplier,
    t1.sellingprice,
    t1.purchaseprice,
    t1.libelle,
    t1.image
   FROM ( SELECT t0.id,
            t0.dishesname,
            t0.namesupplier,
            t0.sellingprice,
            t0.purchaseprice,
            dishetype.libelle,
            t0.image
           FROM (( SELECT dishes.id,
                    dishes.dishesname,
                    supplier.namesupplier,
                    dishes.sellingprice,
                    dishes.purchaseprice,
                    dishes.idtype,
                    dishes.image
                   FROM (public.dishes
                     JOIN public.supplier ON ((dishes.idsupplier = supplier.id)))) t0
             JOIN public.dishetype ON ((t0.idtype = dishetype.id)))) t1;


ALTER TABLE public.v_dishes OWNER TO restau;

--
-- Name: v_active_cart_labeled; Type: VIEW; Schema: public; Owner: restau
--

CREATE VIEW public.v_active_cart_labeled AS
 SELECT t1.id,
    t1.iduser,
    t1.iddishe,
    t1.quantity,
    v_dishes.image,
    v_dishes.dishesname,
    v_dishes.libelle,
    v_dishes.namesupplier,
    v_dishes.sellingprice,
    v_dishes.purchaseprice
   FROM (( SELECT addtocart.id,
            addtocart.iddishe,
            addtocart.iduser,
            addtocart.quantity
           FROM (public.addtocart
             LEFT JOIN public.foodorder cc ON ((addtocart.id = cc.idaddtocart)))
          WHERE (cc.idaddtocart IS NULL)) t1
     JOIN public.v_dishes ON ((v_dishes.id = t1.iddishe)));


ALTER TABLE public.v_active_cart_labeled OWNER TO restau;

--
-- Name: v_addtocart; Type: VIEW; Schema: public; Owner: restau
--

CREATE VIEW public.v_addtocart AS
 SELECT t1.id,
    t1.dishesname,
    t1.name,
    t1.quantity
   FROM ( SELECT t0.id,
            t0.dishesname,
            customers.name,
            t0.quantity
           FROM (( SELECT addtocart.id,
                    dishes.dishesname,
                    addtocart.iduser,
                    addtocart.quantity
                   FROM (public.addtocart
                     JOIN public.dishes ON ((addtocart.iddishe = dishes.id)))) t0
             JOIN public.customers ON ((t0.iduser = customers.id)))) t1;


ALTER TABLE public.v_addtocart OWNER TO restau;

--
-- Name: v_dishetype; Type: VIEW; Schema: public; Owner: restau
--

CREATE VIEW public.v_dishetype AS
 SELECT dishetype.id,
    dishetype.libelle,
    dishetype.image_name
   FROM public.dishetype;


ALTER TABLE public.v_dishetype OWNER TO restau;

--
-- Name: v_establishment; Type: VIEW; Schema: public; Owner: restau
--

CREATE VIEW public.v_establishment AS
 SELECT establishment.id,
    establishment.name,
    establishment.location
   FROM public.establishment;


ALTER TABLE public.v_establishment OWNER TO restau;

--
-- Name: v_establismentemployee; Type: VIEW; Schema: public; Owner: restau
--

CREATE VIEW public.v_establismentemployee AS
 SELECT t0.id,
    t0.name,
    t0.nameemployee
   FROM ( SELECT establismentemployee.id,
            establishment.name,
            establismentemployee.nameemployee
           FROM (public.establismentemployee
             JOIN public.establishment ON ((establismentemployee.idestablishment = establishment.id)))) t0;


ALTER TABLE public.v_establismentemployee OWNER TO restau;

--
-- Name: v_movementtype; Type: VIEW; Schema: public; Owner: restau
--

CREATE VIEW public.v_movementtype AS
 SELECT movementtype.id,
    movementtype.type
   FROM public.movementtype;


ALTER TABLE public.v_movementtype OWNER TO restau;

--
-- Name: v_stock_last_lines; Type: VIEW; Schema: public; Owner: restau
--

CREATE VIEW public.v_stock_last_lines AS
 SELECT stockbyestablishment.id,
    stockbyestablishment.iddishes,
    stockbyestablishment.idestablishment,
    stockbyestablishment.remainingstock,
    stockbyestablishment.idmovementtype
   FROM public.stockbyestablishment
  WHERE (stockbyestablishment.id IN ( SELECT max(stockbyestablishment_1.id) AS max
           FROM public.stockbyestablishment stockbyestablishment_1
          GROUP BY stockbyestablishment_1.idestablishment, stockbyestablishment_1.iddishes));


ALTER TABLE public.v_stock_last_lines OWNER TO restau;

--
-- Name: v_stockbyestablishment; Type: VIEW; Schema: public; Owner: restau
--

CREATE VIEW public.v_stockbyestablishment AS
 SELECT t2.id,
    t2.dishesname,
    t2.name,
    t2.remainingstock,
    t2.type
   FROM ( SELECT t1.id,
            t1.dishesname,
            t1.name,
            t1.remainingstock,
            movementtype.type
           FROM (( SELECT t0.id,
                    t0.dishesname,
                    establishment.name,
                    t0.remainingstock,
                    t0.idmovementtype
                   FROM (( SELECT stockbyestablishment.id,
                            dishes.dishesname,
                            stockbyestablishment.idestablishment,
                            stockbyestablishment.remainingstock,
                            stockbyestablishment.idmovementtype
                           FROM (public.stockbyestablishment
                             JOIN public.dishes ON ((stockbyestablishment.iddishes = dishes.id)))) t0
                     JOIN public.establishment ON ((t0.idestablishment = establishment.id)))) t1
             JOIN public.movementtype ON ((t1.idmovementtype = movementtype.id)))) t2;


ALTER TABLE public.v_stockbyestablishment OWNER TO restau;

--
-- Name: v_supplier; Type: VIEW; Schema: public; Owner: restau
--

CREATE VIEW public.v_supplier AS
 SELECT supplier.id,
    supplier.namesupplier
   FROM public.supplier;


ALTER TABLE public.v_supplier OWNER TO restau;

--
-- Name: addtocart id; Type: DEFAULT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.addtocart ALTER COLUMN id SET DEFAULT nextval('public.addtocart_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: dishes id; Type: DEFAULT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.dishes ALTER COLUMN id SET DEFAULT nextval('public.dishes_id_seq'::regclass);


--
-- Name: dishesmarks id; Type: DEFAULT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.dishesmarks ALTER COLUMN id SET DEFAULT nextval('public.dishesmarks_id_seq'::regclass);


--
-- Name: dishetype id; Type: DEFAULT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.dishetype ALTER COLUMN id SET DEFAULT nextval('public.dishe_type_id_seq'::regclass);


--
-- Name: establishment id; Type: DEFAULT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.establishment ALTER COLUMN id SET DEFAULT nextval('public.establishment_id_seq'::regclass);


--
-- Name: foodorder id; Type: DEFAULT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.foodorder ALTER COLUMN id SET DEFAULT nextval('public.foodorder_id_seq'::regclass);


--
-- Name: indebtcustomers id; Type: DEFAULT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.indebtcustomers ALTER COLUMN id SET DEFAULT nextval('public.indebtcustomers_id_seq'::regclass);


--
-- Name: modeofpayment id; Type: DEFAULT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.modeofpayment ALTER COLUMN id SET DEFAULT nextval('public.modeofpayment_id_seq'::regclass);


--
-- Name: movementtype id; Type: DEFAULT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.movementtype ALTER COLUMN id SET DEFAULT nextval('public.movementtype_id_seq'::regclass);


--
-- Name: orderstate id; Type: DEFAULT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.orderstate ALTER COLUMN id SET DEFAULT nextval('public.orderstate_id_seq'::regclass);


--
-- Name: stockbyestablishment id; Type: DEFAULT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.stockbyestablishment ALTER COLUMN id SET DEFAULT nextval('public.stockbyestablishment_id_seq'::regclass);


--
-- Name: supplier id; Type: DEFAULT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.supplier ALTER COLUMN id SET DEFAULT nextval('public.supplier_id_seq'::regclass);


--
-- Data for Name: addtocart; Type: TABLE DATA; Schema: public; Owner: restau
--

COPY public.addtocart (id, iddishe, iduser, quantity) FROM stdin;
3	1	10	2
4	2	10	1
15	1	2	4
16	2	2	3
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: restau
--

COPY public.comments (id, idcustomer, comment) FROM stdin;
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: restau
--

COPY public.customers (id, firstname, name, mail, password, isactive, uniqid, idestablishment, isadmin) FROM stdin;
1	RANDRIANARISOA	Ny Avo	nyavo@gmail.com	5ad8ab788af532938c181aae339d418459f599f7d68e064cf2bbac07785bec3b	f	ETU 002580	1	f
2	007	007	007@gmail.com	629f4cf9337b0d0c76f305d860f98894cfa8c279516b425747514ca8710deb97	f	007	2	f
7	ADMIN	ADMIN	admin@gmail.com	8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918	f	ETU 0000	1	t
10	ETU 002581	ETU 002581	test2@gmail.com	60303ae22b998861bce3b28f33eec1be758a213c86c93c076dbe9f558c11c752	f	ETU 002581	1	f
\.


--
-- Data for Name: dishes; Type: TABLE DATA; Schema: public; Owner: restau
--

COPY public.dishes (id, dishesname, idsupplier, sellingprice, purchaseprice, idtype, image) FROM stdin;
1	Burger brada	1	5000.00	4000.00	4	Burger.jpg
2	Burger Kinga	2	4000.00	3000.00	1	Burger.jpg
\.


--
-- Data for Name: dishesmarks; Type: TABLE DATA; Schema: public; Owner: restau
--

COPY public.dishesmarks (id, iddishe, idcustomer, mark) FROM stdin;
\.


--
-- Data for Name: dishetype; Type: TABLE DATA; Schema: public; Owner: restau
--

COPY public.dishetype (id, libelle, image_name) FROM stdin;
1	Beverage	Beverages.jpg
2	Menu of the day	MenuOfTheDay.jpg
3	Plats exclusifs	Exclusifs.jpg
4	Goûter	Burger.jpg
\.


--
-- Data for Name: establishment; Type: TABLE DATA; Schema: public; Owner: restau
--

COPY public.establishment (id, name, location) FROM stdin;
1	ITU	Andoharanofotsy
2	ENI	Fianarantsoa
3	MISA	Ankatso
4	BICI	Andoharanofotsy
5	Ministère des finances	Faravohitra
\.


--
-- Data for Name: establismentemployee; Type: TABLE DATA; Schema: public; Owner: restau
--

COPY public.establismentemployee (id, idestablishment, nameemployee) FROM stdin;
ETU 002580	1	Ny Avo Mampandry
ETU 002581	1	Random
007	2	007
ETU 0000	1	Admin
\.


--
-- Data for Name: foodorder; Type: TABLE DATA; Schema: public; Owner: restau
--

COPY public.foodorder (id, paymenttypeid, iddishes, customerid, ordertime, disheprice, dishepurchaseprice, idaddtocart) FROM stdin;
\.


--
-- Data for Name: indebtcustomers; Type: TABLE DATA; Schema: public; Owner: restau
--

COPY public.indebtcustomers (id, idcustomer, debtamount, amountrefunded) FROM stdin;
\.


--
-- Data for Name: modeofpayment; Type: TABLE DATA; Schema: public; Owner: restau
--

COPY public.modeofpayment (id, name) FROM stdin;
1	Liquide
\.


--
-- Data for Name: movementtype; Type: TABLE DATA; Schema: public; Owner: restau
--

COPY public.movementtype (id, type) FROM stdin;
\.


--
-- Data for Name: orderstate; Type: TABLE DATA; Schema: public; Owner: restau
--

COPY public.orderstate (id, idorder, ispending) FROM stdin;
\.


--
-- Data for Name: spring_session; Type: TABLE DATA; Schema: public; Owner: restau
--

COPY public.spring_session (primary_id, session_id, creation_time, last_access_time, max_inactive_interval, expiry_time, principal_name) FROM stdin;
e6a6f491-e44c-448e-bba6-30eb5d5bb305	c8f834d1-7dcd-470d-890e-e6c1c6d13d2a	1717400348925	1717400348925	1800	1717402148925	\N
5ada6f48-da7d-4aa3-94ce-f6fc9c1052a6	cd8c2bf6-11f3-4b85-aa74-cfeb255326f7	1717400350937	1717400350937	1800	1717402150937	\N
e083f678-4bf0-4870-ac58-2a034a3760d8	7d5bd7e4-9ab1-45bd-a986-18818a43351d	1717400414835	1717400414836	1800	1717402214836	\N
8a133784-5379-40ae-99ab-3c7d1d4c5bb9	7d7b936b-115a-41ae-9dbd-22ad2819863f	1717400426395	1717400426395	1800	1717402226395	\N
193b5411-922b-4dc9-9df7-c74ba0131da7	279fd943-8eb9-429d-95b4-d49f2ac36ef1	1717400451452	1717400451452	1800	1717402251452	\N
b04e5062-2a01-482c-ad01-20ebfe0b0272	c5a3faa6-e84f-4a01-b1a2-9dda5134de4d	1717400616459	1717400616459	1800	1717402416459	\N
6ed23e4f-6432-4029-bd3f-128931a833e3	6c67f94e-0780-46cf-be61-26408d44734c	1717400619533	1717400619533	1800	1717402419533	\N
\.


--
-- Data for Name: spring_session_attributes; Type: TABLE DATA; Schema: public; Owner: restau
--

COPY public.spring_session_attributes (session_primary_id, attribute_name, attribute_bytes) FROM stdin;
e6a6f491-e44c-448e-bba6-30eb5d5bb305	message	\\xaced000574000b48656c6c6f20776f726c64
e6a6f491-e44c-448e-bba6-30eb5d5bb305	user	\\xaced00057372003e6974752e70726f6a6563742e6265657a6e6963656261636b2e61757468656e74696669636174696f6e2e6d6f64656c2e4c6f67676564437573746f6d65720cd15749a52c93be0200084a00026964490010696445737461626c697368656d656e745a000869734163746976655a0007697341646d696e4c000966697273744e616d657400124c6a6176612f6c616e672f537472696e673b4c00046d61696c71007e00014c00046e616d6571007e00014c0006756e6971496471007e00017870000000000000000200000002000074000330303774000d30303740676d61696c2e636f6d740003303037740003303037
e083f678-4bf0-4870-ac58-2a034a3760d8	message	\\xaced000574000b48656c6c6f20776f726c64
e083f678-4bf0-4870-ac58-2a034a3760d8	user	\\xaced00057372003e6974752e70726f6a6563742e6265657a6e6963656261636b2e61757468656e74696669636174696f6e2e6d6f64656c2e4c6f67676564437573746f6d65720cd15749a52c93be0200084a00026964490010696445737461626c697368656d656e745a000869734163746976655a0007697341646d696e4c000966697273744e616d657400124c6a6176612f6c616e672f537472696e673b4c00046d61696c71007e00014c00046e616d6571007e00014c0006756e6971496471007e00017870000000000000000200000002000074000330303774000d30303740676d61696c2e636f6d740003303037740003303037
193b5411-922b-4dc9-9df7-c74ba0131da7	message	\\xaced000574000b48656c6c6f20776f726c64
193b5411-922b-4dc9-9df7-c74ba0131da7	user	\\xaced00057372003e6974752e70726f6a6563742e6265657a6e6963656261636b2e61757468656e74696669636174696f6e2e6d6f64656c2e4c6f67676564437573746f6d65720cd15749a52c93be0200084a00026964490010696445737461626c697368656d656e745a000869734163746976655a0007697341646d696e4c000966697273744e616d657400124c6a6176612f6c616e672f537472696e673b4c00046d61696c71007e00014c00046e616d6571007e00014c0006756e6971496471007e00017870000000000000000200000002000074000330303774000d30303740676d61696c2e636f6d740003303037740003303037
b04e5062-2a01-482c-ad01-20ebfe0b0272	message	\\xaced000574000b48656c6c6f20776f726c64
b04e5062-2a01-482c-ad01-20ebfe0b0272	user	\\xaced00057372003e6974752e70726f6a6563742e6265657a6e6963656261636b2e61757468656e74696669636174696f6e2e6d6f64656c2e4c6f67676564437573746f6d65720cd15749a52c93be0200084a00026964490010696445737461626c697368656d656e745a000869734163746976655a0007697341646d696e4c000966697273744e616d657400124c6a6176612f6c616e672f537472696e673b4c00046d61696c71007e00014c00046e616d6571007e00014c0006756e6971496471007e00017870000000000000000200000002000074000330303774000d30303740676d61696c2e636f6d740003303037740003303037
\.


--
-- Data for Name: stockbyestablishment; Type: TABLE DATA; Schema: public; Owner: restau
--

COPY public.stockbyestablishment (id, iddishes, idestablishment, remainingstock, idmovementtype) FROM stdin;
\.


--
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: restau
--

COPY public.supplier (id, namesupplier) FROM stdin;
1	Extra-pizza
2	Dragon kinga
3	Pho resto
\.


--
-- Name: addtocart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restau
--

SELECT pg_catalog.setval('public.addtocart_id_seq', 16, true);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restau
--

SELECT pg_catalog.setval('public.comments_id_seq', 1, false);


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restau
--

SELECT pg_catalog.setval('public.customers_id_seq', 10, true);


--
-- Name: dishe_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restau
--

SELECT pg_catalog.setval('public.dishe_type_id_seq', 4, true);


--
-- Name: dishes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restau
--

SELECT pg_catalog.setval('public.dishes_id_seq', 2, true);


--
-- Name: dishesmarks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restau
--

SELECT pg_catalog.setval('public.dishesmarks_id_seq', 1, false);


--
-- Name: establishment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restau
--

SELECT pg_catalog.setval('public.establishment_id_seq', 5, true);


--
-- Name: foodorder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restau
--

SELECT pg_catalog.setval('public.foodorder_id_seq', 1, false);


--
-- Name: indebtcustomers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restau
--

SELECT pg_catalog.setval('public.indebtcustomers_id_seq', 1, false);


--
-- Name: modeofpayment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restau
--

SELECT pg_catalog.setval('public.modeofpayment_id_seq', 1, true);


--
-- Name: movementtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restau
--

SELECT pg_catalog.setval('public.movementtype_id_seq', 1, false);


--
-- Name: orderstate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restau
--

SELECT pg_catalog.setval('public.orderstate_id_seq', 1, false);


--
-- Name: stockbyestablishment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restau
--

SELECT pg_catalog.setval('public.stockbyestablishment_id_seq', 1, false);


--
-- Name: supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restau
--

SELECT pg_catalog.setval('public.supplier_id_seq', 3, true);


--
-- Name: addtocart addtocart_pkey; Type: CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.addtocart
    ADD CONSTRAINT addtocart_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: customers customers_mail_unique; Type: CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_mail_unique UNIQUE (mail);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: customers customers_uniqid_unique; Type: CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_uniqid_unique UNIQUE (uniqid);


--
-- Name: dishetype dishe_type_pkey; Type: CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.dishetype
    ADD CONSTRAINT dishe_type_pkey PRIMARY KEY (id);


--
-- Name: dishes dishes_pkey; Type: CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.dishes
    ADD CONSTRAINT dishes_pkey PRIMARY KEY (id);


--
-- Name: dishesmarks dishesmarks_pkey; Type: CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.dishesmarks
    ADD CONSTRAINT dishesmarks_pkey PRIMARY KEY (id);


--
-- Name: establishment establishment_pkey; Type: CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.establishment
    ADD CONSTRAINT establishment_pkey PRIMARY KEY (id);


--
-- Name: establismentemployee establismentemployee_pkey; Type: CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.establismentemployee
    ADD CONSTRAINT establismentemployee_pkey PRIMARY KEY (id);


--
-- Name: foodorder foodorder_pkey; Type: CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.foodorder
    ADD CONSTRAINT foodorder_pkey PRIMARY KEY (id);


--
-- Name: indebtcustomers indebtcustomers_pkey; Type: CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.indebtcustomers
    ADD CONSTRAINT indebtcustomers_pkey PRIMARY KEY (id);


--
-- Name: modeofpayment modeofpayment_pkey; Type: CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.modeofpayment
    ADD CONSTRAINT modeofpayment_pkey PRIMARY KEY (id);


--
-- Name: movementtype movementtype_pkey; Type: CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.movementtype
    ADD CONSTRAINT movementtype_pkey PRIMARY KEY (id);


--
-- Name: orderstate orderstate_pkey; Type: CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.orderstate
    ADD CONSTRAINT orderstate_pkey PRIMARY KEY (id);


--
-- Name: spring_session_attributes spring_session_attributes_pk; Type: CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.spring_session_attributes
    ADD CONSTRAINT spring_session_attributes_pk PRIMARY KEY (session_primary_id, attribute_name);


--
-- Name: spring_session spring_session_pk; Type: CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.spring_session
    ADD CONSTRAINT spring_session_pk PRIMARY KEY (primary_id);


--
-- Name: stockbyestablishment stockbyestablishment_pkey; Type: CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.stockbyestablishment
    ADD CONSTRAINT stockbyestablishment_pkey PRIMARY KEY (id);


--
-- Name: supplier supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (id);


--
-- Name: spring_session_ix1; Type: INDEX; Schema: public; Owner: restau
--

CREATE UNIQUE INDEX spring_session_ix1 ON public.spring_session USING btree (session_id);


--
-- Name: spring_session_ix2; Type: INDEX; Schema: public; Owner: restau
--

CREATE INDEX spring_session_ix2 ON public.spring_session USING btree (expiry_time);


--
-- Name: spring_session_ix3; Type: INDEX; Schema: public; Owner: restau
--

CREATE INDEX spring_session_ix3 ON public.spring_session USING btree (principal_name);


--
-- Name: addtocart addtocart_iddishe_fkey; Type: FK CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.addtocart
    ADD CONSTRAINT addtocart_iddishe_fkey FOREIGN KEY (iddishe) REFERENCES public.dishes(id);


--
-- Name: addtocart addtocart_iduser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.addtocart
    ADD CONSTRAINT addtocart_iduser_fkey FOREIGN KEY (iduser) REFERENCES public.customers(id);


--
-- Name: comments comments_idcustomer_foreign; Type: FK CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_idcustomer_foreign FOREIGN KEY (idcustomer) REFERENCES public.customers(id);


--
-- Name: customers customers_idestablishment_foreign; Type: FK CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_idestablishment_foreign FOREIGN KEY (idestablishment) REFERENCES public.establishment(id);


--
-- Name: customers customers_uniqid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_uniqid_foreign FOREIGN KEY (uniqid) REFERENCES public.establismentemployee(id);


--
-- Name: dishes dishes_idsupplier_foreign; Type: FK CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.dishes
    ADD CONSTRAINT dishes_idsupplier_foreign FOREIGN KEY (idsupplier) REFERENCES public.supplier(id);


--
-- Name: dishes dishes_idtype_foreign; Type: FK CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.dishes
    ADD CONSTRAINT dishes_idtype_foreign FOREIGN KEY (idtype) REFERENCES public.dishetype(id);


--
-- Name: dishesmarks dishesmarks_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.dishesmarks
    ADD CONSTRAINT dishesmarks_id_foreign FOREIGN KEY (id) REFERENCES public.customers(id);


--
-- Name: dishesmarks dishesmarks_iddishe_foreign; Type: FK CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.dishesmarks
    ADD CONSTRAINT dishesmarks_iddishe_foreign FOREIGN KEY (iddishe) REFERENCES public.dishes(id);


--
-- Name: establismentemployee establismentemployee_idestablishment_foreign; Type: FK CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.establismentemployee
    ADD CONSTRAINT establismentemployee_idestablishment_foreign FOREIGN KEY (idestablishment) REFERENCES public.establishment(id);


--
-- Name: foodorder foodorder___fk; Type: FK CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.foodorder
    ADD CONSTRAINT foodorder___fk FOREIGN KEY (idaddtocart) REFERENCES public.addtocart(id);


--
-- Name: foodorder foodorder_customerid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.foodorder
    ADD CONSTRAINT foodorder_customerid_foreign FOREIGN KEY (customerid) REFERENCES public.customers(id);


--
-- Name: foodorder foodorder_iddishes_foreign; Type: FK CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.foodorder
    ADD CONSTRAINT foodorder_iddishes_foreign FOREIGN KEY (iddishes) REFERENCES public.dishes(id);


--
-- Name: foodorder foodorder_paymenttypeid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.foodorder
    ADD CONSTRAINT foodorder_paymenttypeid_foreign FOREIGN KEY (paymenttypeid) REFERENCES public.modeofpayment(id);


--
-- Name: indebtcustomers indebtcustomers_idcustomer_foreign; Type: FK CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.indebtcustomers
    ADD CONSTRAINT indebtcustomers_idcustomer_foreign FOREIGN KEY (idcustomer) REFERENCES public.customers(id);


--
-- Name: orderstate orderstate_idorder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.orderstate
    ADD CONSTRAINT orderstate_idorder_foreign FOREIGN KEY (idorder) REFERENCES public.foodorder(id);


--
-- Name: spring_session_attributes spring_session_attributes_fk; Type: FK CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.spring_session_attributes
    ADD CONSTRAINT spring_session_attributes_fk FOREIGN KEY (session_primary_id) REFERENCES public.spring_session(primary_id) ON DELETE CASCADE;


--
-- Name: stockbyestablishment stockbyestablishment_iddishes_foreign; Type: FK CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.stockbyestablishment
    ADD CONSTRAINT stockbyestablishment_iddishes_foreign FOREIGN KEY (iddishes) REFERENCES public.dishes(id);


--
-- Name: stockbyestablishment stockbyestablishment_idestablishment_foreign; Type: FK CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.stockbyestablishment
    ADD CONSTRAINT stockbyestablishment_idestablishment_foreign FOREIGN KEY (idestablishment) REFERENCES public.establishment(id);


--
-- Name: stockbyestablishment stockbyestablishment_idmovementtype_foreign; Type: FK CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.stockbyestablishment
    ADD CONSTRAINT stockbyestablishment_idmovementtype_foreign FOREIGN KEY (idmovementtype) REFERENCES public.movementtype(id);


--
-- PostgreSQL database dump complete
--


-- Creating the view for current capital
CREATE VIEW public.current_capital AS
SELECT 
    COALESCE(SUM(fo.disheprice), 0) - COALESCE(SUM(fo.dishepurchaseprice), 0) - COALESCE(SUM(ic.debtamount - ic.amountrefunded), 0) AS capital
FROM 
    public.foodorder fo
LEFT JOIN 
    public.indebtcustomers ic ON fo.customerid = ic.idcustomer;

-- Optionally, set the owner of the view
ALTER VIEW public.current_capital OWNER TO restau;

