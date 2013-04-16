class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.string :name
      t.integer :vatsimid
      t.string :email

      t.timestamps
    end
  end
end
