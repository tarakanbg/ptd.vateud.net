class AddActiveToInstructors < ActiveRecord::Migration
  def change
    add_column :instructors, :active, :boolean, :default => true
  end
end
