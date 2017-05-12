class ThirdClassWagon < Wagon
  validates :top_seats, :bottom_seats, presence: true
  validates :side_bottom_seats, :side_top_seats, presence: true
end