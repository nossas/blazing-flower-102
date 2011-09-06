require "spec_helper"

describe "pages/index.html.haml" do
  it "wraps with a div#homepage" do
    render

    rendered.should =~ /div id='homepage'/
  end
end
