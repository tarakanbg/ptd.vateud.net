class AddScoreToPilots < ActiveRecord::Migration
  def change
    add_column :pilots, :theory_score, :decimal
    add_column :pilots, :practical_score, :decimal
    add_column :pilots, :notes, :text
  end
end
