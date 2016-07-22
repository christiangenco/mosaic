class AddPointsAndDeletedAtToSubmission < ActiveRecord::Migration[5.0]
  def change
    add_column :submissions, :deleted_at, :datetime
  end
end
