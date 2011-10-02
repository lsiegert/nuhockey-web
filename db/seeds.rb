# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
require 'csv-mapper'
include CsvMapper

results = CsvMapper.import('/Users/lauren/Code/R/nuhockey/games.csv') do
  map_to Game
  after_row lambda{|row, game| game.save}
  start_at_row 1
  [_id, date, season, opponent, nuscore, oppscore, location, deleted]
end