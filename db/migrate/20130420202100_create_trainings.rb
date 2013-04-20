class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.datetime :date
      t.integer :instructor_id
      t.string :departure_airport
      t.string :destination_airport

      t.timestamps
    end
  end
end
