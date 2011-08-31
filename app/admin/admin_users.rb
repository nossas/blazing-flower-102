ActiveAdmin.register AdminUser do
  menu :priority => 14, :label => "Users"

  filter :email
  filter :first_name
  filter :last_name

  controller do
   def update(options={}, &block)
      if resource.update_with_password(params[:admin_user])
          options[:location] ||= smart_resource_url
      end
      respond_with_dual_blocks(resource, options, &block)
   end
  end

  index do
    column :first_name
    column :last_name
    column :email
    column :last_sign_in_at
    column :created_at
    column "Options" do |user| 
      span link_to 'Show', admin_admin_user_path(user), :id => "show_user_#{user.id}"
      span link_to 'Edit', edit_admin_admin_user_path(user), :id => "edit_user_#{user.id}"
      span link_to "Delete", admin_admin_user_path(user), :method => :delete, :confirm => "Are you sure?", :id => "delete_user_#{user.id}"
    end
  end

  form do |f|
    f.inputs "User Information" do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :avatar, :as => :file
    end
    f.inputs "User Roles" do
      f.input :is_admin, :label => 'Admin?'
      f.input :is_campaigner, :label => 'Campaigner?'
      f.input :active, :label => 'Active?'
    end
    f.buttons
  end

  show do
    h3 admin_user.name
    img({ :src => admin_user.avatar.url(:thumb), :id => "admin_user_avatar" })
    div do
      h4 "Email"
      simple_format admin_user.email
    end
    unless admin_user.account_active?
      p "This user's account has been deactivated."
    end
  end

end
