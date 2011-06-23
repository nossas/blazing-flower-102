require 'spec_helper'

describe AutofireEmail do
  it { should validate_presence_of :from }
  it { should validate_presence_of :subject }
  it { should validate_presence_of :message }
end
