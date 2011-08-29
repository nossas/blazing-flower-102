require "spec_helper"

describe PagesController do

  describe "routing" do

    it "routes to #show" do
      { :get => "/" }.should route_to({"id"=>"index", "controller"=>"pages", "action"=>"show"})
    end

    it "routes to #index" do
      get("/paginas/index").should route_to("pages#show", :id => "index")
    end

    it "route to #sobre_nos" do
      {:get => "/paginas/sobre_nos"}.should route_to(:controller => "pages", :action =>"show", :id => "sobre_nos")
    end
  end

end

