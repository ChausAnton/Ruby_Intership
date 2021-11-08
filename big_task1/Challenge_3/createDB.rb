require 'pg'

def createDB() 
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
      "Office_name" varchar,
      "Office_address" varchar,
      "Office_city" varchar,
      "Office_state" varchar,
      "Office_phone" BIGINT,
      "Office_lob" enum_office_lobs,
      "Office_type" enum_office_types
    );')
  
  
  conn.exec(
      'CREATE TABLE IF NOT EXISTS "zones" (
        "id" SERIAL PRIMARY KEY,
        "Zone_name" varchar,
        "Office_id" integer NOT NULL
      );
      ALTER TABLE "zones" ADD FOREIGN KEY ("Office_id") REFERENCES "offices" ("id");'
  )
  
  
  conn.exec(
    'CREATE TABLE IF NOT EXISTS "rooms" (
    "id" SERIAL PRIMARY KEY,
    "Room_name" varchar,
    "Room_area" integer,
    "Room_max_people" integer,
    "Zone_id" integer NOT NULL
    );
    ALTER TABLE "rooms" ADD FOREIGN KEY ("Zone_id") REFERENCES "zones" ("id");'
  )
  
  conn.exec(
    'CREATE TABLE IF NOT EXISTS "fixtures" (
      "id" SERIAL PRIMARY KEY,
      "Fixture_type" enum_fixture_types,
      "Fixture_name" varchar,
      "Room_id" integer NOT NULL
    );
    ALTER TABLE "fixtures" ADD FOREIGN KEY ("Room_id") REFERENCES "rooms" ("id");'
  )
  
  
  conn.exec(
    'CREATE TABLE IF NOT EXISTS "marketing_materials" (
      "id" SERIAL PRIMARY KEY,
      "Marketing_materials_name" varchar,
      "Marketing_materials_type" enum_materials_types,
      "Marketing_materials_cost" integer,
      "Fixture_id" integer NOT NULL
    );
    ALTER TABLE "marketing_materials" ADD FOREIGN KEY ("Fixture_id") REFERENCES "fixtures" ("id");'
  )
end
