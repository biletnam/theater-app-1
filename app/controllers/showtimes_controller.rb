class ShowtimesController < ApplicationController

	def index
		@showtimes = Showtime.all
	end

	def show
		@showtime = Showtime.find_by(id: params[:id])
		if @showtime
			render "show"
		else
			redirect_to :showtimes
		end 
	end
	
end