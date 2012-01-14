require 'test_helper'

class ShopItemsControllerTest < ActionController::TestCase
  setup do
    @shop_item = shop_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shop_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shop_item" do
    assert_difference('ShopItem.count') do
      post :create, :my_test_scaffold_id => my_test_scaffolds(:one).id
    end

    assert_redirected_to my_store_path
  end

  test "should show shop_item" do
    get :show, :id => @shop_item.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @shop_item.to_param
    assert_response :success
  end

  test "should update shop_item" do
    put :update, :id => @shop_item.to_param, :shop_item => @shop_item.attributes
    assert_redirected_to shop_item_path(assigns(:shop_item))
  end

  test "should destroy shop_item" do
    assert_difference('ShopItem.count', -1) do
      delete :destroy, :id => @shop_item.to_param
    end

    assert_redirected_to my_store_path # in this case we can't redirect to unexisting cart
  end

  test "should create shop_itam via AJAX" do
    assert_difference("ShopItem.count") do
      xhr :post, :create, :my_test_scaffold_id => my_test_scaffolds(:one).id #xhr intends reponse, not redirect
    end

    assert_response :success
    assert_select 'tr#current_shop_item', /Title Five/
  end
end
