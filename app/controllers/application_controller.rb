class ApplicationController < ActionController::Base
  protect_from_forgery

 # Overwriting the sign_out and sign_in redirect path method
  def after_sign_in_path_for(resource_or_scope)
    return_path = session.delete(:return_path)
    request.env['omniauth.origin'] || return_path || request.referrer || super
  end

  def after_sign_out_path_for(resource_or_scope)
    request.referrer || super
  end

  def render_404
    render :template => "errors/error_404", :layout => 'application', :status => 404
  end
end
