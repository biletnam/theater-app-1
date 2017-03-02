class Movie < ApplicationRecord
	# t.string :title
	# t.string :director
	# t.string :synopsis
	# t.string :run_time
	
	has_many :showtimes
	has_many :auditoriums, through: :showtimes
	has_many :sales, through: :showtimes



end