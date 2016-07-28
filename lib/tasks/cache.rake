namespace :cache do
  task :reset => :environment do
    Challenge.find_each{|challenge|
      Challenge.reset_counters(challenge.id, :submissions)
      Challenge.reset_counters(challenge.id, :comments)
    }

    Submission.find_each{|submission|
      Submission.reset_counters(submission.id, :comments)
    }

    User.find_each{|user|
      user.update_cached_submission_points!
    }
  end
end
