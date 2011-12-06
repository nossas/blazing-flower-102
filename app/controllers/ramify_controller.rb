class RamifyController < ApplicationController
  def create_session
    uri = URI(SITE['ramify_auth_address'])
    res = nil
    Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      req = Net::HTTP::Post.new uri.request_uri
      req.set_form_data 'uid' => current_member.id, 'name' => current_member.name, 'api_secret' => SITE['ramify_key']
      res = http.request req
    end
    render :json => res.body
  end

  def destroy_session
    uri = URI(SITE['ramify_logout_address'])
    res = nil
    Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      req = Net::HTTP::Post.new uri.request_uri
      res = http.request req
    end
    render :json => res.body
  end
end
