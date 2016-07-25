namespace :cache do
  task :reset => :environment do
    Challenge.find_each{|challenge|
      Challenge.reset_counters(challenge.id, :submissions)
    }

    User.find_each{|user|
      user.update_cached_submission_points!
    }
  end
end
