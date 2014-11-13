class RolesController < ApplicationController

  def new
    @role = Role.new
    @movies = Movie.all.sort { |a,b| a.title <=> b.title }
    @actors = Actor.all.sort { |a,b| a.name <=> b.name }
  end

  def create
    @role = Role.create(role_params)
    redirect_to movie_path(@role.movie.id)
  end

  private
  def role_params
    params.require(:role).permit(:name, :movie_id, :actor_id)
  end

end