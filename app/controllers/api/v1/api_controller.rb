module Api::V1
  class ApiController < ::ApplicationController
    def current_resource_owner
      Member.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
    end
  end
end
