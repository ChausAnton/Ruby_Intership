require_relative 'db/dropDB'
require_relative 'db/createDB'
require_relative 'parsFile/pars'
require 'csv'

def migrateDataToDb()
    conn = PG.connect(:dbname => 'bigtask', :password => '', :port => 5432, :user => 'chausanton')
    csvFile = CSV.read("./Data_for_task_1.csv", headers: true)
    dropDB(conn)
    createDB(conn)
    getOfficesInfo(csvFile, conn)
    getZonesInfo(csvFile, conn)
    getRoomsInfo(csvFile, conn)
    getFixturesInfo(csvFile, conn)
    getMarketingMaterialsInfo(csvFile, conn);
end


migrateDataToDb()