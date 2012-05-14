require 'test_helper'

class AuthUsersControllerTest < ActionController::TestCase
  setup do
    @input_attrs = {
      :user_name => "Max",
      :user_password => "Max1",
      :user_password_confirmation => "Max1"

    }
    @auth_user = auth_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:auth_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create auth_user" do
    assert_difference('AuthUser.count') do
      post :create, :auth_user => @input_attrs
    end

    assert_redirected_to auth_users_path
  end

  test "should show auth_user" do
    get :show, :id => @auth_user.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @auth_user.to_param
    assert_response :success
  end

  test "should update auth_user" do
    put :update, :id => @auth_user.to_param, :auth_user => @input_attrs
    assert_redirected_to auth_users_path
  end

  test "should destroy auth_user" do
    assert_difference('AuthUser.count', -1) do
      delete :destroy, :id => @auth_user.to_param
    end

    assert_redirected_to auth_users_path
  end
end
