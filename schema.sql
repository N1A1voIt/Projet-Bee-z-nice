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

create table dishetype
(
    id         integer default nextval('dishe_type_id_seq'::regclass) not null
        constraint dishe_type_pkey
            primary key,
    libelle    varchar(255)                                           not null,
    image_name varchar(250)                                           not null
);

alter table dishetype
    owner to restau;

create table supplier
(
    id           serial
        primary key,
    namesupplier varchar(255) not null
);

alter table supplier
    owner to restau;

create table dishes
(
    id            serial
        primary key,
    dishesname    varchar(250)  not null,
    idsupplier    integer       not null
        constraint dishes_idsupplier_foreign
            references supplier,
    sellingprice  numeric(8, 2) not null,
    purchaseprice numeric(8, 2) not null,
    idtype        integer       not null
        constraint dishes_idtype_foreign
            references dishetype,
    image         varchar(250)  not null
);

alter table dishes
    owner to restau;

create table modeofpayment
(
    id   serial
        primary key,
    name varchar(250) not null
);

alter table modeofpayment
    owner to restau;

create table establishment
(
    id       serial
        primary key,
    name     varchar(255) not null,
    location varchar(255) not null
);

alter table establishment
    owner to restau;

create table establismentemployee
(
    id              varchar(50)  not null
        primary key,
    idestablishment integer      not null
        constraint establismentemployee_idestablishment_foreign
            references establishment,
    nameemployee    varchar(255) not null
);

alter table establismentemployee
    owner to restau;

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
    movementtype    boolean not null
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


create view v_establishment(id, name, location) as
SELECT establishment.id,
       establishment.name,
       establishment.location
FROM establishment;
