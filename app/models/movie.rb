class Movie < ApplicationRecord
	# t.string :title
	# t.string :director
	# t.string :synopsis
	# t.string :run_time
	# t.decimal :cost
	
	has_many :showtimes
	has_many :auditoriums, through: :showtimes
	has_many :sales, through: :showtimes

	validates :title, presence: :true
	validates :director, presence: :true
	validates :synopsis, presence: :true
	validates :run_time, presence: :true
	validates :cost, presence: :true, numericality: { greater_than: 0 }

	def unique_showdates
		showtimes.group(:date).map { |showtime| showtime }
	end

	def showtimes_on_date(date)
		showtimes.where(date: date)
	end
	
end