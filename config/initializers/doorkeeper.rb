Doorkeeper.configure do
  # This block will be called to check whether the
  # resource owner is authenticated or not
  resource_owner_authenticator do |routes|
    # Put your resource owner authentication logic here.
    # If you want to use named routes from your app you need
    # to call them on routes object eg.
    # routes.new_user_session_path
    # e.g. User.find_by_id(session[:user_id]) || redirect_to(routes.new_user_session_path)
    session[:doorkeeper_redirect] = request.url
    current_member || redirect_to("/members/sign_in")
  end

  # If you want to restrict the access to the web interface for
  # adding oauth authorized applications you need to declare the
  # block below
  admin_authenticator do |routes|
    # Put your admin authentication logic here.
    # If you want to use named routes from your app you need
    # to call them on routes object eg.
    # routes.new_admin_session_path
    redirect_to routes.root_path
  end

  # Access token expiration time (default 2 hours)
  access_token_expires_in 2.years

  # Issue access tokens with refresh token (disabled by default)
  # use_refresh_token

  # Define access token scopes for your provider
  # For more information go to https://github.com/applicake/doorkeeper/wiki/Using-Scopes
  # authorization_scopes do
  #   scope :public, :default => true, :description => "The public one"
  #   scope :write,  :description => "Updating information"
  # end
end
