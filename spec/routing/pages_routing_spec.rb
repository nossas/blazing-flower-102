require "spec_helper"

describe PagesController do

  describe "routing" do

    it "routes to #show" do
      { :get => "/" }.should route_to({"id"=>"index", "controller"=>"pages", "action"=>"show"})
    end

    it "routes to #index" do
      get("/paginas/index").should route_to("pages#show", :id => "index")
    end

  end

end

