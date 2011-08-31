require 'spec_helper'

describe PagesController do

  describe "GET 'show'" do
    it "should be successful for a vaild page :id" do
      get 'show', :id => 'index'
      response.should be_success
    end

    it "it should raise an error for an invalid page :id" do
      expect{ get('show', :id => 'none-page') }.to raise_error(ActionController::RoutingError,"No such page: none-page")
    end
  end

end

