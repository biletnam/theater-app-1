class MoviesController < ApplicationController

	def index
		@movies = Movie.all
		@as_admin = false
	end

	def admin
		@movies = Movie.all
		@auditoria = Auditorium.all
		@as_admin = true
		render 'index'
	end

	def show
		@movie = Movie.find_by(id: params[:id])
		if @movie
			render "show"
		else
			redirect_to :movies
		end 
	end

	def new
		@movie = Movie.new
		render "new"
	end

	def create
		@movie = Movie.new(movie_params)
		if @movie.save
			render "show"
		else
			@errors = @movie.errors.full_messages
			render "new"
		end
	end

	def edit
		@movie = Movie.find_by(id: params[:id])
		if @movie
			render "edit"
		else
			redirect_to :movies
		end
	end

	def update
		@movie = Movie.find_by(id: params[:id])
		if @movie
			if @movie.update_attributes(movie_params)
				render "show"
			else
				@errors = @movie.errors.full_messages
				render "edit"
			end
		else
			redirect_to :showtimes
		end
	end

	def destroy
		@movie = Movie.find_by(id: params[:id])
		if @movie
			@movie.destroy
			redirect_to :movies
		else
			redirect_to :root
		end
	end

	private

	def movie_params
    params.require(:movie).permit(:title, :director, :synopsis, :run_time, :cost)
  end

end
