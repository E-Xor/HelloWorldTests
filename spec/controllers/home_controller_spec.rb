describe HomeController do
  it "should show links" do
    get :index
    response.should be_success
    # No response body in controller test
  end
end