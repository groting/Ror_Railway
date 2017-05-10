class AddWagonsToTrain < ActiveRecord::Migration[5.0]
  def change
    add_belongs_to :wagons, :train, foreign_key: true
  end
end
