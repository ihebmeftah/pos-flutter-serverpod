BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "order_items" DROP CONSTRAINT "order_items_fk_0";
--
-- ACTION ALTER TABLE
--
ALTER TABLE "orders" DROP CONSTRAINT "orders_fk_1";
ALTER TABLE "orders" DROP CONSTRAINT "orders_fk_2";
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "order_items"
    ADD CONSTRAINT "order_items_fk_0"
    FOREIGN KEY("passedById")
    REFERENCES "serverpod_auth_core_profile"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
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
    VALUES ('pos', '20260108213104642', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260108213104642', "timestamp" = now();

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
