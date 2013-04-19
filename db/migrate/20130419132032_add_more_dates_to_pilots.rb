class AddMoreDatesToPilots < ActiveRecord::Migration
  def change
    add_column :pilots, :token_issued_date, :datetime
    add_column :pilots, :theory_passed_date, :datetime
    add_column :pilots, :practical_passed_date, :datetime
    add_column :pilots, :upgraded_date, :datetime
  end
end
