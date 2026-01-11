BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "access" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "orderCreation" boolean NOT NULL,
    "orderCreationNotif" boolean NOT NULL DEFAULT true,
    "orderPayment" boolean NOT NULL,
    "orderPaymentNotif" boolean NOT NULL DEFAULT true,
    "orderItemsPayment" boolean NOT NULL,
    "orderItemsPaymentNotif" boolean NOT NULL DEFAULT true,
    "buildingId" bigint
);

-- Indexes
CREATE UNIQUE INDEX "company_name_idx" ON "access" USING btree ("name");

--
-- ACTION ALTER TABLE
--
ALTER TABLE "employers" ADD COLUMN "accessId" bigint;
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
ALTER TABLE ONLY "employers"
    ADD CONSTRAINT "employers_fk_2"
    FOREIGN KEY("accessId")
    REFERENCES "access"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR pos
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('pos', '20260110234159109', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260110234159109', "timestamp" = now();

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
