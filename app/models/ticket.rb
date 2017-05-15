class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :train
  belongs_to :first_staion, class_name: "RailwayStation", foreign_key: :first_station_id
  belongs_to :last_staion, class_name: "RailwayStation", foreign_key: :last_station_id

  validates :passenger_name, :passport_number, presence: true
end
