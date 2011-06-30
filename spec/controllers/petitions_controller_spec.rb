require 'spec_helper'

describe PetitionsController do
  describe 'GET show' do
    it "should be successful" do
      @p = Factory(:complete_petition)
      @p.publish
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

    context "#display_counter" do
      before do
        @p = Factory(:complete_petition)
        @p.publish
      end

      it "should show the counter by default" do
        get :show, :custom_path => @p.custom_path
        assigns(:ok_to_display_counter).should eq(true)
      end

      it "should be hidden when #display_counter == false" do
        @p.update_attributes(:display_counter => false)
        get :show, :custom_path => @p.custom_path
        assigns(:ok_to_display_counter).should eq(false)
      end

      it "should be hidden when signature count is below #counter_threshold" do
        @p.update_attributes(:counter_threshold => 100)
        get :show, :custom_path => @p.custom_path
        assigns(:ok_to_display_counter).should eq(false)
      end
    end

  end
end
