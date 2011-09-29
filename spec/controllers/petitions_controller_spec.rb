require 'spec_helper'

describe PetitionsController do
  describe 'GET show' do
    it "should be successful for a published petition" do
      @p = Factory(:complete_petition)
      @p.publish
      get :show, :custom_path => @p.custom_path
      response.should be_success
    end

    it "should be successful for an archived petition" do
      @p = Factory(:complete_petition).tap{|cp| cp.publish && cp.archive}
      get :show, :custom_path => @p.custom_path
      response.should be_success
    end

    it "should render a 404 when the petition does no exist" do
      get :show, :custom_path => 'this_path_does_not_exist'
      response.response_code.should == 404
    end

    it "should render a 404 when the petition is in draft state" do
      Factory(:petition, :custom_path => 'draft_petition')
      get :show, :custom_path => 'draft_petition'
      response.response_code.should == 404
    end

    it "should render a 404 when the petition is in deactivated state" do
      Factory(:petition, :custom_path => 'deactivated_petition')
      get :show, :custom_path => 'deactivated_petition'
      response.response_code.should == 404
    end

    it "should fetch last 3 comments in created_at order" do
      @p = Factory(:complete_petition)
      @p.publish
      4.times{ Factory(:petition_signature, :petition => @p, :comment_accepted => true) }
      get :show, :custom_path => @p.custom_path
      response.should be_success
      assigns(:comments).should == PetitionSignature.where(:petition_id => @p.id).order('created_at DESC').limit(3).all
    end
  end
end
