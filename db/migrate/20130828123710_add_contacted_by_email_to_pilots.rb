class AddContactedByEmailToPilots < ActiveRecord::Migration
  def change
    add_column :pilots, :contacted_by_email, :boolean, :default => false
  end
end
