class AddChallengeToChallenges < ActiveRecord::Migration[5.0]
  def change
    add_column :challenges, :challenge, :text
  end
end
