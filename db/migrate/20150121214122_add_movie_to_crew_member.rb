class AddMovieToCrewMember < ActiveRecord::Migration
  def change
    add_reference :crew_members, :movie, index: true
  end
end
