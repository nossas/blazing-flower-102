class MemberRegistrationController < Devise::RegistrationsController
  
  # GET /resource/sign_up  
  def new
    resource = build_resource({})
    if request.xhr?
      render :template => "/devise/registrations/new", :layout => false
    else
      render :template => "/devise/registrations/new" 
    end
  end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit  
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super 
  end

  # GET /resource/cancel
  def cancel
    super
  end
end
