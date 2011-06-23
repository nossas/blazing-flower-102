require 'spec_helper'

describe Admin::EmailsController do
  before { @admin = Factory(:admin) }

  subject{ response }

  describe 'GET new' do
    context 'as a guest' do
      before do
        get :new
      end

      it { should redirect_to(new_user_session_path) }
      its(:code){should eq("302")}
    end

    # context 'as a logged in user' do
    #   before do
    #     sign_in @admin
    #     get :new
    #   end

    #   it{ should be_successful }
    #   it{ assigns(:email).should be_new_record }
    # end
  end

  describe 'GET show' do
    before do
      @email = Factory(:petition_with_email).autofire_email
    end

    context 'as a guest' do
      before do
        get :show
      end

      it { should redirect_to(new_user_session_path) }
      its(:code){should eq("302")}
    end

    context 'as a logged in user' do
      before do
        sign_in @admin
        get :show, :id => @email.id, :format => :json
      end

      it { should be_successful }
      it { assigns(:email).should == @email }
      its(:body) { should == @email.to_json }

    end
  end
end

