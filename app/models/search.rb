class Search < ApplicationRecord
 def self.trains(first_station, last_station)
  Train.through_station(first_station) & Train.through_station(last_station)
 end
end