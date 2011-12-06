require 'spec_helper'

describe RamifyController do
  describe "#create_ramify_session" do
    before do
      require 'net/http'
      @member = Factory(:member)
      sign_in @member
      FakeWeb.register_uri(:post, SITE['ramify_auth_address'], :body => '{"sid":"27d6def614dcdd111430acc1287833db"}')
      get :create_session
    end
    subject{ response }
    its(:body){ should = '{"sid":"27d6def614dcdd111430acc1287833db"}' }
  end

  describe "#destroy_ramify_session" do
    before do
      require 'net/http'
      FakeWeb.register_uri(:post, SITE['ramify_logout_address'], :body => '{"sid":"destroy sid"}')
      get :destroy_session
    end
    subject{ response }
    its(:body){ should = '{"sid":"destroy sid"}' }
  end
end
