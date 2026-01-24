BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "building" ALTER COLUMN "tableMultiOrder" DROP DEFAULT;
ALTER TABLE "building" ALTER COLUMN "orderWithCashRegister" DROP DEFAULT;
ALTER TABLE "building" ALTER COLUMN "cashRegisterLimitPerDay" DROP NOT NULL;
ALTER TABLE "building" ALTER COLUMN "cashRegisterLimitPerDay" DROP DEFAULT;
ALTER TABLE "building" ALTER COLUMN "allowAppendingItemsToOrder" DROP DEFAULT;
ALTER TABLE "building" ALTER COLUMN "autoCloseOrdersAtClosingTime" DROP DEFAULT;
ALTER TABLE "building" ALTER COLUMN "strictMode" DROP DEFAULT;

--
-- MIGRATION VERSION FOR pos
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('pos', '20260124123145775', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260124123145775', "timestamp" = now();

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
