class AddPointsToChallenge < ActiveRecord::Migration[5.0]
  def change
    add_column :challenges, :points, :integer
  end
end
