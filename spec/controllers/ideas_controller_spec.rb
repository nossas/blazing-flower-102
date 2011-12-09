require "spec_helper"

describe Imagine::IdeasController do
  subject { response }
  before do

    @idea_owner ||= mock_model(Member, :id => 1)
    @current_user ||= mock_model(Member, :id => 2)

    @idea = mock_model(Idea, :id => 1, :user_id => @idea_owner.id)
    @fork = mock_model(Idea, :id => 2, :user_id => @current_user.id)
  end

  describe "PUT merge_idea" do
    before do
      Idea.stub!(:find, @idea.id).and_return(@idea)
      @idea.stub!(:merge!, @fork.id).and_return(@idea)
    end

    context "When the user is logged in" do
      before do
        session[:iframe] = true
        session[:user_id] = @current_user.id
        put :merge, :locale => :pt, :id => @idea.id, :from_id => @fork.id
      end

      its(:status) { should == 302 }
      it { should redirect_to imagine_idea_path(@idea) }
    end
  end
end
