class AddSlugToPilots < ActiveRecord::Migration
  def change
    add_column :pilots, :slug, :string
    add_index :pilots, :slug, unique: true
  end
end
