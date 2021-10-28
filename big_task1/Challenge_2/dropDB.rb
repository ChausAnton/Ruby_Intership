require 'pg'

conn = PG.connect(:dbname => 'challenge_2', :password => '', :port => 5432, :user => 'chausanton')

conn.exec(
    'DROP TABLE IF EXISTS Offices, Zones, Rooms, Fixtures, Marketing_materials cascade;
     DROP TYPE IF EXISTS enum_materials_types, enum_office_types, enum_fixture_types, enum_office_lobs, enum_office_types cascade;
    '
)