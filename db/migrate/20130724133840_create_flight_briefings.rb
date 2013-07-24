class CreateFlightBriefings < ActiveRecord::Migration
  def change
    create_table :flight_briefings do |t|
      t.string :name
      t.string :departure
      t.string :destination
      t.text :description

      t.timestamps
    end
  end
end
