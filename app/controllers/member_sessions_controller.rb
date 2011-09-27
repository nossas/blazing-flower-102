class MemberSessionsController < Devise::SessionsController
  def destroy
    session[:fb_token] = nil
    session[:google_login] = nil
    super
  end

  def google_logout
    redirect_to("https://www.google.com/accounts/Logout")
  end

  def facebook_logout
    split_token = session[:fb_token].split("|")
    fb_api_key = split_token[0]
    fb_session_key = split_token[1]
    redirect_to "http://www.facebook.com/logout.php?api_key=#{fb_api_key}&session_key=#{fb_session_key}&confirm=1&next=#{destroy_member_session_url}";
  end
end
