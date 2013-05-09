class AddAttachmentFileToPilotFiles < ActiveRecord::Migration
  def self.up
    change_table :pilot_files do |t|
      t.attachment :file
    end
  end

  def self.down
    drop_attached_file :pilot_files, :file
  end
end
