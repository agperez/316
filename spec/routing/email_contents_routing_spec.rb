require "spec_helper"

describe EmailContentsController do
  describe "routing" do

    it "routes to #index" do
      get("/email_contents").should route_to("email_contents#index")
    end

    it "routes to #new" do
      get("/email_contents/new").should route_to("email_contents#new")
    end

    it "routes to #show" do
      get("/email_contents/1").should route_to("email_contents#show", :id => "1")
    end

    it "routes to #edit" do
      get("/email_contents/1/edit").should route_to("email_contents#edit", :id => "1")
    end

    it "routes to #create" do
      post("/email_contents").should route_to("email_contents#create")
    end

    it "routes to #update" do
      put("/email_contents/1").should route_to("email_contents#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/email_contents/1").should route_to("email_contents#destroy", :id => "1")
    end

  end
end
