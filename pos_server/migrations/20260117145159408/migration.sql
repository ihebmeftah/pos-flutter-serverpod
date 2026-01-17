BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "employers" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "employers" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "firstName" text NOT NULL,
    "lastName" text NOT NULL,
    "phone" bigint,
    "phoneVerified" boolean NOT NULL,
    "persoEmail" text,
    "persoEmailVerified" boolean NOT NULL,
    "userProfileId" uuid NOT NULL,
    "buildingId" uuid NOT NULL,
    "accessId" uuid
);

-- Indexes
CREATE UNIQUE INDEX "employer_profile_idx" ON "employers" USING btree ("userProfileId", "persoEmail", "phone");
CREATE INDEX "employer_buildingId_idx" ON "employers" USING btree ("buildingId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "employers"
    ADD CONSTRAINT "employers_fk_0"
    FOREIGN KEY("userProfileId")
    REFERENCES "serverpod_auth_core_profile"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "employers"
    ADD CONSTRAINT "employers_fk_1"
    FOREIGN KEY("buildingId")
    REFERENCES "building"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "employers"
    ADD CONSTRAINT "employers_fk_2"
    FOREIGN KEY("accessId")
    REFERENCES "access"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR pos
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('pos', '20260117145159408', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260117145159408', "timestamp" = now();

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
