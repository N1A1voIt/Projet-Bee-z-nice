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
    virtualamount numeric(18,2) NOT NULL,
    datedeposit timestamp without time zone DEFAULT now() NOT NULL
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
-- Name: customersquery; Type: TABLE; Schema: public; Owner: restau
--

CREATE TABLE public.customersquery (
    id bigint NOT NULL,
    idcustomer character varying(250) NOT NULL,
    virtualamount numeric(18,2) NOT NULL,
    ispending boolean NOT NULL,
    daterequest timestamp without time zone DEFAULT '2024-05-02 00:00:00'::timestamp without time zone NOT NULL
);


ALTER TABLE public.customersquery OWNER TO restau;

--
-- Name: customersquery_id_seq; Type: SEQUENCE; Schema: public; Owner: restau
--

CREATE SEQUENCE public.customersquery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customersquery_id_seq OWNER TO restau;

--
-- Name: customersquery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: restau
--

ALTER SEQUENCE public.customersquery_id_seq OWNED BY public.customersquery.id;


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
-- Name: supplierpayment; Type: TABLE; Schema: public; Owner: restau
--

CREATE TABLE public.supplierpayment (
    id bigint NOT NULL,
    "time" timestamp without time zone,
    idunpayedstock bigint
);


ALTER TABLE public.supplierpayment OWNER TO restau;

--
-- Name: supplierpayment_id_seq; Type: SEQUENCE; Schema: public; Owner: restau
--

CREATE SEQUENCE public.supplierpayment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supplierpayment_id_seq OWNER TO restau;

--
-- Name: supplierpayment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: restau
--

ALTER SEQUENCE public.supplierpayment_id_seq OWNED BY public.supplierpayment.id;


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
    t0.virtualamount,
    t0.datedeposit
   FROM ( SELECT customersmoney.id,
            establismentemployee.nameemployee,
            customersmoney.virtualamount,
            customersmoney.datedeposit
           FROM (public.customersmoney
             JOIN public.establismentemployee ON (((customersmoney.idcustomer)::text = (establismentemployee.id)::text)))) t0;


ALTER TABLE public.v_customersmoney OWNER TO restau;

--
-- Name: v_customersquery; Type: VIEW; Schema: public; Owner: restau
--

CREATE VIEW public.v_customersquery AS
 SELECT t0.id,
    t0.nameemployee,
    t0.virtualamount,
    t0.ispending
   FROM ( SELECT customersquery.id,
            establismentemployee.nameemployee,
            customersquery.virtualamount,
            customersquery.ispending
           FROM (public.customersquery
             JOIN public.establismentemployee ON (((customersquery.idcustomer)::text = (establismentemployee.id)::text)))) t0;


ALTER TABLE public.v_customersquery OWNER TO restau;

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
-- Name: v_stock_per_establishment; Type: VIEW; Schema: public; Owner: restau
--

CREATE VIEW public.v_stock_per_establishment AS
 SELECT row_number() OVER () AS id,
    dishesyear.idsupplier,
    dishesyear.month,
    dishesyear.year,
    sum(dishesyear.purchaseprice) AS amount
   FROM ( SELECT date_part('month'::text, stock.movedate) AS month,
            date_part('year'::text, stock.movedate) AS year,
            dish.idsupplier,
            dish.purchaseprice
           FROM (public.stockbyestablishment stock
             JOIN public.dishes dish ON ((stock.iddishes = dish.id)))
          WHERE ((stock.movedate < date_trunc('month'::text, (CURRENT_DATE)::timestamp with time zone)) AND (stock.idmovementtype = 1))) dishesyear
  GROUP BY dishesyear.month, dishesyear.idsupplier, dishesyear.year;


ALTER TABLE public.v_stock_per_establishment OWNER TO restau;

--
-- Name: v_stockbyestablishment; Type: VIEW; Schema: public; Owner: restau
--

CREATE VIEW public.v_stockbyestablishment AS
 SELECT stockbyestablishment.id,
    dishes.dishesname,
    establishment.name,
    stockbyestablishment.remainingstock,
    movementtype.type,
    stockbyestablishment.movedate
   FROM (((public.stockbyestablishment
     LEFT JOIN public.dishes ON ((stockbyestablishment.iddishes = dishes.id)))
     LEFT JOIN public.establishment ON ((stockbyestablishment.idestablishment = establishment.id)))
     LEFT JOIN public.movementtype ON ((stockbyestablishment.idmovementtype = movementtype.id)));


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
-- Name: v_top3_dishesrating; Type: VIEW; Schema: public; Owner: restau
--

CREATE VIEW public.v_top3_dishesrating AS
SELECT
    NULL::integer AS id,
    NULL::character varying(250) AS dishesname,
    NULL::integer AS idsupplier,
    NULL::numeric(8,2) AS sellingprice,
    NULL::numeric(8,2) AS purchaseprice,
    NULL::integer AS idtype,
    NULL::character varying(250) AS image,
    NULL::numeric AS avg_mark;


ALTER TABLE public.v_top3_dishesrating OWNER TO restau;

--
-- Name: v_unpayed_stock; Type: VIEW; Schema: public; Owner: restau
--

CREATE VIEW public.v_unpayed_stock AS
 SELECT spe.id,
    spe.idsupplier,
    sup.namesupplier,
    spe.month,
    spe.year,
    spe.amount
   FROM (public.v_stock_per_establishment spe
     JOIN public.supplier sup ON ((spe.idsupplier = sup.id)))
  WHERE (NOT (spe.id IN ( SELECT supplierpayment.idunpayedstock
           FROM public.supplierpayment)));


ALTER TABLE public.v_unpayed_stock OWNER TO restau;

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
-- Name: customersquery id; Type: DEFAULT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.customersquery ALTER COLUMN id SET DEFAULT nextval('public.customersquery_id_seq'::regclass);


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
-- Name: supplierpayment id; Type: DEFAULT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.supplierpayment ALTER COLUMN id SET DEFAULT nextval('public.supplierpayment_id_seq'::regclass);


--
-- Data for Name: addtocart; Type: TABLE DATA; Schema: public; Owner: restau
--

COPY public.addtocart (id, iddishe, iduser, quantity) FROM stdin;
52	8	2	3
53	1	2	3
54	10	2	3
55	7	2	4
56	3	2	4
57	3	1	3
58	7	1	3
59	11	1	2
60	3	1	3
61	1	2	3
62	7	2	2
63	11	11	4
64	7	11	2
66	8	11	1
67	3	12	2
68	10	12	2
69	7	12	1
70	12	12	1
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
11	Barry	Allen	barry@gmail.com	5a9cea259640cac7ec4428c3d584606845c2cb0d6c353252c6487b2cc0be6653	f	123	3	f
12	Mendrika	Mendrika	mendrika@gmail.com	92ba43dd57ab9b257b65c79b0c7fa5b183af1817bed6dc405129d1423ecf9a38	f	EMP005	4	f
\.


--
-- Data for Name: customersmoney; Type: TABLE DATA; Schema: public; Owner: restau
--

COPY public.customersmoney (id, idcustomer, virtualamount, datedeposit) FROM stdin;
1	ETU 002580	1000000.00	2024-06-25 15:39:28.776876
2	007	1000000.00	2024-06-25 15:39:28.776876
3	007	100000.00	2024-06-25 15:39:28.776876
4	007	1234.00	2024-06-26 08:35:57.541
5	007	1233.00	2024-06-26 08:39:43.814
6	007	123.00	2024-06-26 08:40:45.641
7	007	123.00	2024-06-26 08:42:40.508
8	007	212.00	2024-06-26 08:47:00.249
9	007	144.00	2024-06-21 12:34:00
10	007	2000.00	2024-06-26 14:06:52.43
11	007	100000.00	2024-04-24 14:10:00
12	007	200000.00	2024-05-03 14:16:00
13	ETU 002580	20000.00	2024-04-26 14:28:00
14	ETU 002580	10000.00	2024-04-26 14:28:00
15	ETU 002580	90000.00	2024-05-11 14:29:00
16	123	100000.00	2024-04-30 15:35:00
17	EMP005	100000.00	2024-04-30 16:05:00
\.


--
-- Data for Name: customersquery; Type: TABLE DATA; Schema: public; Owner: restau
--

COPY public.customersquery (id, idcustomer, virtualamount, ispending, daterequest) FROM stdin;
3	007	1234.00	f	2024-05-02 00:00:00
15	007	1233.00	f	2024-06-26 08:39:41.241
16	007	123.00	f	2024-06-26 08:40:42.74
17	007	123.00	f	2024-06-26 08:42:24.204
18	007	212.00	f	2024-06-26 08:45:51.767
19	007	144.00	f	2024-06-01 12:02:00
20	007	100.00	t	2024-06-25 12:34:00
21	007	2000.00	f	2024-06-26 14:06:00
22	007	100000.00	f	2024-04-10 14:09:00
23	007	200000.00	f	2024-05-02 14:16:00
24	ETU 002580	20000.00	f	2024-04-26 14:27:00
25	ETU 002580	10000.00	f	2024-04-26 14:27:00
26	ETU 002580	90000.00	f	2024-05-10 14:29:00
27	123	100000.00	f	2024-04-30 15:35:00
28	EMP005	100000.00	f	2024-04-30 16:05:00
\.


--
-- Data for Name: dishes; Type: TABLE DATA; Schema: public; Owner: restau
--

COPY public.dishes (id, dishesname, idsupplier, sellingprice, purchaseprice, idtype, image) FROM stdin;
1	Burger brada	1	5000.00	4000.00	4	Burger.jpg
2	Burger Kinga	2	4000.00	3000.00	1	Burger.jpg
3	Côte pané	3	10000.00	9000.00	3	Exclusifs.jpg
7	Steak du chef	3	12000.00	10000.00	2	2cca8425-4966-4316-b5c8-8cdb0d69d3ad.jpg
8	Steak iréel	2	12000.00	10000.00	3	2e1c114d-9aa4-4609-8b8d-eb35a2e0b359.jpg
9	Tasty tacos	1	12000.00	10000.00	4	ai-generated-8805645_640.png
10	Jus d'orange	1	5000.00	4000.00	1	freepik-export-20240626044338HBPy.jpeg
11	Cocktail d'été	3	12000.00	10000.00	1	infused-water.png
12	Amusons-nous	2	12000.00	10000.00	1	freepik-export-20240626044516cvvO.jpeg
\.


--
-- Data for Name: dishesrating; Type: TABLE DATA; Schema: public; Owner: restau
--

COPY public.dishesrating (id, iddishe, idcustomer, mark) FROM stdin;
48	2	2	3
47	1	2	2
49	8	2	5
\.


--
-- Data for Name: dishetype; Type: TABLE DATA; Schema: public; Owner: restau
--

COPY public.dishetype (id, libelle, image_name) FROM stdin;
3	Plats exclusifs	Exclusifs.jpg
4	Goûter	Burger.jpg
1	Boissons	Beverages.jpg
2	Menu du jour	MenuOfTheDay.jpg
\.


--
-- Data for Name: establishment; Type: TABLE DATA; Schema: public; Owner: restau
--

COPY public.establishment (id, name, location) FROM stdin;
1	ITU	Andoharanofotsy
2	ENI	Fianarantsoa
3	MISA	Ankatso
4	E-Tech	E-Tech
5	HRS	Faravohitra
\.


--
-- Data for Name: establismentemployee; Type: TABLE DATA; Schema: public; Owner: restau
--

COPY public.establismentemployee (id, idestablishment, nameemployee) FROM stdin;
ETU 002580	1	Ny Avo Mampandry
ETU 002581	1	Random
007	2	007
ETU 0000	1	Admin
123	3	Barry
EMP005	4	Mendrika
\.


--
-- Data for Name: foodorder; Type: TABLE DATA; Schema: public; Owner: restau
--

COPY public.foodorder (id, paymenttypeid, iddishes, customerid, ordertime, disheprice, dishepurchaseprice, idaddtocart) FROM stdin;
160	1	8	2	2024-04-26 14:10:00	12000.00	10000.00	52
161	1	8	2	2024-04-26 14:10:00	12000.00	10000.00	52
162	1	8	2	2024-04-26 14:10:00	12000.00	10000.00	52
163	1	1	2	2024-04-27 14:13:00	5000.00	4000.00	53
164	1	1	2	2024-04-27 14:13:00	5000.00	4000.00	53
165	1	1	2	2024-04-27 14:13:00	5000.00	4000.00	53
166	1	10	2	2024-04-30 14:14:00	5000.00	4000.00	54
167	1	10	2	2024-04-30 14:14:00	5000.00	4000.00	54
168	1	10	2	2024-04-30 14:14:00	5000.00	4000.00	54
169	1	3	2	2024-05-03 14:17:00	10000.00	9000.00	56
170	1	3	2	2024-05-03 14:17:00	10000.00	9000.00	56
171	1	3	2	2024-05-03 14:17:00	10000.00	9000.00	56
172	1	3	2	2024-05-03 14:17:00	10000.00	9000.00	56
173	1	7	2	2024-05-03 14:17:00	12000.00	10000.00	55
174	1	7	2	2024-05-03 14:17:00	12000.00	10000.00	55
175	1	7	2	2024-05-03 14:17:00	12000.00	10000.00	55
176	1	7	2	2024-05-03 14:17:00	12000.00	10000.00	55
177	1	3	1	2024-05-02 14:28:00	10000.00	9000.00	57
178	1	3	1	2024-05-02 14:28:00	10000.00	9000.00	57
179	1	3	1	2024-05-02 14:28:00	10000.00	9000.00	57
180	1	7	1	2024-05-12 14:44:00	12000.00	10000.00	58
181	1	7	1	2024-05-12 14:44:00	12000.00	10000.00	58
182	1	7	1	2024-05-12 14:44:00	12000.00	10000.00	58
183	1	11	1	2024-05-12 14:44:00	12000.00	10000.00	59
184	1	11	1	2024-05-12 14:44:00	12000.00	10000.00	59
185	1	3	1	2024-05-12 14:44:00	10000.00	9000.00	60
186	1	3	1	2024-05-12 14:44:00	10000.00	9000.00	60
187	1	3	1	2024-05-12 14:44:00	10000.00	9000.00	60
188	1	1	2	2024-05-10 15:20:00	5000.00	4000.00	61
189	1	1	2	2024-05-10 15:20:00	5000.00	4000.00	61
190	1	1	2	2024-05-10 15:20:00	5000.00	4000.00	61
191	1	7	2	2024-05-10 15:23:00	12000.00	10000.00	62
192	1	7	2	2024-05-10 15:23:00	12000.00	10000.00	62
193	1	11	11	2024-04-30 15:35:00	12000.00	10000.00	63
194	1	11	11	2024-04-30 15:35:00	12000.00	10000.00	63
195	1	11	11	2024-04-30 15:35:00	12000.00	10000.00	63
196	1	11	11	2024-04-30 15:35:00	12000.00	10000.00	63
197	1	7	11	2024-05-02 15:36:00	12000.00	10000.00	64
198	1	7	11	2024-05-02 15:36:00	12000.00	10000.00	64
199	1	8	11	2024-05-12 16:02:00	12000.00	10000.00	66
200	1	3	12	2024-05-01 16:06:00	10000.00	9000.00	67
201	1	3	12	2024-05-01 16:06:00	10000.00	9000.00	67
202	1	10	12	2024-05-02 16:06:00	5000.00	4000.00	68
203	1	10	12	2024-05-02 16:06:00	5000.00	4000.00	68
204	1	7	12	2024-05-04 16:06:00	12000.00	10000.00	69
205	1	12	12	2024-05-04 16:06:00	12000.00	10000.00	70
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
80	8	1	100	1	2024-04-26 09:59:00
81	8	2	100	1	2024-04-26 09:59:00
82	8	3	100	1	2024-04-26 09:59:00
83	8	4	100	1	2024-04-26 09:59:00
84	8	5	100	1	2024-04-26 09:59:00
85	3	1	100	1	2024-04-26 09:59:00
86	3	2	100	1	2024-04-26 09:59:00
87	3	3	100	1	2024-04-26 09:59:00
88	3	4	100	1	2024-04-26 09:59:00
89	3	5	100	1	2024-04-26 09:59:00
90	9	1	100	1	2024-04-26 09:59:00
91	9	2	100	1	2024-04-26 09:59:00
92	9	3	100	1	2024-04-26 09:59:00
93	9	4	100	1	2024-04-26 09:59:00
94	9	5	100	1	2024-04-26 09:59:00
95	1	1	100	1	2024-04-26 09:59:00
96	1	2	100	1	2024-04-26 09:59:00
97	1	3	100	1	2024-04-26 09:59:00
98	1	4	100	1	2024-04-26 09:59:00
99	1	5	100	1	2024-04-26 09:59:00
100	1	1	100	1	2024-04-26 09:59:00
101	1	2	100	1	2024-04-26 09:59:00
102	1	3	100	1	2024-04-26 09:59:00
103	1	4	100	1	2024-04-26 09:59:00
104	1	5	100	1	2024-04-26 09:59:00
105	12	1	100	1	2024-04-26 09:59:00
106	12	2	100	1	2024-04-26 09:59:00
107	12	3	100	1	2024-04-26 09:59:00
108	12	4	100	1	2024-04-26 09:59:00
109	12	5	100	1	2024-04-26 09:59:00
110	11	1	100	1	2024-04-26 09:59:00
111	11	2	100	1	2024-04-26 09:59:00
112	11	3	100	1	2024-04-26 09:59:00
113	11	4	100	1	2024-04-26 09:59:00
114	11	5	100	1	2024-04-26 09:59:00
115	10	1	100	1	2024-04-26 09:59:00
116	10	2	100	1	2024-04-26 09:59:00
117	10	3	100	1	2024-04-26 09:59:00
118	10	4	100	1	2024-04-26 09:59:00
119	10	5	100	1	2024-04-26 09:59:00
120	2	1	100	1	2024-04-26 09:59:00
121	2	2	100	1	2024-04-26 09:59:00
122	2	3	100	1	2024-04-26 09:59:00
123	2	4	100	1	2024-04-26 09:59:00
124	2	5	100	1	2024-04-26 09:59:00
125	7	2	100	1	2024-04-26 09:59:00
126	7	3	100	1	2024-04-26 09:59:00
127	7	4	100	1	2024-04-26 09:59:00
128	7	5	100	1	2024-04-26 09:59:00
129	8	2	97	2	2024-04-26 14:10:00
130	1	2	97	2	2024-04-27 14:13:00
131	10	2	97	2	2024-04-30 14:14:00
132	3	2	96	2	2024-05-03 14:17:00
133	7	2	96	2	2024-05-03 14:17:00
134	3	1	97	2	2024-05-02 14:28:00
139	7	1	100	1	2024-05-12 14:43:00
140	7	1	97	2	2024-05-12 14:44:00
141	11	1	98	2	2024-05-12 14:44:00
142	3	1	94	2	2024-05-12 14:44:00
143	1	2	94	2	2024-05-10 15:20:00
144	12	1	90	2	2024-05-01 01:01:00
145	7	2	94	2	2024-05-10 15:23:00
146	8	1	90	2	2024-05-11 15:27:00
147	11	3	96	2	2024-04-30 15:35:00
148	7	3	98	2	2024-05-02 15:36:00
149	8	3	99	2	2024-05-12 16:02:00
150	3	4	98	2	2024-05-01 16:06:00
151	10	4	98	2	2024-05-02 16:06:00
152	7	4	99	2	2024-05-04 16:06:00
153	12	4	99	2	2024-05-04 16:06:00
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
-- Data for Name: supplierpayment; Type: TABLE DATA; Schema: public; Owner: restau
--

COPY public.supplierpayment (id, "time", idunpayedstock) FROM stdin;
1	2024-05-06 00:00:00	1
2	2024-06-26 12:57:40.875456	3
3	2024-06-26 13:08:21.201238	2
\.


--
-- Name: addtocart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restau
--

SELECT pg_catalog.setval('public.addtocart_id_seq', 70, true);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restau
--

SELECT pg_catalog.setval('public.comments_id_seq', 1, false);


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restau
--

SELECT pg_catalog.setval('public.customers_id_seq', 12, true);


--
-- Name: customersmoney_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restau
--

SELECT pg_catalog.setval('public.customersmoney_id_seq', 17, true);


--
-- Name: customersquery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restau
--

SELECT pg_catalog.setval('public.customersquery_id_seq', 28, true);


--
-- Name: dishe_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restau
--

SELECT pg_catalog.setval('public.dishe_type_id_seq', 4, true);


--
-- Name: dishes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restau
--

SELECT pg_catalog.setval('public.dishes_id_seq', 12, true);


--
-- Name: dishesmarks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restau
--

SELECT pg_catalog.setval('public.dishesmarks_id_seq', 49, true);


--
-- Name: establishment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restau
--

SELECT pg_catalog.setval('public.establishment_id_seq', 5, true);


--
-- Name: foodorder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restau
--

SELECT pg_catalog.setval('public.foodorder_id_seq', 205, true);


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

SELECT pg_catalog.setval('public.stockbyestablishment_id_seq', 153, true);


--
-- Name: supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restau
--

SELECT pg_catalog.setval('public.supplier_id_seq', 3, true);


--
-- Name: supplierpayment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restau
--

SELECT pg_catalog.setval('public.supplierpayment_id_seq', 3, true);


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
-- Name: customersquery customersquery_pkey; Type: CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.customersquery
    ADD CONSTRAINT customersquery_pkey PRIMARY KEY (id);


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
-- Name: supplierpayment supplierpayment_pkey; Type: CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.supplierpayment
    ADD CONSTRAINT supplierpayment_pkey PRIMARY KEY (id);


--
-- Name: v_top3_dishesrating _RETURN; Type: RULE; Schema: public; Owner: restau
--

CREATE OR REPLACE VIEW public.v_top3_dishesrating AS
 SELECT dishes.id,
    dishes.dishesname,
    dishes.idsupplier,
    dishes.sellingprice,
    dishes.purchaseprice,
    dishes.idtype,
    dishes.image,
    COALESCE((avg(dishesrating.mark))::numeric(3,2), (0)::numeric) AS avg_mark
   FROM (public.dishes
     LEFT JOIN public.dishesrating ON ((dishes.id = dishesrating.iddishe)))
  GROUP BY dishes.id
  ORDER BY COALESCE((avg(dishesrating.mark))::numeric(3,2), (0)::numeric) DESC
 LIMIT 3;


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
-- Name: customersquery customersquery_idcustomer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: restau
--

ALTER TABLE ONLY public.customersquery
    ADD CONSTRAINT customersquery_idcustomer_fkey FOREIGN KEY (idcustomer) REFERENCES public.establismentemployee(id);


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

