require 'test_helper'

class SubmissionTest < ActiveSupport::TestCase
  test "user ids are cached in submissions" do
    u = users(:admin)
    s = submissions(:one)

    assert s.cached_user_ids_liked.empty?

    u.likes(s)
    assert s.cached_user_ids_liked.include?(u.id)

    s.unliked_by(u)
    assert !s.cached_user_ids_liked.include?(u.id)
  end

  test "user can like submission" do
    u = users(:admin)
    s = submissions(:one)

    assert_equal false, u.voted_up_on?(s)
    assert_equal false, u.voted_for?(s)

    u.likes(s)
    assert_equal true, u.voted_up_on?(s)
    assert_equal true, u.voted_for?(s)

    s.unliked_by(u)
    assert_equal false, u.voted_up_on?(s)
    assert_equal false, u.voted_for?(s)
  end
end
