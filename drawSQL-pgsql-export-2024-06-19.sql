CREATE TABLE "dishe_type"(
    "id" SERIAL NOT NULL,
    "libelle" VARCHAR(255) NOT NULL,
    "image_name" VARCHAR(250) NOT NULL
);
ALTER TABLE
    "dishe_type" ADD PRIMARY KEY("id");
CREATE TABLE "supplier"(
    "id" SERIAL NOT NULL,
    "nameSupplier" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "supplier" ADD PRIMARY KEY("id");
CREATE TABLE "inDebtCustomers"(
    "id" SERIAL NOT NULL,
    "idCustomer" BIGINT NOT NULL,
    "debtAmount" DECIMAL(8, 2) NOT NULL,
    "amountRefunded" DECIMAL(8, 2) NOT NULL
);
ALTER TABLE
    "inDebtCustomers" ADD PRIMARY KEY("id");
CREATE TABLE "customers"(
    "id" bigserial NOT NULL,
    "firstname" VARCHAR(200) NOT NULL,
    "name" VARCHAR(250) NOT NULL,
    "mail" VARCHAR(50) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "isActive" BOOLEAN NOT NULL,
    "uniqId" VARCHAR(50) NOT NULL,
    "idEstablishment" INTEGER NOT NULL,
    "isadmin" BOOLEAN NOT NULL DEFAULT '0'
);
ALTER TABLE
    "customers" ADD PRIMARY KEY("id");
ALTER TABLE
    "customers" ADD CONSTRAINT "customers_mail_unique" UNIQUE("mail");
ALTER TABLE
    "customers" ADD CONSTRAINT "customers_uniqid_unique" UNIQUE("uniqId");
CREATE TABLE "establismentEmployee"(
    "id" VARCHAR(50) NOT NULL,
    "idEstablishment" INTEGER NOT NULL,
    "nameEmployee" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "establismentEmployee" ADD PRIMARY KEY("id");
CREATE TABLE "dishes"(
    "id" SERIAL NOT NULL,
    "dishesName" VARCHAR(250) NOT NULL,
    "idSupplier" INTEGER NOT NULL,
    "sellingPrice" DECIMAL(8, 2) NOT NULL,
    "purchasePrice" DECIMAL(8, 2) NOT NULL,
    "idType" INTEGER NOT NULL,
    "image" VARCHAR(250) NOT NULL
);
ALTER TABLE
    "dishes" ADD PRIMARY KEY("id");
CREATE TABLE "comments"(
    "id" bigserial NOT NULL,
    "idCustomer" BIGINT NOT NULL,
    "comment" TEXT NOT NULL
);
ALTER TABLE
    "comments" ADD PRIMARY KEY("id");
CREATE TABLE "dishesMarks"(
    "id" bigserial NOT NULL,
    "idDishe" INTEGER NOT NULL,
    "idCustomer" BIGINT NOT NULL,
    "mark" INTEGER NOT NULL
);
ALTER TABLE
    "dishesMarks" ADD PRIMARY KEY("id");
CREATE TABLE "modeOfPayment"(
    "id" SERIAL NOT NULL,
    "name" VARCHAR(250) NOT NULL
);
ALTER TABLE
    "modeOfPayment" ADD PRIMARY KEY("id");
CREATE TABLE "movementType"(
    "id" SERIAL NOT NULL,
    "type" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "movementType" ADD PRIMARY KEY("id");
CREATE TABLE "establishment"(
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "location" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "establishment" ADD PRIMARY KEY("id");
CREATE TABLE "foodOrder"(
    "id" bigserial NOT NULL,
    "paymentTypeId" INTEGER NOT NULL,
    "idDishes" INTEGER NOT NULL,
    "customerId" BIGINT NOT NULL,
    "orderTime" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "dishePrice" DECIMAL(8, 2) NOT NULL,
    "dishePurchasePrice" DECIMAL(8, 2) NOT NULL
);
ALTER TABLE
    "foodOrder" ADD PRIMARY KEY("id");
CREATE TABLE "orderState"(
    "id" bigserial NOT NULL,
    "idOrder" BIGINT NOT NULL,
    "isPending" BOOLEAN NOT NULL
);
ALTER TABLE
    "orderState" ADD PRIMARY KEY("id");
CREATE TABLE "stockByEstablishment"(
    "id" bigserial NOT NULL,
    "idDishes" BIGINT NOT NULL,
    "idEstablishment" BIGINT NOT NULL,
    "remainingStock" BIGINT NOT NULL,
    "idMovementType" INTEGER NOT NULL
);
ALTER TABLE
    "stockByEstablishment" ADD PRIMARY KEY("id");
ALTER TABLE
    "dishesMarks" ADD CONSTRAINT "dishesmarks_iddishe_foreign" FOREIGN KEY("idDishe") REFERENCES "dishes"("id");
ALTER TABLE
    "dishes" ADD CONSTRAINT "dishes_idtype_foreign" FOREIGN KEY("idType") REFERENCES "dishe_type"("id");
ALTER TABLE
    "foodOrder" ADD CONSTRAINT "foodorder_iddishes_foreign" FOREIGN KEY("idDishes") REFERENCES "dishes"("id");
ALTER TABLE
    "orderState" ADD CONSTRAINT "orderstate_idorder_foreign" FOREIGN KEY("idOrder") REFERENCES "foodOrder"("id");
ALTER TABLE
    "dishes" ADD CONSTRAINT "dishes_idsupplier_foreign" FOREIGN KEY("idSupplier") REFERENCES "supplier"("id");
ALTER TABLE
    "inDebtCustomers" ADD CONSTRAINT "indebtcustomers_idcustomer_foreign" FOREIGN KEY("idCustomer") REFERENCES "customers"("id");
ALTER TABLE
    "foodOrder" ADD CONSTRAINT "foodorder_customerid_foreign" FOREIGN KEY("customerId") REFERENCES "customers"("id");
ALTER TABLE
    "customers" ADD CONSTRAINT "customers_uniqid_foreign" FOREIGN KEY("uniqId") REFERENCES "establismentEmployee"("id");
ALTER TABLE
    "establismentEmployee" ADD CONSTRAINT "establismentemployee_idestablishment_foreign" FOREIGN KEY("idEstablishment") REFERENCES "establishment"("id");
ALTER TABLE
    "comments" ADD CONSTRAINT "comments_idcustomer_foreign" FOREIGN KEY("idCustomer") REFERENCES "customers"("id");
ALTER TABLE
    "stockByEstablishment" ADD CONSTRAINT "stockbyestablishment_idestablishment_foreign" FOREIGN KEY("idEstablishment") REFERENCES "establishment"("id");
ALTER TABLE
    "customers" ADD CONSTRAINT "customers_idestablishment_foreign" FOREIGN KEY("idEstablishment") REFERENCES "establishment"("id");
ALTER TABLE
    "foodOrder" ADD CONSTRAINT "foodorder_paymenttypeid_foreign" FOREIGN KEY("paymentTypeId") REFERENCES "modeOfPayment"("id");
ALTER TABLE
    "stockByEstablishment" ADD CONSTRAINT "stockbyestablishment_idmovementtype_foreign" FOREIGN KEY("idMovementType") REFERENCES "movementType"("id");
ALTER TABLE
    "stockByEstablishment" ADD CONSTRAINT "stockbyestablishment_iddishes_foreign" FOREIGN KEY("idDishes") REFERENCES "dishes"("id");
ALTER TABLE
    "dishesMarks" ADD CONSTRAINT "dishesmarks_id_foreign" FOREIGN KEY("id") REFERENCES "customers"("id");