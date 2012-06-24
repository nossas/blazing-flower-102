require 'spec_helper'

describe IssuesController do
  before do
    @issue = Factory.create(:issue)
  end

  describe "GET index" do
    context "When I have a valid token" do
      before do
        ENV['DASH_TOKEN'] = "HelloThisIsDog"
        get :index, token: ENV['DASH_TOKEN'], format: :json 
      end
      its(:status) { should == 200 }

    end
    context "When I have an invalid token" do 
      before do 
        get :index, format: :json, token: "what" 
      end
      its(:status) { should == 401 }
    end
  end
  
  describe "GET signers" do
     context "When I have a valid token" do
      before do
        @issue = Factory.create(:issue)
        ENV['DASH_TOKEN'] = "HelloThisIsDog"
        get :signers, id: @issue.id, token: ENV['DASH_TOKEN'], format: :json 
      end
      its(:status) { should == 200 }

    end
    context "When I have an invalid token" do 
      before do 
        @issue = Factory.create(:issue)
        get :signers, id: @issue.id, format: :json, token: "what" 
      end
      its(:status) { should == 401 }
    end   

  end

  describe "GET show" do
    it "has a 200 status code" do
      get :show, :id => @issue.id
      response.code.should eq("200")
    end
  end

  describe "GET archive" do
    it "has a 200 status code" do
      get :show, :id => @issue.id
      response.code.should eq("200")
    end

    it "assigns @articles without any nil items when only published petitions exist" do
      @published_petition = Factory(:complete_petition, :issue => @issue).tap{ |p| p.publish }

      xhr :get, :archive, :id => @issue.id
      assigns(:articles).should == [@published_petition]
    end

    it "assigns @articles with only published and archived petitions" do
      @draft_petition = Factory(:petition, :issue => @issue)
      @archived_petition  = Factory(:complete_petition, :issue => @issue).tap{ |p| p.publish && p.archive }
      @published_petition = Factory(:complete_petition, :issue => @issue).tap{ |p| p.publish }

      xhr :get, :archive, :id => @issue.id, :format => :js
      assigns(:articles).should == [@published_petition, @archived_petition]
    end
  end
end
