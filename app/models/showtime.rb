class Showtime < ApplicationRecord
	has_many :sales

	belongs_to :movie
	belongs_to :auditorium
end
