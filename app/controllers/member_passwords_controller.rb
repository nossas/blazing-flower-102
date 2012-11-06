class MemberPasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  def new
    build_resource({})
    render "devise/passwords/new"
  end

  # POST /resource/password
  def create
    self.resource = resource_class.send_reset_password_instructions(params[resource_name])

    if successful_and_sane?(resource)
      session[:password_reset_member_email] = params[resource_name]
      set_flash_message(:notice, :send_instructions)
			respond_to do |format|
      	format.html { redirect_to root_path }
				format.json { render :json => {:success => true, :flash =>  flash[:notice]} }
			end
    else
      return render :json => { :success => false, :errors => resource.errors.full_messages }
    end
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  def edit
    self.resource = resource_class.new
    resource.reset_password_token = params[:reset_password_token]
    render "devise/passwords/edit"
  end

  def resend
    if session[:password_reset_member_email]
      self.resource = resource_class.send_reset_password_instructions(session[:password_reset_member_email])
      set_flash_message(:notice, :send_instructions) if is_navigational_format?      
    end
    render "devise/passwords/thank_you"
  end

  # PUT /resource/password
  def update
    self.resource = resource_class.reset_password_by_token(params[resource_name])

    if resource.errors.empty?
      flash_message = resource.active_for_authentication? ? :updated : :updated_not_active
      set_flash_message(:notice, flash_message)
      sign_in(resource_name, resource)
      respond_with resource, :location => root_path
    else
      respond_with_navigational(resource){ render_with_scope :edit }
    end
  end

end
