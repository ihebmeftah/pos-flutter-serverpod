BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "article_compositions" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "articleId" uuid NOT NULL,
    "quantity" double precision NOT NULL,
    "_articleCompositionArticleId" uuid
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "ingredients" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "name" text NOT NULL,
    "unit" text NOT NULL,
    "currentStock" double precision NOT NULL,
    "thresholdStock" double precision NOT NULL,
    "buildingId" uuid NOT NULL,
    "_articleCompositionsIngredientsArticleCompositionsId" uuid
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
    FOREIGN KEY("_articleCompositionArticleId")
    REFERENCES "article"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "ingredients"
    ADD CONSTRAINT "ingredients_fk_0"
    FOREIGN KEY("buildingId")
    REFERENCES "building"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "ingredients"
    ADD CONSTRAINT "ingredients_fk_1"
    FOREIGN KEY("_articleCompositionsIngredientsArticleCompositionsId")
    REFERENCES "article_compositions"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR pos
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('pos', '20260118135441826', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260118135441826', "timestamp" = now();

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
