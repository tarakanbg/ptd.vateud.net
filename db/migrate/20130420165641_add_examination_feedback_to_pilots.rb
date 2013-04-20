class AddExaminationFeedbackToPilots < ActiveRecord::Migration
  def change
    add_column :pilots, :examination_feedback, :text
  end
end
