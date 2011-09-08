require "spec_helper"
require 'devise/test_helpers'

describe "pages/index.html.haml" do
  before do
    controller.stub(:current_member).and_return(mock_model(Member))
  end

  it "displays wrapping div#homepage" do
    render
    rendered.should =~ /div id='homepage'/
  end
end
