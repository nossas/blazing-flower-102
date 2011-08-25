desc "This task is called by the Heroku cron add-on"
task :cron => :environment do
  #Schedule 4 twitter checks over the next hour
  4.times do |i|
    TwitterWidget.delay(:run_at => Time.zone.now + (i * 15).minutes).refresh_latest_tweet
  end
end
