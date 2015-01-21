class AddAttachmentImageToFilmmakers < ActiveRecord::Migration
  def self.up
    change_table :filmmakers do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :filmmakers, :image
  end
end
