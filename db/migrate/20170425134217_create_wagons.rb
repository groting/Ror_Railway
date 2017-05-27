class CreateWagons < ActiveRecord::Migration[5.0]
  def change
    create_table :wagons do |t|
      t.belongs_to :train, index: true, foreign_key: true
      t.string :wagon_type
      t.integer :top_seats
      t.integer :bottom_seats
      t.integer :side_top_seats
      t.integer :side_bottom_seats
      t.integer :number

      t.timestamps
    end
  end
end
