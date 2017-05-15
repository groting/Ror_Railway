class RailwayStation < ApplicationRecord
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  has_many :trains, foreign_key: :current_station_id

  scope :ordered, -> { joins(:railway_stations_routes).order("railway_stations_routes.position").uniq }

  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(position: position) if station_route
  end

  def position_in(route)
    station_route(route).try(:position)
  end

  def update_time(route, time)
    station_route = station_route(route)
    station_route.update(time) if station_route
  end

  def time_in(route, attr)
    station_route(route).try(attr)
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
