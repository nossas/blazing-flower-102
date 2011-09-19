# coding: utf-8

class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    provider_authorization = ProviderAuthorization.find_for_facebook_oauth(auth_data, current_member)
    if provider_authorization.persisted?
      @member = provider_authorization.member
      session[:fb_token] = auth_data["credentials"]["token"]

      # Hack because we can't tell if provider_authorization is a new_record?
      if provider_authorization.created_at > 3.seconds.ago
        flash[:welcome] = "<b>Seja bem-vindo!</b> Agora você faz parte da comunidade do Meu Rio."
        MemberMailer.delay.welcome(@member)
      end

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

      # Hack because we can't tell if provider_authorization is a new_record?
      if provider_authorization.created_at > 3.seconds.ago
        flash[:welcome] = "<b>Seja bem-vindo!</b> Agora você faz parte da comunidade do Meu Rio."
        MemberMailer.delay.welcome(@member)
      end

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
