class CreateRailwayStationsRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :railway_stations_routes do |t|
    t.belongs_to :railway_station, index: true, foreign_key: true
    t.belongs_to :route, index: true, foreign_key: true
    t.integer :position
    t.datetime :arrive_time
    t.datetime :depart_time
    end
  end
end
