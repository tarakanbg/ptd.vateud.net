class CreatePilots < ActiveRecord::Migration
  def change
    create_table :pilots do |t|
      t.string :name
      t.integer :rating_id
      t.integer :vatsimid
      t.string :email
      t.string :vacc
      t.integer :instructor_id
      t.integer :examination_id
      t.integer :atc_rating_id
      t.integer :division_id
      t.boolean :theory_passed, :default => false
      t.boolean :practical_passed, :default => false
      t.boolean :upgraded, :default => false

      t.timestamps
    end
  end
end
