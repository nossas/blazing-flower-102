require 'spec_helper'

describe OmniauthCallbacksController do
  before do
    request.env["devise.mapping"] = Devise.mappings[:member]
    @invalid_auth_data = {
      "provider"=>"facebook",
      "uid"=>"547955110",
      "credentials"=>{"token"=>"fake_token"},
      "user_info"=>{"nickname"=>nil,
                    "email"=>"diogob@gmail.com",
                    "first_name"=>"Diogo",
                    "last_name"=>"Biazus",
                    "name"=>"Diogo Biazus",
                    "image"=>"http://graph.facebook.com/547955110/picture?type=square",
                    "urls"=>{"Facebook"=>"http://www.facebook.com/profile.php?id=547955110",
                             "Website"=>nil}},
      "extra"=>{"user_hash"=>{"id"=>"547955110",
                             "name"=>"Diogo Biazus",
                             "first_name"=>"Diogo",
                             "last_name"=>"Biazus",
                             "link"=>"http://www.facebook.com/profile.php?id=547955110",
                             "bio"=>"I simply am not there",
                             "work"=> [],
                             "gender"=>"male",
                             "email"=>"diogo",
                             "timezone"=>-3,
                             "locale"=>"pt_BR",
                             "verified"=>true,
                             "updated_time"=>"2011-05-20T16:11:58+0000"}}}
    @correct_auth_data = {
      "provider"=>"facebook",
      "uid"=>"547955110",
      "credentials"=>{"token"=>"fake_token"},
      "user_info"=>{"nickname"=>nil,
                    "email"=>"diogob@gmail.com",
                    "first_name"=>"Diogo",
                    "last_name"=>"Biazus",
                    "name"=>"Diogo Biazus",
                    "image"=>"http://graph.facebook.com/547955110/picture?type=square",
                    "urls"=>{"Facebook"=>"http://www.facebook.com/profile.php?id=547955110",
                             "Website"=>nil}},
      "extra"=>{"user_hash"=>{"id"=>"547955110",
                             "name"=>"Diogo Biazus",
                             "first_name"=>"Diogo",
                             "last_name"=>"Biazus",
                             "link"=>"http://www.facebook.com/profile.php?id=547955110",
                             "bio"=>"I simply am not there",
                             "work"=> [],
                             "gender"=>"male",
                             "email"=>"diogob@gmail.com",
                             "timezone"=>-3,
                             "locale"=>"pt_BR",
                             "verified"=>true,
                             "updated_time"=>"2011-05-20T16:11:58+0000"}}}
  end
  describe "GET facebook" do
    subject{ get :facebook }
    it 'should call find_for_facebook_oauth' do
      controller.stub(:auth_data).and_return(@correct_auth_data) 
      Member.should_receive(:find_for_facebook_oauth).with(@correct_auth_data, nil).and_return(Factory(:member))
      subject
    end
    context "with wrong auth data" do
      before{ controller.stub(:auth_data).and_return(@invalid_auth_data) }
      it{ expect{subject}.to_not change{Member.count} }
      it{ should redirect_to(root_path) }
    end
    context "with right auth data" do
      before{ controller.stub(:auth_data).and_return(@correct_auth_data) }
      it{ expect{subject}.to change{Member.count}.by(1) }
      it{ should redirect_to(root_path) }
      it "should set a flash notice" do
        subject
        flash[:notice].should == 'You signed in as Diogo Biazus'
      end
    end
  end
end
