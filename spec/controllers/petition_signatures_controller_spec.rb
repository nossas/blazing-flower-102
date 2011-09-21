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
  end
end
