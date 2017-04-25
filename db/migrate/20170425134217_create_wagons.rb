class CreateWagons < ActiveRecord::Migration[5.0]
  def change
    create_table :wagons do |t|
      t.belongs_to :train_id
      t.string :wagon_type
      t.integer :high
      t.integer :low

      t.timestamps
    end
  end
end
