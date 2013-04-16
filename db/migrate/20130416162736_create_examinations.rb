class CreateExaminations < ActiveRecord::Migration
  def change
    create_table :examinations do |t|
      t.datetime :date
      t.string :departure_airport
      t.string :destination_airport
      t.integer :examiner_id

      t.timestamps
    end
  end
end
