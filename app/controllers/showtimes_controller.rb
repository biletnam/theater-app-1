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

	def new
		@showtime = Showtime.new
		render "new"
	end

	def create
		@showtime = Showtime.new(showtime_params)
		if @showtime.save
			render "show"
		else
			@errors = @showtime.errors.full_messages
			render "new"
		end
	end






	private

	def showtime_params
    params.require(:showtime).permit(:date, :time, :movie_id, :auditorium_id)
  end
	
end