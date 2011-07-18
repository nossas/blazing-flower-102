class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    p = ProviderAuthorization.find_for_facebook_oauth(auth_data, current_member)
    if p.persisted?
      @member = p.member
      flash[:notice] = "Welcome #{@member.name}"
      sign_in_and_redirect @member, :event => :authentication
    else
      flash[:notice] = "You were unable to login"
      redirect_to root_url
    end
  end

  def google_apps
    p = ProviderAuthorization.find_for_google_apps_oauth(auth_data, current_member)
    if p
      gmail(p)
    else
      google_custom_domain
    end
  end

  def google_custom_domain
    session[:auth_data] = auth_data
    render :action => :google_custom_domain
  end

  def google_custom_domain_complete
    session[:auth_data]['user_info'].merge!({'email' => params['email']})
    p = ProviderAuthorization.find_for_google_apps_oauth(auth_data, current_member)
    gmail(p)
  end

  def gmail(provider_authorization)
    if provider_authorization.persisted?
      @member = provider_authorization.member
      flash[:notice] = "Welcome #{@member.name}"
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
