class Booking < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :user
	belongs_to :property

	validates :message, presence: true
	validates :property_id, presence: true
	validates :user_id, presence: true
	validates :booking_session, presence: true

end