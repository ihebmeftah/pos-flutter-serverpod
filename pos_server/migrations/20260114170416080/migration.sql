BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "access" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "access" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "consultAllOrders" boolean NOT NULL,
    "orderCreation" boolean NOT NULL,
    "orderCreationNotif" boolean NOT NULL,
    "orderPayment" boolean NOT NULL,
    "orderItemsPayment" boolean NOT NULL,
    "appendItems" boolean NOT NULL,
    "preparation" boolean NOT NULL,
    "takeOrder" boolean NOT NULL,
    "buildingId" bigint
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
-- MIGRATION VERSION FOR pos
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('pos', '20260114170416080', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260114170416080', "timestamp" = now();

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
