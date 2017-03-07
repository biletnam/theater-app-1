class ShowtimesController < ApplicationController

	def show
		@showtime = Showtime.find_by(id: params[:id])
		if @showtime
			render "show"
		else
			redirect_to :movies
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

	def edit
		@showtime = Showtime.find_by(id: params[:id])
		if @showtime
			render "edit"
		else
			redirect_to :movies
		end
	end

	def update
		@showtime = Showtime.find_by(id: params[:id])
		if @showtime
			if @showtime.update_attributes(showtime_params)
				render "show"
			else
				@errors = @showtime.errors.full_messages
				render "edit"
			end
		else
			redirect_to :movies
		end
	end

	def destroy
		@showtime = Showtime.find_by(id: params[:id])
		if @showtime
			@showtime.destroy
		end
		redirect_to :movies
	end


	private

	def showtime_params
    params.require(:showtime).permit(:date, :time, :movie_id, :auditorium_id)
  end
	
end