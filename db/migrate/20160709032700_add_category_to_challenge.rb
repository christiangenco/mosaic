class AddCategoryToChallenge < ActiveRecord::Migration[5.0]
  def change
    add_column :challenges, :category, :string
  end
end
