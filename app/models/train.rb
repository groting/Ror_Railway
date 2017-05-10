class Train < ApplicationRecord
  belongs_to :route
  has_many :tickets
  has_many :wagons

  belongs_to :current_station, class_name: "RailwayStation", foreign_key: :current_station_id
  
  def wagons_count(wagon_type)
    wagons.where(wagon_type:wagon_type).count
  end

   def seats
    seats = {}
    wagons.each do |wagon|
      if wagon.wagon_type == 'Купейный'
        seats[:second_class_top_seats] = wagon.top_seats
        seats[:second_class_bottom_seats] = wagon.bottom_seats
      else
        seats[:third_class_top_seats] = wagon.top_seats
        seats[:third_class_bottom_seats] = wagon.bottom_seats
      end
    end
    seats
    end

  def seats_count(wagon_type, seats_type)
    wagons.where(wagon_type:wagon_type).sum(seats_type)
  end
end
