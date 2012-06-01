require 'spec_helper.rb'

describe "Home page" do
  it "should show page with links" do
    get "/"
    response.should be_success
    response.body.should include("Google Maps")
  end
end