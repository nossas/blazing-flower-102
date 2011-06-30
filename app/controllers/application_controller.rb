class ApplicationController < ActionController::Base
  protect_from_forgery

  def render_404
    render :template => "errors/error_404", :layout => 'application', :status => 404
  end
end
