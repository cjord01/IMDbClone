class CreateFilmmakers < ActiveRecord::Migration
  def change
    create_table :filmmakers do |t|
    	t.string :name

      t.timestamps
    end
  end
end
