class Sale < ApplicationRecord
	belongs_to :customer
	belongs_to :showtime
	has_one :auditorium, through: :showtime
	has_one :movie, through: :showtime
end
