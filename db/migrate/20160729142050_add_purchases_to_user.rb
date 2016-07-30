class AddPurchasesToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :purchases, :text
  end
end
