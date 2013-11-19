class CreateJoinTableExaminationsPilots < ActiveRecord::Migration
  def change
    create_table :examinations_pilots do |t|
      t.integer :examination_id
      t.integer :pilot_id
    end
  end
end
