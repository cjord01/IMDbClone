class FilmmakersController < ApplicationController
	def index
		@filmmakers = Filmmaker.all.order("Name ASC").paginate(:page => params[:page], :per_page => 36)
		@filmmaker = Filmmaker.new
	end

	def show
		@filmmaker = Filmmaker.find(params[:id])
		@crew_members = @filmmaker.crew_members.sort { |a,b| a.movie.title <=> b.movie.title }
		@crew_member = CrewMember.new
		@movies = Movie.all.sort { |a,b| a.title <=> b.title }
		@jobs = Job.all
	end

	def new
		@filmmaker = Filmmaker.new
	end

	def create
		filmmaker = Filmmaker.find_by(filmmaker_params)
		if filmmaker == nil
			@filmmaker = Filmmaker.new(filmmaker_params)
			suckr = ImageSuckr::GoogleSuckr.new
			@filmmaker.image = suckr.get_image_file({"q" => "Filmmaker " + @filmmaker.name})
			if @filmmaker.save && @filmmaker.image != nil
				redirect_to filmmaker_path(@filmmaker.id)
			else
				redirect_to filmmakers_path
			end
		else
			redirect_to filmmaker_path(filmmaker.id)
		end
	end

	def destroy
		@filmmaker = Filmmaker.find(params[:id])
		@filmmaker.crew_members.destroy_all
		@filmmaker.destroy
		redirect_to filmmakers_path
	end

	def edit
		@filmmaker = Filmmaker.find(params[:id])
		suckr = ImageSuckr::GoogleSuckr.new
		@filmmaker.image = suckr.get_image_file({"q" => "Filmmaker " + @filmmaker.name})
		@filmmaker.save
		redirect_to filmmaker_path(@filmmaker.id)
	end

	private
	def filmmaker_params
		params.require(:filmmaker).permit(:name)
	end
end
