class AddDentistToBookings < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookings, :dentist, null: true, foreign_key: true
  end
end
