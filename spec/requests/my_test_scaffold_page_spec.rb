require 'spec_helper'

describe "my test scaffold page" do
  it "displays the product admin page after successful login" do
    pass_salt = "NaCl"
    enc_pass = AuthUser.make_enc_pass("Max", pass_salt)
    user = AuthUser.create!(:user_name => "Max", :user_password => enc_pass, :pass_salt => pass_salt)

    get "/auth_login"
    assert_select "form" do
      assert_select "input[name=?]", "user_name"
      assert_select "input[name=?]", "user_password"
      assert_select "input[type=?]", "submit"
    end

    post "/auth_login", :user_name => "Max", :user_password => "Max"
#puts "Response body: #{response.body}"
#    response.should redirect_to(admin_path)
#    assert_select "#main h1", :text =~ /Welcome.+It's.+We have/m
  end
end