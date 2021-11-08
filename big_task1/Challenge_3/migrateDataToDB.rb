require_relative 'dropDB'
require_relative 'createDB'
require 'csv'

dropDB()
createDB()

def getOfficesInfo(file)
    OfficesInfo = {
        id: [],
        title: [],
        address: [],
        city: [],
        state: [],
        phone: [],
        lob: [],
        type: []
    }


end

def getZonesInfo(file)
    ZonesInfo = {
        id: [],
        type: [],
        office_id: []
    }
end

def getRoomsInfo(file)
    RoomsInfo = {
        id: [],
        area: [],
        max_people: [],
        name: [],
        zones_id: []
    }
end

def getFixturesInfo(file)
    FixturesInfo = {
        id: [],
        name: [],
        type: [],
        rooms_id: [],
    }
end

def getMarketingMaterialsInfo(file)
    MarketingMaterialsInfo = {
        id: [],
        name: [],
        type: [],
        cost: [],
        fixture_id: []
    }
end

def migrateDataToDb()
    csvFile = CSV.read("./Data_for_task_1.csv")



end


