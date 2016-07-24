class AddParentIdToComment < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :parent_id, :integer
    remove_column :comments, :parrent_id
    add_index :comments, :parent_id
  end
end
