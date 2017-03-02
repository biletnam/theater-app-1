class Showtime < ApplicationRecord
	# t.datetime :time
	# t.integer :movie_id
	# t.integer :auditorium_id
	
	has_many :sales

	belongs_to :movie
	belongs_to :auditorium
end
