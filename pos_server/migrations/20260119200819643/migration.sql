BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "article_compositions" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "article_compositions" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "articleId" uuid NOT NULL,
    "ingredientId" uuid NOT NULL,
    "quantity" double precision NOT NULL,
    "_articleCompositionArticleId" uuid
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "article_compositions"
    ADD CONSTRAINT "article_compositions_fk_0"
    FOREIGN KEY("articleId")
    REFERENCES "article"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "article_compositions"
    ADD CONSTRAINT "article_compositions_fk_1"
    FOREIGN KEY("ingredientId")
    REFERENCES "ingredients"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "article_compositions"
    ADD CONSTRAINT "article_compositions_fk_2"
    FOREIGN KEY("_articleCompositionArticleId")
    REFERENCES "article"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR pos
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('pos', '20260119200819643', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260119200819643', "timestamp" = now();

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
