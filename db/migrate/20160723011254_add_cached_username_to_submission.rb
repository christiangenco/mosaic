class AddCachedUsernameToSubmission < ActiveRecord::Migration[5.0]
  def change
    add_column :submissions, :cached_username, :string
  end
end
