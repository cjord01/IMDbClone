class AddAttachmentImageToMovies < ActiveRecord::Migration
  def self.up
    change_table :movies do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :movies, :image
  end
end
