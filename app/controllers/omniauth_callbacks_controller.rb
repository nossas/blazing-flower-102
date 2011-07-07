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

  protected
  def auth_data
    env["omniauth.auth"]
  end
end
