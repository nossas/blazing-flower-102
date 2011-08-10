require 'spec_helper'

describe PersonalStory do
  it { should validate_presence_of :video_url }
  it { should validate_presence_of :issue }
  it { should validate_presence_of :title }
  it { should validate_presence_of :excerpt }
  it { should validate_presence_of :description }

  it { should allow_value('PETITION').for(:connected_action) }
  it { should allow_value('DEBATE').for(:connected_action) }
  it { should allow_value(nil).for(:connected_action) }

  it { should_not allow_value('SERENA').for(:connected_action) }

  it { should allow_value('http://vimeo.com/26694098').for(:video_url) }
  it { should allow_value('http://www.youtube.com/watch?v=BKdspWe-KdQ&feature=related').for(:video_url) }

  it { should_not allow_value('i am not a real url!').for(:video_url) }

end
