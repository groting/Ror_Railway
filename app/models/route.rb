class Route < ApplicationRecord
  
  validates :name, presence: true
  validate :stations_count

  before_validation :set_name

  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes

  has_many :trains
  
  private

  def set_name
    self.name = "#{railway_stations.first.name} - #{railway_stations.last.name}"
  end

  def stations_count
    if railway_stations.size < 2
      errors.add(:base, "В маршруте должно быть не меньше 2 станций!")
    end
  end
end
