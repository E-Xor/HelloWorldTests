require 'test_helper'

class UserOrdersControllerTest < ActionController::TestCase
  setup do
    @user_order = user_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_orders)
  end

  test "requires items in cart" do
    get :new
    assert_redirected_to my_store_path
    assert_equal flash[:notice], 'Your cart is empty'
  end

  test "should get new" do
    shop_cart  = ShopCart.create
    session[:shop_cart_id] = shop_cart.id
    ShopItem.create(:shop_cart => shop_cart, :my_test_scaffold => my_test_scaffolds(:one))

    get :new
    assert_response :success
  end

  test "should create user_order" do
    assert_difference('UserOrder.count') do
      post :create, :user_order => @user_order.attributes
    end

    assert_redirected_to my_store_path
  end

  test "should show user_order" do
    get :show, :id => @user_order.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @user_order.to_param
    assert_response :success
  end

  test "should update user_order" do
    put :update, :id => @user_order.to_param, :user_order => @user_order.attributes
    assert_redirected_to user_order_path(assigns(:user_order))
  end

  test "should destroy user_order" do
    assert_difference('UserOrder.count', -1) do
      delete :destroy, :id => @user_order.to_param
    end

    assert_redirected_to user_orders_path
  end
end
