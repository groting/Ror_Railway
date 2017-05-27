class Train < ApplicationRecord
  belongs_to :route
  has_many :tickets
  has_many :wagons

  belongs_to :current_station, class_name: "RailwayStation", foreign_key: :current_station_id
  
  scope :through_station, ->(station) { joins(route: :railway_stations).where("railway_station_id = ?", station) }

  def wagons_count(wagon_type)
    wagons.where(wagon_type:wagon_type).count
  end

  def seats_count(wagon_type, seats_type)
    wagons.where(wagon_type:wagon_type).sum(seats_type)
  end

  def update_number(number)
    self.update(number: number) if self
  end

  def ordered_wagons
    Wagon.ordered(order)
  end
end
