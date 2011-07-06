require 'spec_helper'

describe OmniauthCallbacksController do
  before do
    request.env["devise.mapping"] = Devise.mappings[:member]
  end
  describe "GET facebook" do
    subject{ get :facebook }
    it 'should call find_for_facebook_oauth' do
      controller.stub(:auth_data).and_return(FACEBOOK_VALID_AUTH_DATA) 
      Member.should_receive(:find_for_facebook_oauth).with(FACEBOOK_VALID_AUTH_DATA, nil).and_return(Factory(:member))
      subject
    end
    context "with wrong auth data" do
      before{ controller.stub(:auth_data).and_return(FACEBOOK_INVALID_AUTH_DATA) }
      it{ expect{subject}.to_not change{Member.count} }
      it{ should redirect_to(root_path) }
    end
    context "with right auth data" do
      before{ controller.stub(:auth_data).and_return(FACEBOOK_VALID_AUTH_DATA) }
      it{ expect{subject}.to change{Member.count}.by(1) }
      it{ should redirect_to(root_path) }
      it "should set a flash notice" do
        subject
        flash[:notice].should == 'You signed in as Diogo Biazus'
      end
    end
  end
end
