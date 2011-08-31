class TwitterWidget < ActiveRecord::Base
  def self.latest_tweet
    Rails.cache.read("latest_tweet")
  end

  def self.refresh_latest_tweet
    begin
      tweet_text = Twitter.user_timeline('meu_rio').first['text']
    rescue
      if self.latest_tweet.blank?
        # tweet_text = "Tweets could not be loaded= #{$!}"
        tweet_text = "Twitter unavailable."
        logger.warn("Unable to contact the Twitter API, exception: #{$!}")
      else
        tweet_text = self.latest_tweet
      end
    end

    Rails.cache.write("latest_tweet", tweet_text)
  end
end
