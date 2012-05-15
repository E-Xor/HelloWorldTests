require 'test_helper'

class CustomerStoriesTest < ActionDispatch::IntegrationTest
#  fixtures :all
  fixtures :my_test_scaffolds

  test "buying one book" do
    UserOrder.delete_all
    ShopItem.delete_all
    ShopCart.delete_all
    one_book = my_test_scaffolds(:one)

    # Get to the site
    get "/"
    assert_response :success
    assert_template "index"

    # Choose a book
    xml_http_request :post, '/shop_items', :my_test_scaffold_id => one_book.id
    assert_response :success
    shop_cart = ShopCart.find(session[:shop_cart_id])
    assert_equal 1, shop_cart.shop_items.size
    assert_equal one_book, shop_cart.shop_items[0].my_test_scaffold

    # Check out
    get "/user_orders/new"
    assert_response :success
    assert_template "new"
    post_via_redirect "/user_orders", :user_order => {
      :user_name => "Max S",
      :user_address => "1234 Peachtree str.",
      :user_email => "e-xormail@tut.by",
      :user_pay_type => payment_types(:two).payment_type
    }
    assert_response :success
    assert_template "index"
    shop_cart = ShopCart.find(session[:shop_cart_id])
    assert_equal 0, shop_cart.shop_items.size

    # Orders changes
    user_orders = UserOrder.find(:all)
    assert_equal 1, user_orders.size
    user_order = user_orders[0]
    assert_equal "Max S", user_order.user_name
    #... for the rest of lines
    assert_equal 1, user_order.shop_items.size
    assert_equal one_book, user_order.shop_items[0].my_test_scaffold

    # Mail is sent
    user_mail = ActionMailer::Base.deliveries.last
    assert_equal "e-xormail@mail.ru", user_mail[:from].value
    assert_equal "Shipping confirmation", user_mail.subject

  end
end
