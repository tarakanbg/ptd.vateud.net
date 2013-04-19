class AddEvenMoreDatesToPilots < ActiveRecord::Migration
  def change
    add_column :pilots, :instructor_assigned_date, :datetime
  end
end
