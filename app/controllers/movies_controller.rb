class MoviesController < ApplicationController
	def index
		@movies = Movie.all.sort { |a,b| a.title <=> b.title }
		@movie = Movie.new
		@suckr = ImageSuckr::GoogleSuckr.new
	end

	def show
		@movie = Movie.find(params[:id])
		@roles = @movie.roles.sort { |a,b| a.actor.name <=> b.actor.name }
		@role = Role.new
		@actors = Actor.all.sort { |a,b| a.name <=> b.name }
		@suckr = ImageSuckr::GoogleSuckr.new
	end

	def new
		@movie = Movie.new
	end

	def create
		@movie = Movie.create(movie_params)
		redirect_to movie_path(@movie.id)
	end

	private
	def movie_params
		params.require(:movie).permit(:title, :year)
	end
end