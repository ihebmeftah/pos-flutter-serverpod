BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "order_items" (
    "id" bigserial PRIMARY KEY,
    "article" json NOT NULL,
    "passedById" uuid NOT NULL,
    "payed" boolean NOT NULL DEFAULT false
);

--
-- ACTION ALTER TABLE
--
CREATE UNIQUE INDEX "order_ref_idx" ON "orders" USING btree ("ref");
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "order_items"
    ADD CONSTRAINT "order_items_fk_0"
    FOREIGN KEY("passedById")
    REFERENCES "serverpod_auth_core_user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR pos
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('pos', '20260107201608721', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260107201608721', "timestamp" = now();

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
