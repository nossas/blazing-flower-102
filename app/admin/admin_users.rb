# coding: utf-8
ActiveAdmin.register AdminUser do
  menu :priority => 14, :label => "Usuários"

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
    column :created_at do |m|
      l m.created_at, :format => :short
    end
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
    div({:class => 'panel' }) do
      h3 'User Information'
      div({:class => 'panel_contents' }) do
        div({:class => 'attributes_table' }) do
          unless admin_user.account_active?
            p "This user's account has been deactivated."
          end
          table do
            tr do
              th { 'Name' }
              td { admin_user.name }
            end
            tr do
              th { 'Email' }
              td { admin_user.email }
            end
            tr do
              th { 'Avatar' }
              td { img({ :src => admin_user.avatar.url(:thumb), :id => "admin_user_avatar" }) }
            end
            tr do
              th { 'Created at' }
              td { l admin_user.created_at, :format => :short }
            end
            tr do
              th { 'Updated at' }
              td { l admin_user.updated_at, :format => :short }
            end
          end
        end
      end
    end
  end
end
