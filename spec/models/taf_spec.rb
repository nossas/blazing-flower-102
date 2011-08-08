# coding: UTF-8
require 'spec_helper'

describe Taf do
  describe "#valid?" do
    it { should validate_presence_of :petition }
    it { should validate_presence_of :thank_you_headline }
    it { should validate_presence_of :thank_you_text }
  end

  describe "#petition" do
    it { should belong_to :petition }
  end

  describe "Orkut properties" do
    it "should not validate orkut properties by default" do
      @taf = Factory.build(:taf)
      @taf.valid?.should be_true
    end

    context "#display_orkut => true" do
      before do
        @taf = Factory.build(:taf, :display_orkut => true)
      end

      it "should validate orkut_title" do
        @taf.valid?.should be_false
        @taf.errors.messages[:orkut_title][0].should == "não pode ficar em branco"
        @taf.errors.messages[:orkut_link][0].should == "não pode ficar em branco"
        @taf.errors.messages[:orkut_message][0].should == "não pode ficar em branco"
      end
    end
  end

  describe "Facebook properties" do
    it "should not validate properties by default" do
      @taf = Factory.build(:taf)
      @taf.valid?.should be_true
    end

    context "#display_facebook => true" do
      before do
        @taf = Factory.build(:taf, :display_facebook => true)
      end

      it "should validate properties" do
        @taf.valid?.should be_false
        @taf.errors.messages[:facebook_title][0].should == "não pode ficar em branco"
        @taf.errors.messages[:facebook_link][0].should == "não pode ficar em branco"
        @taf.errors.messages[:facebook_message][0].should == "não pode ficar em branco"
      end
    end
  end

  describe "Twitter properties" do
    it "should not validate properties by default" do
      @taf = Factory.build(:taf)
      @taf.valid?.should be_true
    end

    context "#display_twitter => true" do
      before do
        @taf = Factory.build(:taf, :display_twitter => true)
      end

      it "should validate properties" do
        @taf.valid?.should be_false
        @taf.errors.messages[:tweet][0].should == "não pode ficar em branco"
        @taf.errors.messages[:twitter_url][0].should == "não pode ficar em branco"
      end
    end
  end

  describe "Email properties" do
    it "should not validate properties by default" do
      @taf = Factory.build(:taf)
      @taf.valid?.should be_true
    end

    context "#display_email => true" do
      before do
        @taf = Factory.build(:taf, :display_email => true)
      end

      it "should validate properties" do
        @taf.valid?.should be_false
        @taf.errors.messages[:email_subject][0].should == "não pode ficar em branco"
        @taf.errors.messages[:email_message][0].should == "não pode ficar em branco"
      end
    end
  end

end
