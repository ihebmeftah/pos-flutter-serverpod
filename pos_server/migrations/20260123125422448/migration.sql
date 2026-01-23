BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "cash_register" DROP COLUMN "createdAt";
ALTER TABLE "cash_register" ADD COLUMN "startAmount" double precision DEFAULT 0.0;
ALTER TABLE "cash_register" ADD COLUMN "endAmount" double precision DEFAULT 0.0;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "order_items" ADD COLUMN "payMethode" text NOT NULL DEFAULT 'cash'::text;

--
-- MIGRATION VERSION FOR pos
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('pos', '20260123125422448', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260123125422448', "timestamp" = now();

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
