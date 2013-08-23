class AddActiveToExaminers < ActiveRecord::Migration
  def change
    add_column :examiners, :active, :boolean, :default => true
  end
end
