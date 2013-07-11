class CreateNewbies < ActiveRecord::Migration
  def change
    create_table :newbies do |t|
      t.string :name
      t.string :email
      t.integer :vatsimid
      t.string :country
      t.string :slug

      t.timestamps
    end
    add_index :newbies, :slug, unique: true
  end
end
