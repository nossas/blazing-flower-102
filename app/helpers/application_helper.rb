module ApplicationHelper
  require 'httparty'

  def video_share_url(video_link)
    url = URI(video_link)
    id = Hash[url.query.split("&").map { |p| p.split("=")  }]["v"]
    id ? "http://youtube.com/v/#{id}?version=3&amp;autohide=1" : video_link
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

  def about_petition_link
    petition = Petition.where(:state => 'published').last
    link_to t("about_page.petition_link"), issue_custom_petition_path(petition.issue_id, petition.custom_path) if petition
  end

  def weather_category
    thunder = [0, 1, 2, 3, 4, 37, 38, 39, 40, 45, 46, 47]
    rain = [5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 35, 41, 42, 43]
    cloudy = [19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 31, 44, 30]
    sunny = [31, 32, 33, 34, 36]

    conditions_hash = { :thunder => thunder, :rain => rain, :cloudy => cloudy, :sunny => sunny }
    return conditions_hash.select{ |key, conditions| conditions.include? WeatherWidget.weather['item']['condition']['code'].to_i }.keys.first.to_s
  end

  def day_or_night
    time = Time.zone.now
    if ( time > WeatherWidget.parse_time(WeatherWidget.weather["astronomy"]["sunset"]) ) || ( time < WeatherWidget.parse_time(WeatherWidget.weather["astronomy"]["sunrise"]) )
      return "night"
    else
      return "day"
    end
  end

  def custom_devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:div, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
    <div id="errors" style="display:block">
    #{messages}
    </div>
    <br />
    HTML

    html.html_safe
  end


end
