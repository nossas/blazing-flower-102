require 'spec_helper'

describe DebatesController do
  describe "GET show" do
    before { Debate.stub(:find).with(1).and_return(mock_model(Debate)) }

    context "user is logged in" do
      before do
        controller.stub!(:current_member).and_return(mock_model(Member))
        get :show, :id => 1
      end
      it { should assign_to(:comment) }
    end
    
    context "user is not logged in" do
      before do
        get :show, :id => 1
      end
      it { should_not assign_to(:comment) }
    end

  end
end
