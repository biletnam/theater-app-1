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



	private

	def showtime_params
    params.require(:showtime).permit(:time)
  end
	
end