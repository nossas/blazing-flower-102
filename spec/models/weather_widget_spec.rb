require "spec_helper"

describe WeatherWidget do
  before(:each) do
    Rails.cache.clear
    HTTParty.stub(:get).and_return(WEATHER_VALID_API_RESPONSE)
  end
  
  describe "#weather" do
    it "should return #refresh_weather if cache is not populated" do
      WeatherWidget.weather.should == SHORTENED_WEATHER_VALID_API_RESPONSE
    end

    it "should return weather data if cache is populated from API" do
      Rails.cache.write("weather", WEATHER_VALID_API_RESPONSE)
      WeatherWidget.weather.should == WEATHER_VALID_API_RESPONSE
    end
  end

  describe "#refresh_weather" do
    describe "valid yahoo api response" do
      before(:each) do
        HTTParty.stub(:get).and_return(WEATHER_VALID_API_RESPONSE)
      end


      it "should populate the cache" do
        Rails.cache.read("weather").should be_nil
        WeatherWidget.refresh_weather

        WeatherWidget.weather.should == SHORTENED_WEATHER_VALID_API_RESPONSE
      end
    end

    describe "invalid yahoo api response" do
      before(:each) do
        HTTParty.stub(:get).and_raise("NOPE")
      end 

      it "should not populate the cache if cached weather report exists" do
        Rails.cache.write("weather", SHORTENED_WEATHER_VALID_API_RESPONSE)

        WeatherWidget.refresh_weather
        WeatherWidget.weather.should == SHORTENED_WEATHER_VALID_API_RESPONSE
      end

      it "should populate the cache if a cached weather report does not exist" do
        Rails.cache.clear

        WeatherWidget.refresh_weather
        WeatherWidget.weather.should == {"title"=>"Yahoo! Weather - Rio de Janeiro, BR", "yweather:astronomy"=>{"sunrise"=>"6:10 am", "sunset"=>"5:41 pm"}, "item"=>{"title"=>"Conditions for Rio de Janeiro, BR at 5:00 pm LST", "geo:lat"=>"-22.98", "geo:long"=>"-43.2", "link"=>"http://us.rd.yahoo.com/dailynews/rss/weather/Rio_de_Janeiro__BR/*http://weather.yahoo.com/forecast/BRXX0201_c.html", "pubDate"=>"Thu, 25 Aug 2011 5:00 pm LST", "yweather:condition"=>{"text"=>"Partly Cloudy", "code"=>"30", "temp"=>"24", "date"=>"Thu, 25 Aug 2011 5:00 pm LST"}, "yweather:forecast"=>[{"day"=>"Thu", "date"=>"25 Aug 2011", "low"=>"20", "high"=>"24", "text"=>"Clear", "code"=>"31"}], "guid"=>"BRXX0201_2011_08_26_7_00_LST"}}
      end
    end
  end

end
