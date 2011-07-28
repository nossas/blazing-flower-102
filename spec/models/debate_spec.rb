require 'spec_helper'

describe Debate do

  it { should validate_presence_of :title }
  it { should validate_presence_of :question }
  it { should validate_presence_of :author_email_side_1 }
  it { should validate_presence_of :author_email_side_2 }

end
