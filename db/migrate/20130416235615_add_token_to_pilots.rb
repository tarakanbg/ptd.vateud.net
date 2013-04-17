class AddTokenToPilots < ActiveRecord::Migration
  def change
    add_column :pilots, :token_issued, :boolean, :default => false
  end
end
