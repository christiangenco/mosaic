class AddSubmissionsCountToChallenges < ActiveRecord::Migration[5.0]
  def change
    add_column :challenges, :submissions_count, :integer

    Challenge.find_each{|c| Challenge.reset_counters(c.id, :submissions)}
  end
end
