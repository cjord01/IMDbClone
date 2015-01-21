class CreateCrewMembers < ActiveRecord::Migration
  def change
    create_table :crew_members do |t|
    	t.belongs_to :movie
    	t.belongs_to :filmmaker
    	t.belongs_to :job

      t.timestamps
    end
  end
end
