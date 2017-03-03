class MoviesController < ApplicationController

	def index
		@movies = Movie.all
	end

	def show
		@movie = Movie.find_by(id: params[:id])
		if @movie
			render "show"
		else
			redirect_to :movies
		end 
	end

end
