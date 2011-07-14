require 'spec_helper'

describe Issue do
  it { should validate_presence_of :name } 
end
