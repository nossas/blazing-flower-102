require 'spec_helper'

describe PetitionSignaturesController do
  describe "GET index.json" do
    subject{ response }
    context "when the signature does not exist" do
      before do
        get :index, :petition_id => 0, :email => 'foo@bar.com', :format => 'json'
      end
      it{ should be_successful }
      its(:body){ should == "null" }
    end
    context "when the signature already exists" do
      before do
        @signature = Factory(:petition_signature)
        get :index, :petition_id => @signature.petition_id, :email => @signature.member.email, :format => 'json'
      end
      it{ should be_successful }
      its(:body){ should == @signature.to_json }
    end
#    # pending
    #context "When an issue_id is provided" do
      #let(:issue) { mock_model(Issue, id: 1) }
      #let(:signature1) { mock_model(PetitionSignature) }
      #let(:signature2) { mock_model(PetitionSignature) }

      #before do
        #Issue.stub(:find).with("1").and_return(issue)
        #issue.stub_chain(:petition_signatures, :page, :all).and_return([signature1, signature2])
        #get :index, issue_id: issue.id, format: 'json'
      #end

      #it "should return only signatures from the given issue" do
        #issue.should assign_to(:petition_signatures).with([signature1, signature2]) 
      #end
    #end
  end

  describe "POST create" do
    subject{ response }
    before do
      @petition = Factory.create(:complete_petition)
      @petition.publish
    end
    
    context "New member" do
      before do
        post 'create', {:petition => {:custom_path => @petition.custom_path}, :member => {:email => "test-user@example.org", :first_name => "Mickey", :last_name => "Mouse", :zona => "Centro" }, :petition_signature => {:comment => "test comment"}}
      end
      it{ should be_success }
      its(:body){ should == {'hash' => 'compartilhe'}.to_json }
      its(:content_type){should == 'application/json'}
      it "should create a new Member and new Petition Signature" do
        Member.last.email.should == "test-user@example.org"
        PetitionSignature.last.member.should == Member.last
      end

      it "should save the signature comment" do
        PetitionSignature.last.comment.should == 'test comment'
      end
    end

    context "Existing member, new petition" do
      before do
        @member = Factory.create(:member)
        post 'create', {:petition => {:custom_path => @petition.custom_path}, :member => {:email => @member.email, :first_name => @member.first_name, :last_name => @member.last_name, :zona => @member.zona }, :petition_signature => {:comment => "test comment"}}
      end

      it{ should be_success }
      its(:body){ should == {'hash' => 'compartilhe'}.to_json }
      it "should create a new Petition Signature" do
        Member.count.should == 1
        PetitionSignature.last.member.should == @member
      end

      it "should save the signature comment" do
        PetitionSignature.last.comment.should == 'test comment'
      end
    end

    context "Existing member, exisiting petition signature" do
      before do
        @member = Factory.create(:member)
        PetitionSignature.create({:member_id => @member.id, :petition_id => @petition.id})
      end

      it "should redirect the user to the TAF page without creating any database records" do
        post 'create', {:petition => {:custom_path => @petition.custom_path}, :member => {:email => @member.email, :first_name => @member.first_name, :last_name => @member.last_name, :zona => @member.zona }, :petition_signature => {:comment => ""}}
        Member.count.should == 1
        PetitionSignature.count.should == 1
      end
    end

    context "when I am not logged in and I choose to sign with my Facebook account" do
      before { post :create, :petition_signature => {:petition_id => "1" } }
      it { should redirect_to("/members/auth/facebook") }
      it { should set_session(:petition_signature).to({"petition_id" => "1"}) }
    end
    
    context "when I am returning from Facebook" do
      controller(ApplicationController)
      controller { def index; render :text => "ApplicationController#index"; end }
      let(:member) { mock_model(Member) }
      let(:issue) { mock_model(Issue, :id => 1) }
      let(:petition) { mock_model(Petition, :published? => true, :custom_path => "test", :issue => issue) }
      let(:petition_signature) { mock_model(PetitionSignature, :id => 1, :petition => petition) }
      before { controller.stub(:current_member).and_return(member) }
      before { PetitionSignature.stub(:create).and_return(petition_signature) }
      before { Petition.stub(:find).and_return(petition) }
      before { session[:petition_signature] = {"petition_id" => "1"} }
      before { get :index }
      it { should redirect_to("/na_atividade/1/assine_embaixo/test") }
      it { should set_session(:petition_signature).to(nil) }
    end

  end
end
