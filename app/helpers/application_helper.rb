module ApplicationHelper
  require 'twitter'
  require 'httparty'

  def nav_issues
    @nav_issues ||= Issue.order('id DESC')
  end

  def clippy(text, bgcolor='#FFFFFF')
    html = <<-EOF
    <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
            width="110"
            height="14"
            id="clippy" >
    <param name="movie" value="/assets/clippy.swf"/>
    <param name="allowScriptAccess" value="always" />
    <param name="quality" value="high" />
    <param name="scale" value="noscale" />
    <param NAME="FlashVars" value="text=#{text}&label=#{t("petition_show.click_to_copy")}&feedback=#{t("petition_show.copied")}" />
    <param name="bgcolor" value="#{bgcolor}" />
    <embed src="/assets/clippy.swf"
           width="110"
           height="14"
           name="clippy"
           quality="high"
           allowScriptAccess="always"
           type="application/x-shockwave-flash"
           pluginspage="http://www.macromedia.com/go/getflashplayer"
           FlashVars="text=#{text}&label=#{t("petition_show.click_to_copy")}&feedback=#{t("petition_show.copied")}"
           bgcolor="#{bgcolor}"
    />
    </object>
    EOF
  end

  def meu_rio_tweets
    begin
      Rails.cache.fetch("tweets", :expires_in => 30.minutes) do
        result = Twitter.user_timeline('meu_rio').first
      end
    rescue
      "Tweets could not be loaded= #{$!}"
    end
  end

  def weather_category
    thunder = [0, 1, 2, 3, 4, 37, 38, 39, 40, 45, 46, 47]
    rain = [5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 35, 41, 42, 43]
    cloudy = [19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 31, 44, 30]
    sunny = [31, 32, 33, 34, 36]

    conditions_hash = { :thunder => thunder, :rain => rain, :cloudy => cloudy, :sunny => sunny }
    return conditions_hash.select{ |key, conditions| conditions.include? WeatherWidget.weather['item']['yweather:condition']['code'].to_i }.keys.first.to_s
  end

  def day_or_night 
    time = Time.zone.now
    if ( time > WeatherWidget.parse_time(WeatherWidget.weather["yweather:astronomy"]["sunset"]) ) || ( time < WeatherWidget.parse_time(WeatherWidget.weather["yweather:astronomy"]["sunrise"]) )
      return "night"
    else
      return "day"
    end 
  end

end
