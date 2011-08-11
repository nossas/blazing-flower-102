require 'spec_helper'

describe Member do
  it { should validate_presence_of :email }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { 
    Factory(:member)
    should validate_uniqueness_of :email
  }

  describe ".find_for_facebook_oauth" do
    it "should find the member by email when he's already in the database" do
      m = Factory(:member, :email => FACEBOOK_VALID_AUTH_DATA["extra"]["user_hash"]["email"] )
      Member.find_for_facebook_oauth(FACEBOOK_VALID_AUTH_DATA).should == m
    end

    context "when he's not in the database" do

      it "should create using his email" do
        Member.find_for_facebook_oauth(FACEBOOK_VALID_AUTH_DATA).email.should == FACEBOOK_VALID_AUTH_DATA["user_info"]["email"]
      end

      it "should create using his thumbnail" do
        Member.find_for_facebook_oauth(FACEBOOK_VALID_AUTH_DATA).image_url.should == FACEBOOK_VALID_AUTH_DATA["user_info"]["image"]
      end

    end

  end

  describe ".find_for_google_oauth" do
    it "should find the member by email when he's already in the database" do
      m = Factory(:member, :email => GOOGLE_APP_VALID_AUTH_DATA["user_info"]["email"])
      Member.find_for_google_oauth(GOOGLE_APP_VALID_AUTH_DATA).should == m
    end

    context "when he's not in the database and using a google custom domain" do
      let(:auth_data) do 
        GOOGLE_CUSTOM_DOMAIN_VALID_AUTH_DATA['user_info'].merge!({'email' => 'foo@bar.com'})
        GOOGLE_CUSTOM_DOMAIN_VALID_AUTH_DATA
      end
      subject{ Member.find_for_google_oauth(auth_data) }
      its(:email){ should == auth_data['user_info']['email'] }
      its(:first_name){ should == auth_data['user_info']['first_name'] }
      its(:last_name){ should == auth_data['user_info']['last_name'] }
    end

    context "when he's not in the database" do
      it "should create the member using his name and email" do
        Member.find_for_google_oauth(GOOGLE_APP_VALID_AUTH_DATA).email.should == 'ren.provey@gmail.com'
      end

      it "should create using his gravatar" do
        Member.find_for_google_oauth(GOOGLE_APP_VALID_AUTH_DATA).image_url.should == 'http://www.gravatar.com/avatar/e9d7835fee9dabb3745b3bae39d8a1ff.jpg?s=60&d=http://localhost:3000/assets/avatar_blank.png'
      end

    end
  end

  describe "#action_history" do
    before :each do
      @petition_signature = mock_model PetitionSignature, :created_at => Time.now - 1.day
      @debate_comment = mock_model Comment, :created_at => Time.now
    end

    context "when there is no petition signature or debate comment" do
      its(:action_history){ should be_empty }
    end

    context "when there is one petition signature" do
      before { subject.stub(:petition_signatures).and_return([@petition_signature]) }
      its(:action_history){ should be_== [@petition_signature] }
    end

    context "when there is one debate comment" do
      before { subject.stub(:comments).and_return([@debate_comment]) }
      its(:action_history){ should be_== [@debate_comment] }
    end

    context "when there is a new debate comment and an old petition signature" do
      before :each do
        subject.stub(:petition_signatures).and_return([@petition_signature])
        subject.stub(:comments).and_return([@debate_comment])
      end
      its(:action_history){ should be_== [@debate_comment, @petition_signature] }
    end

  end

end
