require "spec_helper"

describe Imagine::IdeasController do
  subject { response }
  before do
    @idea_owner ||= mock_model(Member, :id => 1)
    @current_member ||= stub_model(Member, :id => 2)
    controller.stub(:current_member).and_return(@current_member)

    @idea = mock_model(Idea, :id => 1, :user_id => @idea_owner.id, :issue => stub_model(Issue))
    @fork = mock_model(Idea, :id => 2, :user_id => @current_member.id, :issue => stub_model(Issue))
  end


  describe 'GET index' do
    before do
      Idea.stub(:count).and_return("ideas_count")

      get :index, :locale => :pt, :iframe => 'true'
    end
    its(:status){ should == 200 }
    it{ assigns(:count).should == "ideas_count" }
  end

  describe 'GET show' do
    before do
      @idea = Factory.create(:idea)
      get :show, :id => @idea.id, :locale => :pt
    end
    its(:status){ should == 200 }
  end

  describe "POST create_fork_idea" do

    before do
      Idea.stub!(:find, @idea.id).and_return(@idea)
      @idea.stub!(:create_fork, @current_member).and_return(@fork)
    end

    context "when user IS logged in" do

      before do
        session[:user_id] = @current_member.id
        post :create_fork, :locale => :pt, :id => @idea.id
      end

      its(:status) { should == 302 }
      it { should redirect_to issue_idea_path(@fork.issue, @fork) }
    end

    context "when user IS NOT logged" do

      before do
        controller.stub(:current_member).and_return(nil)
        post :create_fork, :locale => :pt, :id => @idea.id
      end

      # Check later for rescue_from CanCan:AccessDenied in ApplicationController
      its(:status) { should == 401 }
      it { should_not redirect_to imagine_idea_path(@fork)}
    end
  end

  describe "PUT merge_idea" do
    before do
      Idea.stub!(:find, @idea.id).and_return(@idea)
      @idea.stub!(:merge!, @fork.id).and_return(@idea)
    end

    context "When the user is logged in" do
      before do
        session[:user_id] = @current_member.id
        put :merge, :locale => :pt, :id => @idea.id, :from_id => @fork.id
      end

      its(:status) { should == 302 }
      it { should redirect_to imagine_idea_path(@idea) }
    end
  end
end
