class AddJobToCrewMember < ActiveRecord::Migration
  def change
    add_reference :crew_members, :job, index: true
  end
end
