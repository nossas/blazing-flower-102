require 'spec_helper'

describe FeaturedContentWidget do
  it { should validate_presence_of(:link) }
  it { should validate_presence_of(:title) }
end
