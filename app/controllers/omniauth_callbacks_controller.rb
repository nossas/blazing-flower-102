class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model
    @member = Member.find_for_facebook_oauth(env["omniauth.auth"], current_member)

    if @member.persisted?
      flash[:notice] = "You signed in as #{@member.name}"
      sign_in_and_redirect @member, :event => :authentication
    end
  end
end
