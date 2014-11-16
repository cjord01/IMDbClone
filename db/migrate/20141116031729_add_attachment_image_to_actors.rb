class AddAttachmentImageToActors < ActiveRecord::Migration
  def self.up
    change_table :actors do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :actors, :image
  end
end
