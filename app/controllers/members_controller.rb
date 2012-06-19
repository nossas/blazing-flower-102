class MembersController < ApplicationController
  inherit_resources
  has_scope :page, default: 1

  actions :show, :update, :index
  respond_to :json, only: [:index]
  respond_to :html, :only => [ :show, :update ]

  before_filter only: [:index] do
    unless ENV['DASH_TOKEN'] == params[:token] 
      render :nothing => true, :status => :unauthorized
    end
  end
end
