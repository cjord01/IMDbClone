class AddFilmmakerToCrewMember < ActiveRecord::Migration
  def change
    add_reference :crew_members, :filmmaker, index: true
  end
end
