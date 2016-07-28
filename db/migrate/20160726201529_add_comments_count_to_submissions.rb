class AddCommentsCountToSubmissions < ActiveRecord::Migration[5.0]
  def change
    add_column :submissions, :comments_count, :integer, default: 0
    add_column :challenges, :comments_count, :integer, default: 0
  end
end
