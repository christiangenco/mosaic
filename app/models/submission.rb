class Submission < ApplicationRecord
  belongs_to :challenge
  belongs_to :user
  acts_as_votable

  def public?
    !is_private
  end

  def viewable_by?(user)
    public? || user.try(:admin?) || user_id == user.try(:id)
  end
end
