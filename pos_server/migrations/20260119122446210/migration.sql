BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "article_compositions" DROP CONSTRAINT "article_compositions_fk_2";
ALTER TABLE "article_compositions" DROP CONSTRAINT "article_compositions_fk_0";
ALTER TABLE "article_compositions" DROP CONSTRAINT "article_compositions_fk_1";
ALTER TABLE "article_compositions" DROP COLUMN "articleId";
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "article_compositions"
    ADD CONSTRAINT "article_compositions_fk_0"
    FOREIGN KEY("ingredientId")
    REFERENCES "ingredients"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "article_compositions"
    ADD CONSTRAINT "article_compositions_fk_1"
    FOREIGN KEY("_articleCompositionArticleId")
    REFERENCES "article"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR pos
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('pos', '20260119122446210', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260119122446210', "timestamp" = now();

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
