class MemberRegistrationController < Devise::RegistrationsController
  def new
    resource = build_resource({})
    if request.xhr?
      render :template => "/devise/registrations/new", :layout => false
    else
      render :template => "/devise/registrations/new" 
    end
  end
end
