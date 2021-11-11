require 'pg'

conn = PG.connect(:dbname => 'challenge_2', :password => '', :port => 5432, :user => 'chausanton')

conn.exec(
  "CREATE TYPE enum_materials_types AS ENUM (
    'Brochure',
    'Poster',
    'Print',
    'Flag'
);")

conn.exec(
  "CREATE TYPE enum_fixture_types AS ENUM (
    'Standing desk',
    'Door',
    'Window',
    'Wall poster',
    'Table',
    'ATM Wall',
    'Flag'
);")

conn.exec(
  "CREATE TYPE enum_office_lobs AS ENUM (
    'Commercial',
    'Charity'
);")

conn.exec(
    "CREATE TYPE enum_office_types AS ENUM (
      'Office',
      'ATM'
  );")

conn.exec(
    'CREATE TABLE IF NOT EXISTS "offices" (
    "id" SERIAL PRIMARY KEY,
    "office_name" varchar,
    "office_address" varchar,
    "office_city" varchar,
    "office_state" varchar,
    "office_phone" BIGINT,
    "office_lob" enum_office_lobs,
    "office_type" enum_office_types
  );')


conn.exec(
    'CREATE TABLE IF NOT EXISTS "zones" (
      "id" SERIAL PRIMARY KEY,
      "zone_name" varchar,
      "office_id" integer NOT NULL
    );
    ALTER TABLE "zones" ADD FOREIGN KEY ("office_id") REFERENCES "offices" ("id");'
)


conn.exec(
  'CREATE TABLE IF NOT EXISTS "rooms" (
  "id" SERIAL PRIMARY KEY,
  "room_name" varchar,
  "room_area" integer,
  "room_max_people" integer,
  "zone_id" integer NOT NULL
  );
  ALTER TABLE "rooms" ADD FOREIGN KEY ("zone_id") REFERENCES "zones" ("id");'
)

conn.exec(
  'CREATE TABLE IF NOT EXISTS "fixtures" (
    "id" SERIAL PRIMARY KEY,
    "fixture_type" enum_fixture_types,
    "fixture_name" varchar,
    "room_id" integer NOT NULL
  );
  ALTER TABLE "fixtures" ADD FOREIGN KEY ("room_id") REFERENCES "rooms" ("id");'
)


conn.exec(
  'CREATE TABLE IF NOT EXISTS "marketing_materials" (
    "id" SERIAL PRIMARY KEY,
    "marketing_materials_name" varchar,
    "marketing_materials_type" enum_materials_types,
    "marketing_materials_cost" integer,
    "fixture_id" integer NOT NULL
  );
  ALTER TABLE "marketing_materials" ADD FOREIGN KEY ("fixture_id") REFERENCES "fixtures" ("id");'
)