# encoding: utf-8
require 'spec_helper'

describe Petition do

  describe "#issue" do
    it { should belong_to :issue }
  end

  describe "#valid?" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :custom_path }
    it { should validate_presence_of :call_to_action }
    it { should validate_presence_of :call_to_action_text }
    it { should validate_presence_of :call_to_action_headline }
    it { should validate_presence_of :media }

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
      it "should return true" do
        p = Factory.build(:petition, :custom_path => 'fixed_path')
        p.valid?.should == true

        p.custom_path = 'fixed-path'
        p.valid?.should == true
      end
    end
  end

  describe "in draft state" do
    subject { Factory(:complete_petition) }
    its(:can_publish?){ should be_true }
    its(:can_archive?){ should be_false }
  end

  describe "in published state" do
    subject { Factory(:complete_petition).tap{|p| p.publish} }
    its(:can_archive?){ should be_true }
    its(:can_deactivate?){ should be_true }
  end

  describe "in archived state" do
    subject { Factory(:complete_petition).tap{|p| p.publish && p.archive} }
    its(:can_publish?){ should be_true }
    its(:can_deactivate?){ should be_true }
  end

  describe "in deactivated state" do
    subject { Factory(:complete_petition).tap{|p| p.publish && p.deactivate} }
    its(:can_archive?){ should be_true }
    its(:can_publish?){ should be_true }
  end


  describe "Display Comment Field" do
    it "should not validate comment field properties by default" do
      @petition = Factory.build(:petition)
      @petition.valid?.should be_true
    end

    context "#display_comment_field => true" do
      before do
        @petition = Factory.build(:petition, :display_comment_field => true)
      end

      it "should validate comment field properties" do
        @petition.valid?.should be_false
        @petition.errors.messages[:comment_question][0].should == "não pode ficar em branco"
      end
    end
  end

  describe "#ok_to_display_counter?" do
    before do
      @p = Factory.build(:complete_petition)
    end

    it "should be true by default" do
      @p.ok_to_display_counter?.should eq(true)
    end

    it "should be false when #display_counter == false" do
      @p.update_attributes(:display_counter => false)
      @p.ok_to_display_counter?.should eq(false)
    end

    it "should be false when signature count is below #counter_threshold" do
      @p.update_attributes(:counter_threshold => 100)
      @p.ok_to_display_counter?.should eq(false)
    end
  end

  describe "#percentage_complete" do
    before do
      @p = Factory.build(:complete_petition)

      @signatures = {} # Used in stubs
      @p.stub(:petition_signatures) {@signatures}
    end

    it "should be 0% with by default" do
      @signatures.stub(:count) { 0 }
      @p.counter_goal = 0 #just being explicit

      @p.percentage_complete.should eq(0)
    end

    it "should be 10% with 10 signatures and a goal of 100" do
      @signatures.stub(:count) { 10 }

      @p.counter_goal = 100
      @p.percentage_complete.should eq(10)
    end

    it "should be 100% with 100 signatures and a goal of 100" do
      @signatures.stub(:count) { 100 }

      @p.counter_goal = 100
      @p.percentage_complete.should eq(100)
    end

    it "should not be more than 100%" do
      @signatures.stub(:count) { 200 }
      @p.counter_goal = 10

      @p.percentage_complete.should eq(100)
    end
  end

  describe "#autofire_email" do
    it { should have_one :autofire_email }
  end

  describe "#taf" do
    it { should have_one :taf }
  end

  describe "#add_wmode_to_youtube_iframe" do
    context "when we call it as before_create hook" do 
      subject{ Factory(:petition, :media => "<iframe width=\"560\" height=\"349\" src=\"http://www.youtube.com/embed/Z00jjc-WtZI\" frameborder=\"0\" allowfullscreen></iframe>") }
      its(:media){ should ==  "<iframe width=\"560\" height=\"349\" src=\"http://www.youtube.com/embed/Z00jjc-WtZI?wmode=opaque\" frameborder=\"0\" allowfullscreen></iframe>" }
    end
    context "when we call it directly" do 
      subject{ Factory.build(:petition, :media => "<iframe width=\"560\" height=\"349\" src=\"http://www.youtube.com/embed/Z00jjc-WtZI\" frameborder=\"0\" allowfullscreen></iframe>").tap{|p| p.add_wmode_to_youtube_iframe } }
      its(:media){ should ==  "<iframe width=\"560\" height=\"349\" src=\"http://www.youtube.com/embed/Z00jjc-WtZI?wmode=opaque\" frameborder=\"0\" allowfullscreen></iframe>" }
    end
    context "when we have a vimeo video" do
      subject{ Factory.build(:petition, :media => '<iframe src="http://player.vimeo.com/video/18534513?title=0&amp;byline=0&amp;portrait=0" width="400" height="225" frameborder="0"></iframe><p><a href="http://vimeo.com/18534513">December in Toronto</a> from <a href="http://vimeo.com/user3045401">Millefiore Clarkes</a> on <a href="http://vimeo.com">Vimeo</a>.</p>').tap{|p| p.add_wmode_to_youtube_iframe } }
      its(:media){ should == '<iframe src="http://player.vimeo.com/video/18534513?title=0&amp;byline=0&amp;portrait=0" width="400" height="225" frameborder="0"></iframe><p><a href="http://vimeo.com/18534513">December in Toronto</a> from <a href="http://vimeo.com/user3045401">Millefiore Clarkes</a> on <a href="http://vimeo.com">Vimeo</a>.</p>' }
    end
    context "when we have an image" do
      subject{ Factory.build(:petition, :media => 'http://meurio.org.br/images/logo.png').tap{|p| p.add_wmode_to_youtube_iframe } }
      its(:media){ should == 'http://meurio.org.br/images/logo.png' }
    end
  end

  describe "#export_to_csv" do
    before do
      @p = Factory.create(:complete_petition, :title => "petition-csv-export-test")
      @p.publish!

      m = Factory.create(:member, :first_name => "Diogo", :last_name => "Provey", :email => 'ren@purpose.com', :created_at => "2011-07-28 12:08:11 -0400")
      PetitionSignature.create({:petition => @p, :member => m})
    end

    after do
      f = Rails.root.to_s + "/tmp/signatures-#{@p.title}.csv"
      'rm #{f}' if File.exists?(f)
    end

    it "should export a list of members who have signed the petition" do
      @p.export_to_csv
      File.exists?(Rails.root.to_s + "/tmp/signatures-#{@p.title}.csv").should be_true

      generated_file = File.open(Rails.root.to_s + "/tmp/signatures-#{@p.title}.csv").read
      generated_file.should include("id,first_name,last_name,email,zona,celular,created_at")
      generated_file.should include("Diogo,Provey,ren@purpose.com,Centro,,2011-07-28 13:08:11 -0300")
    end

  end

end
