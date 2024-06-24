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
-- Name: customersmoney; Type: TABLE; Schema: public; Owner: restau
--

CREATE TABLE public.customersmoney (
    id bigint NOT NULL,
    idcustomer character varying(250) NOT NULL,
    virtualamount numeric(18,2) NOT NULL
);


ALTER TABLE public.customersmoney OWNER TO restau;

--
-- Name: customersmoney_id_seq; Type: SEQUENCE; Schema: public; Owner: restau
--

CREATE SEQUENCE public.customersmoney_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customersmoney_id_seq OWNER TO restau;

--
-- Name: customersmoney_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: restau
--

ALTER SEQUENCE public.customersmoney_id_seq OWNED BY public.customersmoney.id;


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
-- Name: dishesrating; Type: TABLE; Schema: public; Owner: restau
--

CREATE TABLE public.dishesrating (
    id bigint NOT NULL,
    iddishe integer NOT NULL,
    idcustomer bigint NOT NULL,
    mark integer NOT NULL
);


ALTER TABLE public.dishesrating OWNER TO restau;

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

ALTER SEQUENCE public.dishesmarks_id_seq OWNED BY public.dishesrating.id;


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
-- Name: stockbyestablishment; Type: TABLE; Schema: public; Owner: restau
--

CREATE TABLE public.stockbyestablishment (
    id bigint NOT NULL,
    iddishes bigint NOT NULL,
    idestablishment bigint NOT NULL,
    remainingstock bigint NOT NULL,
    idmovementtype integer NOT NULL,
    movedate timestamp without time zone
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
-- Name: v_customersmoney; Type: VIEW; Schema: public; Owner: restau
--

CREATE VIEW public.v_customersmoney AS
 SELECT t0.id,
    t0.nameemployee,
    t0.virtualamount
   FROM ( SELECT customersmoney.id,
            establismentemployee.nameemployee,
            customersmoney.virtualamount
           FROM (public.customersmoney
             JOIN public.establismentemployee ON (((customersmoney.idcustomer)::text = (establismentemployee.id)::text)))) t0;


ALTER TABLE public.v_customersmoney OWNER TO restau;

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
-- Name: v_foodorder; Type: VIEW; Schema: public; Owner: restau
--

CREATE VIEW public.v_foodorder AS
 SELECT t3.id,
    t3.name,
    t3.dishesname,
    t3.mail,
    t3.ordertime,
    t3.disheprice,
    t3.dishepurchaseprice,
    t3.quantity
   FROM ( SELECT t2.id,
            t2.name,
            t2.dishesname,
            t2.mail,
            t2.ordertime,
            t2.disheprice,
            t2.dishepurchaseprice,
            addtocart.quantity
           FROM (( SELECT t1.id,
                    t1.name,
                    t1.dishesname,
                    customers.mail,
                    t1.ordertime,
                    t1.disheprice,
                    t1.dishepurchaseprice,
                    t1.idaddtocart
                   FROM (( SELECT t0.id,
                            t0.name,
                            dishes.dishesname,
                            t0.customerid,
                            t0.ordertime,
                            t0.disheprice,
                            t0.dishepurchaseprice,
                            t0.idaddtocart
                           FROM (( SELECT foodorder.id,
                                    modeofpayment.name,
                                    foodorder.iddishes,
                                    foodorder.customerid,
                                    foodorder.ordertime,
                                    foodorder.disheprice,
                                    foodorder.dishepurchaseprice,
                                    foodorder.idaddtocart
                                   FROM (public.foodorder
                                     JOIN public.modeofpayment ON ((foodorder.paymenttypeid = modeofpayment.id)))) t0
                             JOIN public.dishes ON ((t0.iddishes = dishes.id)))) t1
                     JOIN public.customers ON ((t1.customerid = customers.id)))) t2
             JOIN public.addtocart ON ((t2.idaddtocart = addtocart.id)))) t3;


ALTER TABLE public.v_foodorder OWNER TO restau;

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
    t2.establishmentname AS name,
    t2.remainingstock,
    t2.type,
    t2.movedate
   FROM ( SELECT sbe.id,
            d.dishesname,
            e.name AS establishmentname,
            sbe.remainingstock,
            sbe.movedate,
            mt.type,
            row_number() OVER (PARTITION BY sbe.idestablishment, sbe.iddishes ORDER BY sbe.movedate DESC) AS rn
           FROM (((public.stockbyestablishment sbe
             JOIN public.dishes d ON ((sbe.iddishes = d.id)))
             JOIN public.establishment e ON ((sbe.idestablishment = e.id)))
             JOIN public.movementtype mt ON ((sbe.idmovementtype = mt.id)))) t2
  WHERE (t2.rn = 1);


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
-- Name: v_supplier_dish_sales; Type: VIEW; Schema: public; Owner: restau
--

CREATE VIEW public.v_supplier_dish_sales AS
 SELECT d.idsupplier,
    s.namesupplier,
    count(*) AS dishes_sold,
    sum(f.disheprice) AS total_revenue
   FROM ((public.foodorder f
     JOIN public.dishes d ON ((f.iddishes = d.id)))
     JOIN public.supplier s ON ((d.idsupplier = s.id)))
  GROUP BY d.idsupplier, s.namesupplier;


ALTER TABLE public.v_supplier_dish_sales OWNER TO restau;

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
-- Name: customersmoney id; Type: DEFAULT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.customersmoney ALTER COLUMN id SET DEFAULT nextval('public.customersmoney_id_seq'::regclass);


--
-- Name: dishes id; Type: DEFAULT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.dishes ALTER COLUMN id SET DEFAULT nextval('public.dishes_id_seq'::regclass);


--
-- Name: dishesrating id; Type: DEFAULT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.dishesrating ALTER COLUMN id SET DEFAULT nextval('public.dishesmarks_id_seq'::regclass);


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
41	1	2	3
42	2	2	4
43	2	2	3
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
-- Data for Name: customersmoney; Type: TABLE DATA; Schema: public; Owner: restau
--

COPY public.customersmoney (id, idcustomer, virtualamount) FROM stdin;
1	ETU 002580	1000000.00
2	007	1000000.00
\.


--
-- Data for Name: dishes; Type: TABLE DATA; Schema: public; Owner: restau
--

COPY public.dishes (id, dishesname, idsupplier, sellingprice, purchaseprice, idtype, image) FROM stdin;
1	Burger brada	1	5000.00	4000.00	4	Burger.jpg
2	Burger Kinga	2	4000.00	3000.00	1	Burger.jpg
3	Côte pané	3	10000.00	9000.00	3	Exclusifs.jpg
\.


--
-- Data for Name: dishesrating; Type: TABLE DATA; Schema: public; Owner: restau
--

COPY public.dishesrating (id, iddishe, idcustomer, mark) FROM stdin;
35	2	2	3
37	1	2	2
38	1	2	5
39	1	2	2
40	3	2	2
41	3	2	3
42	3	2	4
36	1	2	2
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
123	1	1	2	2024-06-24 22:47:27	5000.00	4000.00	41
124	1	1	2	2024-06-24 22:47:27	5000.00	4000.00	41
125	1	1	2	2024-06-24 22:47:27	5000.00	4000.00	41
126	1	2	2	2024-06-24 22:52:20	4000.00	3000.00	42
127	1	2	2	2024-06-24 22:52:20	4000.00	3000.00	42
128	1	2	2	2024-06-24 22:52:20	4000.00	3000.00	42
129	1	2	2	2024-06-24 22:52:20	4000.00	3000.00	42
130	1	2	2	2024-06-24 22:59:30	4000.00	3000.00	43
131	1	2	2	2024-06-24 22:59:30	4000.00	3000.00	43
132	1	2	2	2024-06-24 22:59:30	4000.00	3000.00	43
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
2	Sortie
1	Entrée
\.


--
-- Data for Name: orderstate; Type: TABLE DATA; Schema: public; Owner: restau
--

COPY public.orderstate (id, idorder, ispending) FROM stdin;
\.


--
-- Data for Name: stockbyestablishment; Type: TABLE DATA; Schema: public; Owner: restau
--

COPY public.stockbyestablishment (id, iddishes, idestablishment, remainingstock, idmovementtype, movedate) FROM stdin;
61	2	1	100	1	2024-06-24 22:29:00
62	3	1	100	1	2024-06-24 22:29:00
63	1	1	100	1	2024-06-24 22:29:00
64	2	2	100	1	2024-06-24 22:29:00
65	3	2	100	1	2024-06-24 22:29:00
66	1	2	100	1	2024-06-24 22:29:00
68	1	2	97	2	2024-06-24 22:47:27.196
70	2	2	96	2	2024-06-24 22:52:20.463
72	2	2	93	2	2024-06-24 22:59:30.212127
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

SELECT pg_catalog.setval('public.addtocart_id_seq', 43, true);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restau
--

SELECT pg_catalog.setval('public.comments_id_seq', 1, false);


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restau
--

SELECT pg_catalog.setval('public.customers_id_seq', 10, true);


--
-- Name: customersmoney_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restau
--

SELECT pg_catalog.setval('public.customersmoney_id_seq', 2, true);


--
-- Name: dishe_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restau
--

SELECT pg_catalog.setval('public.dishe_type_id_seq', 4, true);


--
-- Name: dishes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restau
--

SELECT pg_catalog.setval('public.dishes_id_seq', 3, true);


--
-- Name: dishesmarks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restau
--

SELECT pg_catalog.setval('public.dishesmarks_id_seq', 42, true);


--
-- Name: establishment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restau
--

SELECT pg_catalog.setval('public.establishment_id_seq', 5, true);


--
-- Name: foodorder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restau
--

SELECT pg_catalog.setval('public.foodorder_id_seq', 132, true);


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

SELECT pg_catalog.setval('public.movementtype_id_seq', 2, true);


--
-- Name: orderstate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restau
--

SELECT pg_catalog.setval('public.orderstate_id_seq', 1, false);


--
-- Name: stockbyestablishment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restau
--

SELECT pg_catalog.setval('public.stockbyestablishment_id_seq', 72, true);


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
-- Name: customersmoney customersmoney_pkey; Type: CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.customersmoney
    ADD CONSTRAINT customersmoney_pkey PRIMARY KEY (id);


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
-- Name: dishesrating dishesmarks_pkey; Type: CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.dishesrating
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
-- Name: customersmoney customersmoney_idcustomer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.customersmoney
    ADD CONSTRAINT customersmoney_idcustomer_fkey FOREIGN KEY (idcustomer) REFERENCES public.establismentemployee(id);


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
-- Name: dishesrating dishesmarks_iddishe_foreign; Type: FK CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.dishesrating
    ADD CONSTRAINT dishesmarks_iddishe_foreign FOREIGN KEY (iddishe) REFERENCES public.dishes(id);


--
-- Name: dishesrating dishesrating_idcustomer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.dishesrating
    ADD CONSTRAINT dishesrating_idcustomer_fkey FOREIGN KEY (idcustomer) REFERENCES public.customers(id);


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

