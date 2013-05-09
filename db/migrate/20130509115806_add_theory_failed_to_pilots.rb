class AddTheoryFailedToPilots < ActiveRecord::Migration
  def change
    add_column :pilots, :theory_failed, :boolean, :default => false
    add_column :pilots, :practical_failed, :boolean, :default => false
  end
end
