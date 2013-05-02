class AddReadyForPracticalToPilots < ActiveRecord::Migration
  def change
    add_column :pilots, :ready_for_practical, :boolean, :default => false
  end
end
