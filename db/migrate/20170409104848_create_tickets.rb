class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.integer :train_id
      t.integer :first_station_id
      t.integer :last_station_id
      t.integer :user_id

      t.timestamps
    end
  end
end
