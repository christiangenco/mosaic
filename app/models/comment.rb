class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true, counter_cache: true
  before_create :refresh_cached_user_params

  def refresh_cached_user_params
    self.cached_user_name = user.display_name
    self.cached_user_email = user.email
  end
end
