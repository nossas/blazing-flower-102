class RamifyController < ApplicationController
  def create_session
    uri = URI(SITE['ramify_auth_address'])
    res = Net::HTTP.post_form(uri, 'uid' => current_member.id, 'name' => current_member.name, 'api_secret' => SITE['ramify_key'])
    render :json => res.body
  end

  def destroy_session
    uri = URI(SITE['ramify_logout_address'])
    res = nil
    Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      request = Net::HTTP::Post.new uri.request_uri
      res = http.request request
    end
    render :json => res.body
  end
end
