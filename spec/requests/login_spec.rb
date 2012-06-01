describe "Login" do
#  fixtures :auth_users # Fixtures will be loaded

  it "displays the admin page after successful login" do
    get "/auth_login"
    assert_select "form" do
      assert_select "input[name=?]", "user_name"
      assert_select "input[name=?]", "user_password"
      assert_select "input[type=?]", "submit"
    end
    post "/auth_login", :user_name => "Test User Name", :user_password => "blink182"
    response.should redirect_to(admin_path)
  end
end