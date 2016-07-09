class AddTagsToChallenge < ActiveRecord::Migration[5.0]
  def change
    add_column :challenges, :tags, :text
  end
end
