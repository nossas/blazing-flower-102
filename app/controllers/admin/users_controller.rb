class Admin::UsersController < Admin::AdminController
  inherit_resources
  defaults :route_prefix => 'admin'
  

   def update(options={}, &block)
      if resource.update_with_password(params[:user])
          options[:location] ||= smart_resource_url
      end
      respond_with_dual_blocks(resource, options, &block)
   end
  
  # def index
  #   @users = User.all
  # end

  # def show
  #   @user = User.where(:id => params[:id]).first
  # end

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.create(params[:user])
  #   if @user.save
  #     redirect_to admin_user_path(@user), :notice => "New user created."
  #   else
  #     render :action => "new"
  #   end
  # end

end
