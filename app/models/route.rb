class Route < ApplicationRecord
  
  validates :name, presence: true
  validate :stations_count

  before_validation :set_name

  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes

  has_many :trains

  def station_time(station, method)
    railway_stations_routes.where(route_id: id, railway_station_id: station.id).first.send(method)
  end
  
  private

  def set_name
    self.name = "#{railway_stations.first.name} - #{railway_stations.last.name}"
  end

  def stations_count
    if railway_stations.size < 2
      errors.add(:base, t('route.errors.stations_count'))
    end
  end
end
