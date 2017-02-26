class Movie < ApplicationRecord
	has_many :showtimes
	has_many :auditoriums, through: :showtimes
	has_many :sales, through: :showtimes
end
