require 'spec_helper'

describe PagesController do

  describe "GET 'show'" do
    it "should be successful" do
      get 'show', :id => 'index'
      response.should be_success
    end
  end

end
