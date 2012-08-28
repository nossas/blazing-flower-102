class MembersController < ApplicationController
  inherit_resources
  has_scope :page, default: 1
  has_scope :by_updated_at

  actions :show, :update, :index
  respond_to :json, only: [:index]
  respond_to :html, :only => [ :show, :update ]
  respond_to :csv, :only => [ :index ]

  before_filter only: [:index] { check_mrdash_token }
end
