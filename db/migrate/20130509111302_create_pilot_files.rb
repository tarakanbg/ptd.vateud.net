class CreatePilotFiles < ActiveRecord::Migration
  def change
    create_table :pilot_files do |t|
      t.integer :user_id
      t.integer :pilot_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
