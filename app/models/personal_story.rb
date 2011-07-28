class PersonalStory < ActiveRecord::Base
  before_save :get_video_data

  belongs_to :issue

  validates_presence_of :issue
  validates_presence_of :title
  validates_presence_of :video_url

  validates_format_of :video_url, :with => /\Ahttps?:\/\/(\w+\.?)\w+\.\w{2,3}\/\S+/

  validates_inclusion_of :connected_action, :in => ['PETITION', 'DEBATE'], :allow_nil => true

  def get_video_data
    url = URI(self.video_url)
    url = case url.host
    when /vimeo\.com/
      response = HTTParty.get("http://vimeo.com/api/oembed.json?url=#{url}&maxwidth=375&title=false&byline=false") 
      if parsed_response = response.parsed_response
        self.video_embed_code = response["html"]
        self.thumbnail = response["thumbnail_url"]
      end
    when /youtube\.com/
      id = Hash[url.query.split("&").map { |p| p.split("=")  }]["v"]
      self.video_embed_code = "<iframe class='youtube-player' type='text/html' width='375' height='385' src='http://www.youtube.com/embed/#{id}' frameborder='0'></iframe>"      
      self.thumbnail = "http://img.youtube.com/vi/#{id}/0.jpg"
    else
      response = []
      Net::HTTP.start(url.host, url.port) { |http| response = http.head([ url.path, url.query ].compact.join("?")) }
      self.video_embed_code = url.to_s if [ "image/jpeg", "image/png", "image/gif" ].include?(response["content-type"])

      self.thumbnail = video_url.to_s
    end
  end

end
