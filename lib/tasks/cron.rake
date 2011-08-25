desc "This task is called by the Heroku cron add-on"
task :cron => :environment do
  #Schedule 4 twitter checks over the next hour
  3.times do |i|
    Twitter.delay(:run_at => Time.zone.now + (i * 15)).refresh_latest_tweet
  end
end
