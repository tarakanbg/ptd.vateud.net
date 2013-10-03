class AddTheoryExpiredToPilots < ActiveRecord::Migration
  def change
    add_column :pilots, :theory_expired, :boolean, :default => false
  end
end
