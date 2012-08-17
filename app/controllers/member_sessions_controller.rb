class MemberSessionsController < Devise::SessionsController
  def new
    resource = build_resource
    if request.xhr?
      clean_up_passwords(resource)
      render :template => "/devise/sessions/new", :layout => false
    end
  end

  def create
    resource = warden.authenticate(:scope => resource_name, :recall => "#{controller_path}#new")
    if resource
      set_flash_message(:notice, :signed_in) if is_navigational_format?
      sign_in(resource_name, resource)
      return render :json => { :logged_in => true, :flash => flash[:notice], :doorkeeper_redirect => session.delete(:doorkeeper_redirect) }
    else
      return render :json => { :logged_in => false }
    end
  end

  def destroy
    session[:fb_token] = nil
    session[:google_login] = nil
    super
  end

  def google_logout
    redirect_to destroy_member_session_path
  end

  def facebook_logout
    redirect_to destroy_member_session_path
  end
end
