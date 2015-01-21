class AddNameToFilmmakers < ActiveRecord::Migration
  def change
    add_column :filmmakers, :name, :string
  end
end
