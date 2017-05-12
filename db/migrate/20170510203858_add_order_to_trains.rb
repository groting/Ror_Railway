class AddOrderToTrains < ActiveRecord::Migration[5.0]
  def change
    add_column :trains, :order, :boolean
  end
end
