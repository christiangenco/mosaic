class AddCachedUserIdsLikedToSubmissions < ActiveRecord::Migration[5.0]
  def change
    add_column :submissions, :cached_user_ids_liked, :text
  end
end
