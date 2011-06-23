require 'spec_helper'

describe AutofireEmail do
  describe "#valid?" do
    it { should validate_presence_of :from }
    it { should validate_presence_of :subject }
    it { should validate_presence_of :message }
  end

  describe "#petition" do
    it { should belong_to :petition }
  end
end
