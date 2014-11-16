class AddAttachmentImageToRoles < ActiveRecord::Migration
  def self.up
    change_table :roles do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :roles, :image
  end
end
