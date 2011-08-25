require 'spec_helper'

describe TwitterWidget do
  before(:each) do
    Rails.cache.clear
  end

  describe "#latest_tweet" do
    it "should return nil if cache is not populated" do
      TwitterWidget.latest_tweet.should be_nil
    end

    it "should return 'Test Tweet' if cache is populated to 'Test Tweet'" do
      Rails.cache.write("latest_tweet", 'Test Tweet')
      TwitterWidget.latest_tweet.should == 'Test Tweet'
    end
  end

  describe "#refresh_latest_tweet" do
    describe "valid twitter response" do
      before(:each) do
        Twitter.stub(:user_timeline).and_return(TWITTER_VALID_TIMELINE_RESPONSE)
      end

      it "should populate the cache" do
        TwitterWidget.latest_tweet.should be_nil
        TwitterWidget.refresh_latest_tweet

        TwitterWidget.latest_tweet.should == "Estamos trabalhando duro em nossa primeira campanha!"
      end
    end

    describe "invalid twitter response" do
      before(:each) do
        Twitter.stub(:user_timeline).and_raise("OH NO")
      end

      it "should not populate the cache if a cached tweet exists" do
        Rails.cache.write("latest_tweet", 'Test Tweet')

        TwitterWidget.refresh_latest_tweet
        TwitterWidget.latest_tweet.should == "Test Tweet"
      end

      it "should populate the cache with an error message if a tweet does not exists" do
        Rails.cache.clear

        TwitterWidget.refresh_latest_tweet
        TwitterWidget.latest_tweet.should == "Twitter unavailable."
      end
    end

  end
end
