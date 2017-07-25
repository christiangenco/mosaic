class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true, counter_cache: true
  before_create :refresh_cached_user_params
  after_commit :send_notification

  private

  def refresh_cached_user_params
    self.cached_user_name = user.display_name
    self.cached_user_email = user.email
  end

  def send_notification
    # title = "New Comment"
    # path = nil

    if commentable_type == "Submission"
      submission = commentable
      title = "New Comment on #{submission.challenge.title} from #{user.display_name}"
      path = Rails.application.routes.url_helpers.challenge_submission_path(submission.challenge_id, submission)

      # notify each user that's commented, and the owner of this submission, but not the commenter
      users = (submission.comments.map(&:user) + [submission.user]).uniq - [user]

      users.each{|u|
        NotificationsChannel.broadcast_to(u, {
          title: title,
          body: body,
          path: path,
        })
      }
    end
  end
end
