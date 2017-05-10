class AddStationIndexToRailwayStationsRoutes < ActiveRecord::Migration[5.0]
  def change
    add_column :railway_stations_routes, :station_index, :integer
  end
end
