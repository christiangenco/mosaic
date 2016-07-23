require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "score is cached" do
    s = submissions(:one)
    c2 = challenges(:two)

    assert s.user.cached_submission_points.empty?

    s.update(points: 5)
    # u.update(cached_submission_points: {s.id => 1}) ##

    assert !s.user.cached_submission_points.empty?, "cached_submission_points is empty"
    assert s.user.cached_submission_points[s.challenge_id], "no value for the submission's id"
    assert_equal 5, s.user.cached_submission_points[s.challenge_id], "value for the submission's id is wrong"

    s2 = Submission.create(challenge_id: s.challenge_id, user_id: s.user_id, points: 2)
    assert_equal 5, s2.user.cached_submission_points[s2.challenge_id], "cached score is not the highest"

    s3 = Submission.create(challenge_id: c2.id, user_id: s.user_id, points: 2)
    assert_equal 5, s3.user.cached_submission_points[s.challenge_id], "old score was overridden"
    assert_equal 2, s3.user.cached_submission_points[s3.challenge_id], "new score was not saved"
  end
end
