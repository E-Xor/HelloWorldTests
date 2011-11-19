require 'test_helper'

class ShopCartsControllerTest < ActionController::TestCase
  setup do
    @shop_cart = shop_carts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shop_carts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shop_cart" do
    assert_difference('ShopCart.count') do
      post :create, :shop_cart => @shop_cart.attributes
    end

    assert_redirected_to shop_cart_path(assigns(:shop_cart))
  end

  test "should show shop_cart" do
    get :show, :id => @shop_cart.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @shop_cart.to_param
    assert_response :success
  end

  test "should update shop_cart" do
    put :update, :id => @shop_cart.to_param, :shop_cart => @shop_cart.attributes
    assert_redirected_to shop_cart_path(assigns(:shop_cart))
  end

  test "should destroy shop_cart" do
    assert_difference('ShopCart.count', -1) do
      delete :destroy, :id => @shop_cart.to_param
    end

    assert_redirected_to shop_carts_path
  end
end
