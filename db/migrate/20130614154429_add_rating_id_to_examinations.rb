class AddRatingIdToExaminations < ActiveRecord::Migration
  def change
    add_column :examinations, :rating_id, :integer
  end
end
