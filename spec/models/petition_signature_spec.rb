require 'spec_helper'

describe PetitionSignature do
  describe "#petition" do
    it { should belong_to :petition }
  end

  describe "#member" do
    it { should belong_to :member }
  end

end
