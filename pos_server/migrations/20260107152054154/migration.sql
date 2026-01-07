BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "article" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "description" text,
    "price" double precision NOT NULL,
    "categorieId" bigint NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "categorie" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "description" text NOT NULL,
    "buildingId" bigint
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "article"
    ADD CONSTRAINT "article_fk_0"
    FOREIGN KEY("categorieId")
    REFERENCES "categorie"("id")
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
-- MIGRATION VERSION FOR pos
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('pos', '20260107152054154', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260107152054154', "timestamp" = now();

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
