class CrewMembersController < ApplicationController

	def create
		@crew_member = CrewMember.new(crew_member_params)
		movie = @crew_member.movie.id
		if @crew_member.save
			redirect_to movie_path(@crew_member.movie.id)
		else
			@crew_member.destroy
			redirect_to movie_path(movie.id)
		end
	end

	def destroy
		@crew_member = CrewMember.find(params[:id])
		movie_id = @crew_member.movie.id
		@crew_member.destroy
		redirect_to movie_path(movie_id)
	end

	private
	def crew_member_params
		params.require(:crew_member).permit(:name, :movie_id, :filmmaker_id, :job_id)
	end
end
