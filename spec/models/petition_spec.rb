require 'spec_helper'

describe Petition do
  describe "#valid?" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :custom_path }
    it { should validate_presence_of :call_to_action }
    it { should validate_presence_of :state }

    context "with an already exisiting" do
      before do
        Factory(:petition, :custom_path => 'fixed_path')
      end

      it { should validate_uniqueness_of :custom_path }
    end
  end

  describe "#autofire_email" do
    it { should have_one :autofire_email }
  end
end
