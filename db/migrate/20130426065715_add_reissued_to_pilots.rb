class AddReissuedToPilots < ActiveRecord::Migration
  def change
    add_column :pilots, :token_reissued, :boolean, :default => false
    add_column :pilots, :token_reissued_date, :datetime
  end
end
