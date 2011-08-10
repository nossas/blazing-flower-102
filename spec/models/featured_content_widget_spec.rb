require 'spec_helper'

describe FeaturedContentWidget do
  it { should validate_presence_of(:link) }
  # it { should have_attached_file(:image) }
end
