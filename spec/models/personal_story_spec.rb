require 'spec_helper'

describe PersonalStory do
  it { should validate_presence_of :video_embed_code }
  it { should validate_presence_of :issue }
  it { should validate_presence_of :title }

  it { should allow_value('PETITION').for(:connected_action) }
  it { should allow_value('DEBATE').for(:connected_action) }
  it { should allow_value(nil).for(:connected_action) }

  it { should_not allow_value('SERENA').for(:connected_action) }
end
