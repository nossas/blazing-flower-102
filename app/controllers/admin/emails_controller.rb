class EmailController < Admin::AdminController
  load_and_authorize_resource
  inherit_resources

  actions :new, :create, :show
  respond_to :json, :only => [:create, :show]
  respond_to :html, :only => [:new]
end
