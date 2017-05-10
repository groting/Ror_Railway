class Train < ApplicationRecord
  belongs_to :route
  has_many :tickets
  has_many :wagons

  belongs_to :current_station, class_name: "RailwayStation", foreign_key: :current_station_id
  
  def wagons_count(wagon_type)
    wagons.where(wagon_type:wagon_type).count
  end

  def seats_count(wagon_type, seats_type)
    num_of_seats = 0
    wagons.where(wagon_type:wagon_type).each do |wagon|
      if seats_type == 'Нижние'
        num_of_seats += wagon.bottom_seats
      else
        num_of_seats += wagon.top_seats
      end
    end
    num_of_seats
  end

end
