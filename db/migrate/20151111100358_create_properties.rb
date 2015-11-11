class CreateProperties < ActiveRecord::Migration
	def change
			create_table :properties do |t|

			t.string :property_name
			t.string :location
			t.text :description
			t.decimal :price
			t.integer :user_id
			t.timestamps
		end		
	end
end
