class AddCachesToComment < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :cached_user_name, :string
    add_column :comments, :cached_user_email, :string
  end
end
