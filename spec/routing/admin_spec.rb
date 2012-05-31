require 'spec_helper'

describe "routing for /admin" do
  it "routes to the auth_admin#index" do
    { :get => "/admin" }.should route_to(:controller => "auth_admin", :action => "index")
  end
end