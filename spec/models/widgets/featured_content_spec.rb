require 'spec_helper'

describe FeaturedContent do
  it { should validate_presence_of(:link) }
  # it { should have_attached_file(:image) }
end
