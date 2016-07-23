class RemoveSubmissionsPointsDefault < ActiveRecord::Migration[5.0]
  def up
    change_column :submissions, :points, :integer, default: nil
  end
  def down

  end
end
