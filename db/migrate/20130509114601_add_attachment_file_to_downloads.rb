class AddAttachmentFileToDownloads < ActiveRecord::Migration
  def self.up
    change_table :downloads do |t|
      t.attachment :file
    end
  end

  def self.down
    drop_attached_file :downloads, :file
  end
end
