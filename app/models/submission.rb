class Submission < ApplicationRecord
  belongs_to :challenge, counter_cache: true
  belongs_to :user
  acts_as_votable
  serialize :cached_user_ids_liked, Array
  before_create :refresh_cached_username
  after_commit :update_user_cached_submission_points
  # after_save :update_user_cached_submission_points
  # before_save :update_user_cached_submission_points

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

  def update_cached_votes(vote_scope)
    self.cached_user_ids_liked = votes_for.pluck(:voter_id)
    save
    super(vote_scope)
  end

  def voted_on_by? voter
    # super(voter)
    cached_user_ids_liked.include?(voter.id)
  end

  def update_user_cached_submission_points
    if true || id_changed? || points_changed? || points_previously_changed?
      highest = Submission.where(challenge_id: challenge_id, user_id: user_id).order(points: :desc).limit(1).pluck(:points).first
      user.update(cached_submission_points: user.cached_submission_points.merge({challenge_id => highest}))
    end
  end
end
