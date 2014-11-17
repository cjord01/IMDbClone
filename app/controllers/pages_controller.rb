class PagesController < ApplicationController
  def home
  	@movies = Movie.all
  	@actors = Actor.all
  	@roles = Role.all
  end

  def about
  end
end
