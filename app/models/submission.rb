class Submission < ApplicationRecord
  belongs_to :challenge
  belongs_to :user

  def public?
    !is_private
  end

  def viewable_by?(user)
    user.try(:admin?) || user_id == user.id
  end
end
