class CreateAtcRatings < ActiveRecord::Migration
  def change
    create_table :atc_ratings do |t|
      t.string :name
      t.integer :priority

      t.timestamps
    end
  end
end
