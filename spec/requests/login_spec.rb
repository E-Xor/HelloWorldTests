describe "Login" do
#  fixtures :auth_users # Fixtures will be loaded

  it "displays the admin page after successful login" do
    get auth_login_path
    assert_select "form" do
      assert_select "input[name=?]", "user_name"
      assert_select "input[name=?]", "user_password"
      assert_select "input[type=?]", "submit"
    end
    post_via_redirect auth_login_path, :user_name => "Test User Name", :user_password => "blink182"
    response.should be_success
    response.body.should include("Welcome") # admin_path page
  end

  it "displays the admin page after successful login using fill in fields" do
    visit auth_login_path
    page.should have_content("Name:")
    page.should have_content("Password:")
    fill_in "Name", :with => "Test User Name"
    fill_in "Password", :with => "blink182"
    click_button "Login"
    page.should have_content("Welcome")
  end

end