class CreateJoinTablePilotsTrainings < ActiveRecord::Migration
  def change
    create_table :pilots_trainings do |t|
      t.integer :pilot_id
      t.integer :training_id
    end
  end
end
