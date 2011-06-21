class Admin::PetitionsController < ApplicationController
  inherit_resources
  actions :index, :new
  respond_to :json, :only => [:index]
  respond_to :html, :only => [:new]
end
