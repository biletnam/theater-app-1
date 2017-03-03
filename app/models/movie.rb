class Movie < ApplicationRecord
	# t.string :title
	# t.string :director
	# t.string :synopsis
	# t.string :run_time
	
	has_many :showtimes
	has_many :auditoriums, through: :showtimes
	has_many :sales, through: :showtimes

	def unique_showdates
		showtimes.group(:date).map { |showtime| showtime.date }
	end

	def showtimes_on_date(date)
		showtimes.where(date: date)
	end
	
end

			# <% movie.showtimes.order(:time).each do |showtime| %>
			# 	<li><%= showtime.time.strftime("%l:%M %p") %></li>
			# <% end %>