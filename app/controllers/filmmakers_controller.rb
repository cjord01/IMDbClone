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

	private
	def filmmaker_params
		params.require(:filmmaker).permit(:name)
	end
end
