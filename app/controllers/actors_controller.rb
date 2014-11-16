class ActorsController < ApplicationController

	def index
		@actors = Actor.all.order("Name ASC").paginate(:page => params[:page], :per_page => 24)
		@actor = Actor.new
	end

	def show
		@actor = Actor.find(params[:id])
		@roles = @actor.roles.sort { |a,b| a.movie.title <=> b.movie.title }
		@role = Role.new
		@movies = Movie.all.sort { |a,b| a.title <=> b.title }
	end

	def new
		@actor = Actor.new
	end

	def create
		@actor = Actor.create(actor_params)
		suckr = ImageSuckr::GoogleSuckr.new
		@actor.image = suckr.get_image_file({"q" => "Actor " + @actor.name })
		if @actor.save && @actor.image != nil
			redirect_to actor_path(@actor.id)
		else 
			@actor.destroy
			redirect_to actors_path
		end
	end

	def destroy
		@actor = Actor.find(params[:id])
		@actor.roles.destroy_all
		@actor.destroy
		redirect_to actors_path
	end

	def edit
		@actor = Actor.find(params[:id])
		suckr = ImageSuckr::GoogleSuckr.new
		@actor.image = suckr.get_image_file({"q" => "Actor " + @actor.name })
		if @actor.save && @actor.image != nil
			redirect_to actor_path(@actor.id)
		else 
			@actor.destroy
			redirect_to actors_path
		end
	end

	private
	def actor_params
		params.require(:actor).permit(:name)
	end

end