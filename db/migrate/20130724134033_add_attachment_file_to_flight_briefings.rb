class AddAttachmentFileToFlightBriefings < ActiveRecord::Migration
  def self.up
    change_table :flight_briefings do |t|
      t.attachment :file
    end
  end

  def self.down
    drop_attached_file :flight_briefings, :file
  end
end
