class CreateSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :submissions do |t|
      t.references :challenge, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :is_private, default: false
      t.datetime :approved_at
      t.datetime :denied_at
      t.string :url
      t.text :content
      t.integer :points, default: 0

      t.timestamps
    end
  end
end
