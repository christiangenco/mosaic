class AddDefault1ToChallengesPoints < ActiveRecord::Migration[5.0]
  def change
    change_column :challenges, :points, :integer, :default => 1
  end
end
