class Admin::AdminController < ActionController::Base
  before_filter :authenticate_user!

  layout "admin" 


   private 
    def stored_location_for(resource_or_scope)
      nil
    end

    def after_sign_in_path_for(resource_or_scope)
      admin_path
    end
  
end
