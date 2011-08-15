require 'spec_helper'

describe Widget do
  it { should validate_presence_of :type }
end
