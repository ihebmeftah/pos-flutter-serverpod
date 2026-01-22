BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "caisse" CASCADE;

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
    "cashRegisterManagement" boolean NOT NULL,
    "buildingId" uuid NOT NULL
);

-- Indexes
CREATE INDEX "access_buildingId_idx" ON "access" USING btree ("buildingId");

--
-- ACTION ALTER TABLE
--
ALTER TABLE "building" ADD COLUMN "orderWithCashRegister" boolean NOT NULL DEFAULT false;
--
-- ACTION CREATE TABLE
--
CREATE TABLE "cash_register" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "start" timestamp without time zone NOT NULL,
    "end" timestamp without time zone,
    "isClosed" boolean NOT NULL,
    "buildingId" uuid NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

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
ALTER TABLE ONLY "cash_register"
    ADD CONSTRAINT "cash_register_fk_0"
    FOREIGN KEY("buildingId")
    REFERENCES "building"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR pos
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('pos', '20260121225620761', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260121225620761', "timestamp" = now();

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
