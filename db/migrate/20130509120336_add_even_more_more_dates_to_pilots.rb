class AddEvenMoreMoreDatesToPilots < ActiveRecord::Migration
  def change
    add_column :pilots, :theory_failed_date, :datetime
    add_column :pilots, :practical_failed_date, :datetime
  end
end
