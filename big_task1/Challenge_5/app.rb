# frozen_string_literal: true

require_relative 'db/migrateDataToDB'
require './reports/reports'

class Start
    include Reports

    def initialize()
        conn = migrateDataToDb()
    
        reports(conn)
    end
end

start = Start.new()