CREATE TABLE supplier(
    id SERIAL NOT NULL,
    nameSupplier VARCHAR(255) NOT NULL
);
ALTER TABLE
    supplier ADD PRIMARY KEY(id);
CREATE TABLE customers(
    id BIGSERIAL NOT NULL,
    username VARCHAR(200) NOT NULL,
    mail VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    isActive BOOLEAN NOT NULL,
    uniqId VARCHAR(50) NOT NULL,
    idEstablishment INTEGER NOT NULL
);
ALTER TABLE
    customers ADD PRIMARY KEY(id);
CREATE TABLE inDebtCustomers(
    id SERIAL NOT NULL,
    idCustomer BIGINT NOT NULL,
    debtAmount DECIMAL(8, 2) NOT NULL,
    amountRefunded DECIMAL(8, 2) NOT NULL
);
ALTER TABLE
    inDebtCustomers ADD PRIMARY KEY(id);
CREATE TABLE establishment(
    id SERIAL NOT NULL,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL
);
ALTER TABLE
    establishment ADD PRIMARY KEY(id);
CREATE TABLE establismentEmployee(
    idEmp VARCHAR(50) NOT NULL,
    idEstablishment INTEGER NOT NULL,
    nameEmployee VARCHAR(255) NOT NULL
);
ALTER TABLE
    establismentEmployee ADD PRIMARY KEY(idEmp);
CREATE TABLE modeOfPayment(
    id SERIAL NOT NULL,
    name VARCHAR(250) NOT NULL
);
ALTER TABLE
    modeOfPayment ADD PRIMARY KEY(id);
CREATE TABLE dishes(
    id SERIAL NOT NULL,
    dishesName VARCHAR(250) NOT NULL,
    idSupplier INTEGER NOT NULL,
    sellingPrice DECIMAL(8, 2) NOT NULL,
    purchasePrice DECIMAL(8, 2) NOT NULL
);
ALTER TABLE
    dishes ADD PRIMARY KEY(id);
CREATE TABLE foodOrder(
    id bigserial NOT NULL,
    paymentTypeId INTEGER NOT NULL,
    idDishes INTEGER NOT NULL,
    customerId VARCHAR(50) NOT NULL,
    orderTime TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    dishePrice DECIMAL(8, 2) NOT NULL,
    dishePurchasePrice DECIMAL(8, 2) NOT NULL
);
ALTER TABLE
    foodOrder ADD PRIMARY KEY(id);
CREATE TABLE orderState(
    id bigserial NOT NULL,
    idOrder BIGINT NOT NULL,
    isPending BOOLEAN NOT NULL
);
ALTER TABLE
    orderState ADD PRIMARY KEY(id);
CREATE TABLE stockByEstablishment(
    id bigserial NOT NULL,
    idDishes BIGINT NOT NULL,
    idEstablishment BIGINT NOT NULL,
    remainingStock BIGINT NOT NULL,
    movementType BOOLEAN NOT NULL
);
ALTER TABLE
    stockByEstablishment ADD PRIMARY KEY(id);
ALTER TABLE
    foodOrder ADD CONSTRAINT foodorder_iddishes_foreign FOREIGN KEY(idDishes) REFERENCES dishes(id);
ALTER TABLE
    orderState ADD CONSTRAINT orderstate_idorder_foreign FOREIGN KEY(idOrder) REFERENCES foodOrder(id);
ALTER TABLE
    dishes ADD CONSTRAINT dishes_idsupplier_foreign FOREIGN KEY(idSupplier) REFERENCES supplier(id);
ALTER TABLE
    inDebtCustomers ADD CONSTRAINT indebtcustomers_idcustomer_foreign FOREIGN KEY(idCustomer) REFERENCES customers(id);
ALTER TABLE
    foodOrder ADD CONSTRAINT foodorder_customerid_foreign FOREIGN KEY(customerId) REFERENCES customers(id);
ALTER TABLE
    customers ADD CONSTRAINT customers_uniqid_foreign FOREIGN KEY(uniqId) REFERENCES establismentEmployee(idEmp);
ALTER TABLE
    establismentEmployee ADD CONSTRAINT establismentemployee_idestablishment_foreign FOREIGN KEY(idEstablishment) REFERENCES establishment(id);
ALTER TABLE
    stockByEstablishment ADD CONSTRAINT stockbyestablishment_idestablishment_foreign FOREIGN KEY(idEstablishment) REFERENCES establishment(id);
ALTER TABLE
    customers ADD CONSTRAINT customers_idestablishment_foreign FOREIGN KEY(idEstablishment) REFERENCES establishment(id);
ALTER TABLE
    foodOrder ADD CONSTRAINT foodorder_paymenttypeid_foreign FOREIGN KEY(paymentTypeId) REFERENCES modeOfPayment(id);
ALTER TABLE
    stockByEstablishment ADD CONSTRAINT stockbyestablishment_iddishes_foreign FOREIGN KEY(idDishes) REFERENCES dishes(id);