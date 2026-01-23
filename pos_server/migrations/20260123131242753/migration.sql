BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "orders" DROP CONSTRAINT "orders_fk_0";
ALTER TABLE "orders" DROP CONSTRAINT "orders_fk_1";
ALTER TABLE "orders" DROP CONSTRAINT "orders_fk_2";
ALTER TABLE "orders" ADD COLUMN "cashRegisterId" uuid;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "orders"
    ADD CONSTRAINT "orders_fk_3"
    FOREIGN KEY("closedbyId")
    REFERENCES "serverpod_auth_core_profile"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "orders"
    ADD CONSTRAINT "orders_fk_0"
    FOREIGN KEY("cashRegisterId")
    REFERENCES "cash_register"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "orders"
    ADD CONSTRAINT "orders_fk_1"
    FOREIGN KEY("btableId")
    REFERENCES "b_tables"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "orders"
    ADD CONSTRAINT "orders_fk_2"
    FOREIGN KEY("passedById")
    REFERENCES "serverpod_auth_core_profile"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR pos
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('pos', '20260123131242753', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260123131242753', "timestamp" = now();

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
