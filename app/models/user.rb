class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :submissions
  serialize :cached_submission_points, Hash
  serialize :purchases, Hash
  acts_as_voter
  before_save :update_cached_points

  def admin?
    email == "christian.genco@gmail.com"
  end

  def display_name
    username || name || email
  end

  def update_cached_points
    if cached_submission_points_changed? || purchases_changed?
      spent = purchases.values.compact.inject(&:+) || 0
      self.cached_points = cached_submission_points.values.compact.inject(&:+) - spent
    end
  end

  def update_cached_submission_points!
    update(cached_submission_points: Hash[submissions.order(points: :asc).pluck(:challenge_id, :points)])
  end
end
