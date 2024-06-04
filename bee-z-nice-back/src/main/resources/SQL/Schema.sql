create table customers
(
    id              bigserial
        primary key,
    firstname       varchar(200) not null,
    name            varchar(250) not null,
    mail            varchar(50)  not null
        constraint customers_mail_unique
            unique,
    password        varchar(255) not null,
    isactive        boolean      not null,
    uniqid          varchar(50)  not null
        constraint customers_uniqid_unique
            unique
        constraint customers_uniqid_foreign
            references establismentemployee,
    idestablishment integer      not null
        constraint customers_idestablishment_foreign
            references establishment,
    isadmin         boolean default false
);

alter table customers
    owner to restau;

create table indebtcustomers
(
    id             serial
        primary key,
    idcustomer     bigint        not null
        constraint indebtcustomers_idcustomer_foreign
            references customers,
    debtamount     numeric(8, 2) not null,
    amountrefunded numeric(8, 2) not null
);

alter table indebtcustomers
    owner to restau;

create table comments
(
    id         bigserial
        primary key,
    idcustomer bigint not null
        constraint comments_idcustomer_foreign
            references customers,
    comment    text   not null
);

alter table comments
    owner to restau;

create table dishesmarks
(
    id         bigserial
        primary key
        constraint dishesmarks_id_foreign
            references customers,
    iddishe    integer not null
        constraint dishesmarks_iddishe_foreign
            references dishes,
    idcustomer bigint  not null,
    mark       integer not null
);

alter table dishesmarks
    owner to restau;

create table foodorder
(
    id                 bigserial
        primary key,
    paymenttypeid      integer       not null
        constraint foodorder_paymenttypeid_foreign
            references modeofpayment,
    iddishes           integer       not null
        constraint foodorder_iddishes_foreign
            references dishes,
    customerid         bigint        not null
        constraint foodorder_customerid_foreign
            references customers,
    ordertime          timestamp(0)  not null,
    disheprice         numeric(8, 2) not null,
    dishepurchaseprice numeric(8, 2) not null
);

alter table foodorder
    owner to restau;

create table orderstate
(
    id        bigserial
        primary key,
    idorder   bigint  not null
        constraint orderstate_idorder_foreign
            references foodorder,
    ispending boolean not null
);

alter table orderstate
    owner to restau;

create table spring_session
(
    primary_id            char(36) not null
        constraint spring_session_pk
            primary key,
    session_id            char(36) not null,
    creation_time         bigint   not null,
    last_access_time      bigint   not null,
    max_inactive_interval integer  not null,
    expiry_time           bigint   not null,
    principal_name        varchar(100)
);

alter table spring_session
    owner to restau;

create unique index spring_session_ix1
    on spring_session (session_id);

create index spring_session_ix2
    on spring_session (expiry_time);

create index spring_session_ix3
    on spring_session (principal_name);

create table spring_session_attributes
(
    session_primary_id char(36)     not null
        constraint spring_session_attributes_fk
            references spring_session
            on delete cascade,
    attribute_name     varchar(200) not null,
    attribute_bytes    bytea        not null,
    constraint spring_session_attributes_pk
        primary key (session_primary_id, attribute_name)
);

alter table spring_session_attributes
    owner to restau;

create table movementtype
(
    id   serial
        primary key,
    type varchar(255) not null
);

alter table movementtype
    owner to restau;

create table stockbyestablishment
(
    id              bigserial
        primary key,
    iddishes        bigint  not null
        constraint stockbyestablishment_iddishes_foreign
            references dishes,
    idestablishment bigint  not null
        constraint stockbyestablishment_idestablishment_foreign
            references establishment,
    remainingstock  bigint  not null,
    idmovementtype  integer not null
        constraint stockbyestablishment_idmovementtype_foreign
            references movementtype
);

alter table stockbyestablishment
    owner to restau;

create view v_establismentemployee(id, name, nameemployee) as
SELECT t0.id,
       t0.name,
       t0.nameemployee
FROM (SELECT establismentemployee.id,
             establishment.name,
             establismentemployee.nameemployee
      FROM establismentemployee
               JOIN establishment ON establismentemployee.idestablishment = establishment.id) t0;

alter table v_establismentemployee
    owner to restau;

create view v_establishment(id, name, location) as
SELECT establishment.id,
       establishment.name,
       establishment.location
FROM establishment;

alter table v_establishment
    owner to restau;

create view v_dishetype(id, libelle, image_name) as
SELECT dishetype.id,
       dishetype.libelle,
       dishetype.image_name
FROM dishetype;

alter table v_dishetype
    owner to restau;

create view v_dishes (id, dishesname, namesupplier, sellingprice, purchaseprice, libelle, image) as
SELECT t1.id,
       t1.dishesname,
       t1.namesupplier,
       t1.sellingprice,
       t1.purchaseprice,
       t1.libelle,
       t1.image
FROM (SELECT t0.id,
             t0.dishesname,
             t0.namesupplier,
             t0.sellingprice,
             t0.purchaseprice,
             dishetype.libelle,
             t0.image
      FROM (SELECT dishes.id,
                   dishes.dishesname,
                   supplier.namesupplier,
                   dishes.sellingprice,
                   dishes.purchaseprice,
                   dishes.idtype,
                   dishes.image
            FROM dishes
                     JOIN supplier ON dishes.idsupplier = supplier.id) t0
               JOIN dishetype ON t0.idtype = dishetype.id) t1;

alter table v_dishes
    owner to restau;

create view v_supplier(id, namesupplier) as
SELECT supplier.id,
       supplier.namesupplier
FROM supplier;

alter table v_supplier
    owner to restau;

create view v_movementtype(id, type) as
SELECT movementtype.id,
       movementtype.type
FROM movementtype;

alter table v_movementtype
    owner to restau;

create view v_stockbyestablishment(id, dishesname, name, remainingstock, type) as
SELECT t2.id,
       t2.dishesname,
       t2.name,
       t2.remainingstock,
       t2.type
FROM (SELECT t1.id,
             t1.dishesname,
             t1.name,
             t1.remainingstock,
             movementtype.type
      FROM (SELECT t0.id,
                   t0.dishesname,
                   establishment.name,
                   t0.remainingstock,
                   t0.idmovementtype
            FROM (SELECT stockbyestablishment.id,
                         dishes.dishesname,
                         stockbyestablishment.idestablishment,
                         stockbyestablishment.remainingstock,
                         stockbyestablishment.idmovementtype
                  FROM stockbyestablishment
                           JOIN dishes ON stockbyestablishment.iddishes = dishes.id) t0
                     JOIN establishment ON t0.idestablishment = establishment.id) t1
               JOIN movementtype ON t1.idmovementtype = movementtype.id) t2;

alter table v_stockbyestablishment
    owner to restau;

create view v_stock_last_lines(id, iddishes, idestablishment, remainingstock, idmovementtype) as
SELECT stockbyestablishment.id,
       stockbyestablishment.iddishes,
       stockbyestablishment.idestablishment,
       stockbyestablishment.remainingstock,
       stockbyestablishment.idmovementtype
FROM stockbyestablishment
WHERE (stockbyestablishment.id IN (SELECT max(stockbyestablishment_1.id) AS max
           FROM stockbyestablishment stockbyestablishment_1
           GROUP BY stockbyestablishment_1.idestablishment, stockbyestablishment_1.iddishes));

alter table v_stock_last_lines
    owner to restau;