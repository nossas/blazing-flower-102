desc "This task is called by the Heroku cron add-on"
task :cron => :environment do
  #Schedule 4 twitter checks over the next hour
  4.times do |i|
    TwitterWidget.delay(:run_at => Time.zone.now + (i * 15).minutes).refresh_latest_tweet
  end

  if Time.now.hour % 2 == 0
    puts "Updating weather..."
    WeatherWidget.refresh_weather
  end
end
