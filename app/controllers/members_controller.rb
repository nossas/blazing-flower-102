class MembersController < ApplicationController
  inherit_resources
  actions :show, :update, :index
  respond_to :json
  respond_to :html, :only => [ :show, :update ]
end
