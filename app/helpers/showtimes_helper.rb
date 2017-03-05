module ShowtimesHelper

	def pretty_date(date)
		date.strftime("%a, %b %e")
	end

	def pretty_time(time)
		time.strftime("%l:%M %p")
	end
	
end
