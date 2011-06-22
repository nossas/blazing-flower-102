class Admin::PetitionsController < ApplicationController
  before_filter :authenticate_user!

  load_and_authorize_resource
  inherit_resources

  actions :index, :new, :create, :show
  respond_to :json, :only => [:index, :create, :show]
  respond_to :html, :only => [:new]
end
