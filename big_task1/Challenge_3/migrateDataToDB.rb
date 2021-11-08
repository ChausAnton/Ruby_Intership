require_relative 'dropDB'
require_relative 'createDB'
require 'csv'

dropDB()
createDB()

some = CSV.read("./Data_for_task_1.csv")
puts some[1]