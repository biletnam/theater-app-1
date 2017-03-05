class Sale < ApplicationRecord
	# t.string :confirmation_no
	# t.integer :customer_id
	# t.integer :showtime_id
    	
	belongs_to :customer
	belongs_to :showtime
	has_one :auditorium, through: :showtime
	has_one :movie, through: :showtime
end
