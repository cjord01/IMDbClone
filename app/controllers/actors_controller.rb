class ActorsController < ApplicationController

	def index
		@actors = Actor.all.sort { |a,b| a.name <=> b.name }
		@actor = Actor.new
	end

	def show
		@actor = Actor.find(params[:id])
		@roles = @actor.roles.sort { |a,b| a.movie.title <=> b.movie.title }
		@role = Role.new
		@movies = Movie.all.sort { |a,b| a.title <=> b.title }
		@suckr = ImageSuckr::GoogleSuckr.new
	end

	def new
		@actor = Actor.new
	end

	def create
		@actor = Actor.create(actor_params)
		redirect_to actor_path(@actor.id)
	end

	private
	def actor_params
		params.require(:actor).permit(:name)
	end

end