class Admin::PetitionsController < ApplicationController
  inherit_resources
  actions :index
  respond_to :json
end
