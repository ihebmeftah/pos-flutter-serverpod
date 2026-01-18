BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "access" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "access" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "name" text NOT NULL,
    "consultAllOrders" boolean NOT NULL,
    "orderCreation" boolean NOT NULL,
    "orderCreationNotif" boolean NOT NULL,
    "orderPayment" boolean NOT NULL,
    "orderItemsPayment" boolean NOT NULL,
    "appendItems" boolean NOT NULL,
    "preparation" boolean NOT NULL,
    "serveOrder" boolean NOT NULL,
    "caisseManagement" boolean NOT NULL,
    "buildingId" uuid NOT NULL
);

-- Indexes
CREATE INDEX "access_buildingId_idx" ON "access" USING btree ("buildingId");

--
-- ACTION DROP TABLE
--
DROP TABLE "article" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "article" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "name" text NOT NULL,
    "description" text,
    "price" double precision NOT NULL,
    "categorieId" uuid NOT NULL
);

-- Indexes
CREATE INDEX "article_categorieId_idx" ON "article" USING btree ("categorieId");

--
-- ACTION DROP TABLE
--
DROP TABLE "b_tables" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "b_tables" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "number" bigint NOT NULL,
    "seatsMax" bigint NOT NULL DEFAULT 4,
    "buildingId" uuid NOT NULL
);

-- Indexes
CREATE INDEX "btables_buildingId_idx" ON "b_tables" USING btree ("buildingId");

--
-- ACTION DROP TABLE
--
DROP TABLE "building" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "building" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "name" text NOT NULL,
    "address" text NOT NULL,
    "openingTime" timestamp without time zone NOT NULL,
    "closingTime" timestamp without time zone NOT NULL,
    "authUserId" uuid,
    "tableMultiOrder" boolean NOT NULL DEFAULT false,
    "allowAppendingItemsToOrder" boolean NOT NULL DEFAULT true,
    "autoCloseOrdersAtClosingTime" boolean NOT NULL DEFAULT false,
    "currencyCode" text NOT NULL,
    "long" double precision,
    "lat" double precision
);

--
-- ACTION DROP TABLE
--
DROP TABLE "caisse" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "caisse" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "start" timestamp without time zone NOT NULL,
    "end" timestamp without time zone,
    "isClosed" boolean NOT NULL,
    "buildingId" uuid NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

--
-- ACTION DROP TABLE
--
DROP TABLE "categorie" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "categorie" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "name" text NOT NULL,
    "description" text,
    "buildingId" uuid NOT NULL
);

-- Indexes
CREATE INDEX "categorie_buildingId_idx" ON "categorie" USING btree ("buildingId");

--
-- ACTION DROP TABLE
--
DROP TABLE "employers" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "employers" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "userProfileId" uuid NOT NULL,
    "buildingId" uuid NOT NULL,
    "accessId" uuid
);

-- Indexes
CREATE UNIQUE INDEX "employer_profile_idx" ON "employers" USING btree ("userProfileId");

--
-- ACTION DROP TABLE
--
DROP TABLE "order_items" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "order_items" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "article" json NOT NULL,
    "itemStatus" text NOT NULL DEFAULT 'progress'::text,
    "passedById" uuid NOT NULL,
    "payedToId" uuid,
    "preparedById" uuid,
    "orderId" uuid,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone,
    "preaparedAt" timestamp without time zone,
    "payedAt" timestamp without time zone
);

-- Indexes
CREATE INDEX "order_item_orderId_idx" ON "order_items" USING btree ("orderId");

--
-- ACTION DROP TABLE
--
DROP TABLE "orders" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "orders" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "status" text NOT NULL DEFAULT 'progress'::text,
    "btableId" uuid NOT NULL,
    "passedById" uuid NOT NULL,
    "closedbyId" uuid,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone
);

-- Indexes
CREATE INDEX "order_btableId_idx" ON "orders" USING btree ("btableId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "access"
    ADD CONSTRAINT "access_fk_0"
    FOREIGN KEY("buildingId")
    REFERENCES "building"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "article"
    ADD CONSTRAINT "article_fk_0"
    FOREIGN KEY("categorieId")
    REFERENCES "categorie"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "b_tables"
    ADD CONSTRAINT "b_tables_fk_0"
    FOREIGN KEY("buildingId")
    REFERENCES "building"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "building"
    ADD CONSTRAINT "building_fk_0"
    FOREIGN KEY("authUserId")
    REFERENCES "serverpod_auth_core_user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "caisse"
    ADD CONSTRAINT "caisse_fk_0"
    FOREIGN KEY("buildingId")
    REFERENCES "building"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "categorie"
    ADD CONSTRAINT "categorie_fk_0"
    FOREIGN KEY("buildingId")
    REFERENCES "building"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "employers"
    ADD CONSTRAINT "employers_fk_0"
    FOREIGN KEY("userProfileId")
    REFERENCES "serverpod_auth_core_profile"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "employers"
    ADD CONSTRAINT "employers_fk_1"
    FOREIGN KEY("buildingId")
    REFERENCES "building"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "employers"
    ADD CONSTRAINT "employers_fk_2"
    FOREIGN KEY("accessId")
    REFERENCES "access"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "order_items"
    ADD CONSTRAINT "order_items_fk_0"
    FOREIGN KEY("passedById")
    REFERENCES "serverpod_auth_core_profile"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "order_items"
    ADD CONSTRAINT "order_items_fk_1"
    FOREIGN KEY("payedToId")
    REFERENCES "serverpod_auth_core_profile"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "order_items"
    ADD CONSTRAINT "order_items_fk_2"
    FOREIGN KEY("preparedById")
    REFERENCES "serverpod_auth_core_profile"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "order_items"
    ADD CONSTRAINT "order_items_fk_3"
    FOREIGN KEY("orderId")
    REFERENCES "orders"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "orders"
    ADD CONSTRAINT "orders_fk_0"
    FOREIGN KEY("btableId")
    REFERENCES "b_tables"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "orders"
    ADD CONSTRAINT "orders_fk_1"
    FOREIGN KEY("passedById")
    REFERENCES "serverpod_auth_core_profile"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "orders"
    ADD CONSTRAINT "orders_fk_2"
    FOREIGN KEY("closedbyId")
    REFERENCES "serverpod_auth_core_profile"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR pos
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('pos', '20260117130613346', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260117130613346', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20251208110333922-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110333922-v3-0-0', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20260109031533194', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260109031533194', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20251208110412389-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110412389-v3-0-0', "timestamp" = now();


COMMIT;
