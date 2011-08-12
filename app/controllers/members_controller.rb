class MembersController < ApplicationController
  inherit_resources
  actions :show, :update
  respond_to :json
  respond_to :html, :only => [ :show ]
end
