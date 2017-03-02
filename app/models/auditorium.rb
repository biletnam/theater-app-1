class Auditorium < ApplicationRecord
	# t.string :name
	# t.integer :capacity

	has_many :showtimes
	has_many :movies, through: :showtimes
end
