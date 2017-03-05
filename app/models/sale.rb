class Sale < ApplicationRecord
	# t.string :confirmation_no
	# t.integer :customer_id
	# t.integer :showtime_id
    	
	belongs_to :customer
	belongs_to :showtime
	has_one :auditorium, through: :showtime
	has_one :movie, through: :showtime

	validates :confirmation_no, presence: true, numericality: true
	validates :customer_id, presence: true
	validates :showtime_id, presence: true
end
