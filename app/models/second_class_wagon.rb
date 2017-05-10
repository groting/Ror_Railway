class SecondClassWagon < Wagon
  validates :top_seats, :bottom_seats, presence: true
end