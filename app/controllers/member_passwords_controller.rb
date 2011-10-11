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
      render "devise/passwords/thank_you"
    else
      respond_with_navigational(resource){ render_with_scope :new }
    end
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  def edit
    super
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
      respond_with resource, :location => after_sign_in_path_for(resource)
    else
      respond_with_navigational(resource){ render_with_scope :edit }
    end
  end

end
