class AddNumberToWagons < ActiveRecord::Migration[5.0]
  def change
    add_column :wagons, :number, :integer
  end
end
