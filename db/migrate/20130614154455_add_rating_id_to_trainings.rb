class AddRatingIdToTrainings < ActiveRecord::Migration
  def change
    add_column :trainings, :rating_id, :integer
  end
end
