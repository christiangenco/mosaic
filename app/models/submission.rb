class Submission < ApplicationRecord
  belongs_to :challenge, counter_cache: true
  belongs_to :user
  acts_as_votable
  serialize :cached_user_ids_liked, Array
  before_create :refresh_cached_username

  def public?
    !is_private
  end

  def viewable_by?(user)
    public? || user.try(:admin?) || user_id == user.try(:id)
  end

  def refresh_cached_username
    self.cached_username = user.try(:display_name)
  end

  def update_cached_username
    refresh_cached_username
    save
  end

  # def unliked_by(user)
  #   puts "unliking"
  #   # super(user)
  # end

  # def liked_by(user)
  #   puts "liking"
  #   # super(user)
  # end
end
