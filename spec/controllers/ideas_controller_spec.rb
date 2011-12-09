require "spec_helper"

describe Imagine::IdeasController do
  subject { response }
  before do
    @idea_owner ||= mock_model(Member, :id => 1)
    @current_user ||= mock_model(Member, :id => 2)

    @idea = mock_model(Idea, :id => 1, :user_id => @idea_owner.id)
    @fork = mock_model(Idea, :id => 2, :user_id => @current_user.id)
  end


  describe 'GET index' do
    before do
      Idea.stub_chain(:featured, :primary, :limit, :all).and_return('featured_ideas')
      Idea.stub_chain(:popular, :limit, :all).and_return("popular_ideas")
      Idea.stub_chain(:not_featured, :recent, :limit, :all).and_return("recent_ideas")
      Idea.stub(:count).and_return("ideas_count")

      get :index, :locale => :pt, :iframe => 'true'
    end
    its(:status){ should == 200 }
    it{ assigns(:featured).should == "featured_ideas" }
    it{ assigns(:popular).should == "popular_ideas" }
    it{ assigns(:recent).should == "recent_ideas" }
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
      @idea.stub!(:create_fork, @current_user).and_return(@fork)
    end

    context "when user IS logged in" do

      before do
        session[:user_id] = @current_user.id
        post :create_fork, :locale => :pt, :id => @idea.id
      end

      its(:status) { should == 302 }
      it { should redirect_to imagine_idea_path(@fork) }
    end

    context "when user IS NOT logged" do

      before do
        session[:user_id] = nil
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
        session[:user_id] = @current_user.id
        put :merge, :locale => :pt, :id => @idea.id, :from_id => @fork.id
      end

      its(:status) { should == 302 }
      it { should redirect_to imagine_idea_path(@idea) }
    end
  end
end
