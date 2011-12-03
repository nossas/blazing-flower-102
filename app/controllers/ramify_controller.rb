class RamifyController < ApplicationController
  def create_session
    uri = URI(SITE['ramify_auth_address'])
    res = Net::HTTP.post_form(uri, 'uid' => current_member.id, 'api_secret' => SITE['ramify_key'])
    render :json => res.body
  end
end
