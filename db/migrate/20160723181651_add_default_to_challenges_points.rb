class AddDefaultToChallengesPoints < ActiveRecord::Migration[5.0]
  def change
    change_column :challenges, :points, :integer, :default => 0
  end
end
