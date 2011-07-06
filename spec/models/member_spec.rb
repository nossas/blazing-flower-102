require 'spec_helper'

describe Member do
  it { should validate_presence_of :email }
  it { should validate_presence_of :name }

  describe ".find_for_facebook_oauth" do
    it "should find the member by email when he's already in the database" do
      m = Factory(:member)
      facebook_hash = {'extra' => {'user_hash' => {'email' => m.email}}}
      Member.find_for_facebook_oauth(facebook_hash).should == m
    end

    it "should create the member using his name and email when he's not in the database" do
      facebook_hash = {'extra' => {'user_hash' => {'email' => 'foo@bar.com', 'name' => 'Foo Bar'}}}
      Member.find_for_facebook_oauth(facebook_hash).email.should == 'foo@bar.com'
    end
  end
end
