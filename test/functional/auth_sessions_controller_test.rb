require 'test_helper'

class AuthSessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should login" do
    test_user = auth_users(:one)
    post :create, :user_name => test_user.user_name, :user_password => 'blink182'
    assert_redirected_to admin_url
    assert_equal test_user.id, session[:auth_user_id]
  end

  test "should fail login" do
    test_user = auth_users(:one)
    post :create, :user_name => test_user.user_name, :user_password => 'blink'
    assert_redirected_to auth_login_url
  end

  test "should logout" do
    get :destroy
    assert_redirected_to my_store_url
  end

end
