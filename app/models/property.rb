class Property < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :user
	has_many :bookings

	validates :property_name, presence: true
	validates :location, presence: true
	validates :description, presence: true
	validates :price, presence: true
	validates :user_id, presence: true

end
