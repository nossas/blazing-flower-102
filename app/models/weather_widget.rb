class WeatherWidget < Widget

  def self.weather
    Rails.cache.fetch("weather") do
      self.refresh_weather
    end
  end

  def self.refresh_weather
    begin
      result = HTTParty.get("http://weather.yahooapis.com/forecastrss?w=455825&u=c")
      result = result['rss']['channel']
    rescue
      if Rails.cache.read("weather").blank?
        result = {"title"=>"Yahoo! Weather - Rio de Janeiro, BR", "astronomy"=>{"sunrise"=>"6:10 am", "sunset"=>"5:41 pm"}, "item"=>{"title"=>"Conditions for Rio de Janeiro, BR at 5:00 pm LST", "geo:lat"=>"-22.98", "geo:long"=>"-43.2", "link"=>"http://us.rd.yahoo.com/dailynews/rss/weather/Rio_de_Janeiro__BR/*http://weather.yahoo.com/forecast/BRXX0201_c.html", "pubDate"=>"Thu, 25 Aug 2011 5:00 pm LST", "condition"=>{"text"=>"Partly Cloudy", "code"=>"30", "temp"=>"24", "date"=>"Thu, 25 Aug 2011 5:00 pm LST"}, "forecast"=>[{"day"=>"Thu", "date"=>"25 Aug 2011", "low"=>"20", "high"=>"24", "text"=>"Clear", "code"=>"31"}], "guid"=>"BRXX0201_2011_08_26_7_00_LST"}}  
        logger.warn("Unable to contact the Yahoo Weather API, exception: #{$!}")
      else
        result = self.weather
      end
    end
    Rails.cache.write("weather", result)
    return result
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
