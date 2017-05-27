class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.belongs_to :train, index: true, foreign_key: true
      t.integer :first_station_id
      t.integer :last_station_id
      t.belongs_to :user, index: true, foreign_key: true
      t.string :passenger_name
      t.string :passport_number

      t.timestamps
    end
  end
end
