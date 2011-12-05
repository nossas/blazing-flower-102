class RamifyController < ApplicationController
  def create_session
    uri = URI(SITE['ramify_auth_address'])
    res = Net::HTTP.post_form(uri, 'uid' => current_member.id, 'name' => current_member.name, 'api_secret' => SITE['ramify_key'])
    render :json => res.body
  end

  def destroy_session
    uri = URI(SITE['ramify_logout_address'])
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE # read into this
    res = Net::HTTP::Get.new(uri.request_uri)
    render :json => res
  end
end
