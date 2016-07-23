class AddDefaultToCachedPoints < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :cached_points, :integer, :default => 0
  end
end
