class MoviesController < ApplicationController
	def index
		@movies = Movie.all.order("title ASC").paginate(:page => params[:page], :per_page => 36)
		@movie = Movie.new
	end

	def show
		@movie = Movie.find(params[:id])
		@roles = @movie.roles.sort { |a,b| a.actor.name <=> b.actor.name }
		@role = Role.new
		@actors = Actor.all.sort { |a,b| a.name <=> b.name }
		@crew_members = @movie.crew_members.sort { |a,b| a.filmmaker.name <=> b.filmmaker.name }
		@crew_member = CrewMember.new
		@filmmakers = Filmmaker.all.sort { |a,b,| a.name <=> b.name }
		@jobs = Job.all
	end

	def new
		@movie = Movie.new
	end

	def create
		movie = Movie.find_by(movie_params)
		if movie == nil
			@movie = Movie.new(movie_params)
			suckr = ImageSuckr::GoogleSuckr.new
			@movie.image = suckr.get_image_file({"q" => @movie.title + " movie poster"})
			if @movie.save && @movie.image != nil
				redirect_to movie_path(@movie.id) 
			else 
				redirect_to movies_path
			end
		else 
			redirect_to movie_path(movie.id)
		end
	end

	def destroy
		@movie = Movie.find(params[:id])
		@movie.roles.destroy_all
		@movie.destroy
		redirect_to movies_path
	end

	def edit
		@movie = Movie.find(params[:id])
		suckr = ImageSuckr::GoogleSuckr.new
		@movie.image = suckr.get_image_file({"q" => @movie.title + " movie poster"})
		@movie.save
		redirect_to movie_path(@movie.id)
	end

	private
	def movie_params
		params.require(:movie).permit(:title)
	end
end