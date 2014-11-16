class RolesController < ApplicationController

  def new
    @role = Role.new
    @movies = Movie.all.sort { |a,b| a.title <=> b.title }
    @actors = Actor.all.sort { |a,b| a.name <=> b.name }
  end

  def create
    @role = Role.create(role_params)
    suckr = ImageSuckr::GoogleSuckr.new
    @role.image = suckr.get_image_file({"q" => @role.actor.name + " " + @role.movie.title})
    if @role.save && @role.image != nil
      redirect_to movie_path(@role.movie.id)
    else 
      @role.destroy
      redirect_to root_path
    end
  end

  def edit
    @role = Role.find(params[:id])
    suckr = ImageSuckr::GoogleSuckr.new
    @role.image = suckr.get_image_file({"q" => @role.actor.name + " " + @role.movie.title})
    if @role.save && @role.image != nil
      redirect_to movie_path(@role.movie.id)
    else 
      @role.destroy
      redirect_to root_path
    end
  end

  def destroy
    @role = Role.find(params[:id])
    movie_id = @role.movie.id
    @role.destroy
    redirect_to movie_path(movie_id)
  end

  private
  def role_params
    params.require(:role).permit(:name, :movie_id, :actor_id)
  end

end