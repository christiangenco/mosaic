class AddCachedSubmissionScoresToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :cached_submission_points, :text
    add_column :users, :cached_points, :integer
  end
end
