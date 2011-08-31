require 'spec_helper'

describe IssuesController do
  before do
    @issue = Factory.create(:issue)
  end

  describe "GET show" do
    it "has a 200 status code" do
      get :show, :id => @issue.id
      response.code.should eq("200")
    end
  end
end
