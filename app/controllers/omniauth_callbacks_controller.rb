class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    p = ProviderAuthorization.find_for_facebook_oauth(auth_data, current_member)
    if p.persisted?
      @member = p.member
      session[:fb_token] = auth_data["credentials"]["token"]
      sign_in_and_redirect @member, :event => :authentication
    else
      flash[:notice] = "You were unable to login"
      redirect_to root_url
    end
  end

  def google
    provider_authorization = ProviderAuthorization.find_for_google_oauth(auth_data, current_member)
    if provider_authorization.persisted?
      @member = provider_authorization.member
      session[:google_login] = true
      sign_in_and_redirect @member, :event => :authentication
    else
      flash[:notice] = "You were unable to login"
      redirect_to root_url
    end
  end

  protected
  def auth_data
    env["omniauth.auth"] || session[:auth_data]
  end
end
