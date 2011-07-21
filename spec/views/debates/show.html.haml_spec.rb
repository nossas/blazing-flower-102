require "spec_helper"

describe "debates/show" do
  subject { rendered }

  context "debate have comments" do

    before do
      assign(:debate, mock_model(Debate, :comments => [mock_model(Comment, :member => mock_model(Member, :first_name => "Bruno", :last_name => "Jurkovski"))])) 
      render
    end

    it { should match "Bruno Jurkovski" }

  end

  context "debate doesn't have comments" do
  end

end
