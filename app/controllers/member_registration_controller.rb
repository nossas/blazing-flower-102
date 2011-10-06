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
    build_resource

    @member = Member.find_or_initialize_by_email(params[:member][:email])

    if @member.has_login
      resource.errors[:base] << "There is already a member with that email on the site"
      if request.xhr?
        return render :json => { :success => true, :errors => resource.errors.full_messages }
      else
        respond_with_navigational(resource) { render_with_scope :new }
      end
    else
      @member.attributes = params[:member]
      @member.has_login = true
      @member.has_non_oauth_login = true
      @member.image_url = "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(params[:member][:email])}.jpg?s=260&d=http://#{SITE['site_url']}/assets/avatar_blank.png"
      if @member.save
        if @member.active_for_authentication?
          set_flash_message :notice, :signed_up if is_navigational_format?
          sign_in(resource_name, resource)
          if request.xhr?
            return render :json => { :success => true, :flash => flash[:notice] }
          else
            respond_with resource, :location => redirect_location(resource_name, resource)
          end
        else
          set_flash_message :notice, :inactive_signed_up, :reason => inactive_reason(resource) if is_navigational_format?
          expire_session_data_after_sign_in!
          if request.xhr?
            return render :json => { :success => true, :flash => flash[:notice] }
          else
            respond_with resource, :location => after_inactive_sign_up_path_for(resource)
          end
        end
      else
        clean_up_passwords(resource)
        if request.xhr?
          return render :json => { :success => false, :errors => resource.errors.full_messages } 
        else
          respond_with_navigational(resource) { render_with_scope :new }
        end
      end
    end
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
