require 'spec_helper'

describe PersonalStoriesController do

  describe "GET issue_index" do
    it "should successfully render for a valid :issue_id" do
      ps = Factory(:personal_story)
      get 'issue_index', :issue_id => ps.issue.id
      response.should be_success
    end

    it "renders the index template" do
      ps = Factory(:personal_story)
      get 'issue_index', :issue_id => ps.issue.id
      response.should render_template("index")
    end

    it "should render a 404 if no stories exist" do
      ps = Factory(:personal_story)
      issue = ps.issue
      PersonalStory.destroy_all

      get 'issue_index', :issue_id => issue.id
      response.code.should == "404"
    end
  end

  describe "GET show" do
    it "respond to an XHR request" do
      ps = Factory(:personal_story)
      xhr :get, :show, :id => ps.id, :format => :js

      response.should be_success
    end

    it "should @story" do
      ps = Factory(:personal_story)
      xhr :get, :show, :id => ps.id, :format => :js

      assigns(:story).should eq(ps)
    end

  end
end
