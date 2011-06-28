# encoding: utf-8
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

    context "invalid #custom_path" do
      it "should return false" do
        p = Factory.build(:petition, :custom_path => 'fixed_path')

        p.custom_path = 'fixed path'
        p.valid?.should == false

        p.custom_path = 'fixédpath'
        p.valid?.should == false

        p.custom_path = 'fixçdpath'
        p.valid?.should == false

        p.custom_path = 'fixed/path'
        p.valid?.should == false
      end
    end

    context "valid #custom_path" do
      p = Factory.build(:petition, :custom_path => 'fixed_path')
      p.valid?.should == true

      p.custom_path = 'fixed-path'
      p.valid?.should == true
    end
  end

  describe "#autofire_email" do
    it { should have_one :autofire_email }
  end

  describe "#taf" do
    it { should have_one :taf }
  end
end
