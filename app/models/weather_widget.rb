class WeatherWidget < Widget

  def self.weather
    Rails.cache.fetch("weather", :expires_in => 60.minutes) do
      result = HTTParty.get("http://weather.yahooapis.com/forecastrss?w=455825&u=c")
      result = result['rss']['channel']
    end
  end

  def self.parse_time(time)
    matches = time.match(/^(\d{1,2}):(\d{1,2})\s+([a|p]m)$/)
    hour = matches[1].to_i
    minute = matches[2].to_i
    meridian = matches[3]
    if meridian == "pm"
      hour = hour + 12
    end
    time = Time.zone.now
    return Time.zone.local(time.year, time.month, time.day, hour, minute)
  end

end
