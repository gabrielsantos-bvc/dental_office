class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :client, null: false, foreign_key: true
      t.references :office, null: false, foreign_key: true
      t.datetime :booked_time
      t.string :status

      t.timestamps
    end
  end
end
