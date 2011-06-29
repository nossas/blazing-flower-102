require 'spec_helper'

describe Member do
  it { should validate_presence_of :email }
  it { should validate_presence_of :name }
  it { should validate_presence_of :zona }

end
