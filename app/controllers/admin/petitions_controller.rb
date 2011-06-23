class Admin::PetitionsController < Admin::AdminController
  load_and_authorize_resource
  inherit_resources

  actions :index, :new, :create, :show
  respond_to :json, :only => [:create, :show]
  respond_to :html, :only => [:index, :new]
end
