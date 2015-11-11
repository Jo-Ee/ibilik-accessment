class CreateBookings < ActiveRecord::Migration
	def change
		create_table :bookings do |t|
			t.text :message
			t.integer :property_id
			t.integer :user_id
			t.string :booking_session
		end
	end
end
