class AddNotesToTrainings < ActiveRecord::Migration
  def change
    add_column :trainings, :notes, :text
  end
end
