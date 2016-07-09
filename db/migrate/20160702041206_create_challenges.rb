class CreateChallenges < ActiveRecord::Migration[5.0]
  def change
    create_table :challenges do |t|
      t.text :description
      t.string :name
      t.boolean :is_locked

      t.timestamps
    end
  end
end
