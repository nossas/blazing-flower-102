class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model
    #
    # p = ProviderAutorization.find_for_facebook_oauth(auth_data, current_member)
    # if p
    #   @member = p.member
    #   flash = "You're logged in"
    #   redirect root_url
    # else
    #   flash = "Somehting went wrong"
    #   redirect root_url
    # end
    #
    @member = Member.find_for_facebook_oauth(auth_data, current_member)

    if @member.persisted?
      flash[:notice] = "You signed in as #{@member.name}"
      return sign_in_and_redirect @member, :event => :authentication
    else
      logger.warn(@member.errors.to_yaml)
      return redirect_to root_path
    end
  end
  protected
  def auth_data
    env["omniauth.auth"]
  end
end
