require 'pg'

def dropDB(conn) 

    conn.exec(
        'DROP TABLE IF EXISTS offices, zones, rooms, fixtures, marketing_materials cascade;
         DROP TYPE IF EXISTS enum_materials_types, enum_office_types, enum_fixture_types, enum_office_lobs, enum_office_types cascade;
        '
    )
end