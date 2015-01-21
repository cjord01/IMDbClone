class FilmmakersController < ApplicationController
	def index
		@filmmakers = Filmmaker.all.order("Name ASC").paginate(:page => params[:page], :per_page => 36)
		@filmmaker = Filmmaker.new
	end

	def show
	end

	def new
		@filmmaker = Filmmaker.new
	end
end
