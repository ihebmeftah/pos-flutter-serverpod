BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "b_tables" (
    "id" bigserial PRIMARY KEY,
    "number" bigint NOT NULL,
    "seatsMax" bigint NOT NULL DEFAULT 4,
    "status" text NOT NULL DEFAULT 'available'::text,
    "buildingId" bigint
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "building" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "address" text NOT NULL,
    "openingTime" timestamp without time zone NOT NULL,
    "closingTime" timestamp without time zone NOT NULL,
    "authUserId" uuid,
    "tableMultiOrder" boolean NOT NULL DEFAULT false
);

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
-- MIGRATION VERSION FOR pos
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('pos', '20260107125801821', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260107125801821', "timestamp" = now();

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
    VALUES ('serverpod_auth_idp', '20251208110420531-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110420531-v3-0-0', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20251208110412389-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110412389-v3-0-0', "timestamp" = now();


COMMIT;
