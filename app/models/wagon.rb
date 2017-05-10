class Wagon < ApplicationRecord
  belongs_to :train
  validates :bottom_seats, presence: true
  validates :number, uniqueness: { scope: :train_id }

  before_validation :set_number

  scope :asc_ordered, -> { order(:number) }
  scope :desc_ordered, -> { order(number: :desc) }
  scope :ordered, ->(train) { train.order? ? asc_ordered : desc_ordered }

  SV_TYPE = 'СВ'
  COUPE_TYPE = 'Купейный'
  PLATZCARD_TYPE = 'Плацкартный'
  SITTING_TYPE = 'Сидячий'

  WAGON_TYPES = {
  'FirstClassWagon' => SV_TYPE,
  'SecondClassWagon' => COUPE_TYPE,
  'ThirdClassWagon' => PLATZCARD_TYPE,
  'CouchWagon' => SITTING_TYPE}.freeze

  private

  def set_number
    self.number ||= (train.wagons.maximum(:number).to_i + 1)
  end
end
