require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "user_order_received" do
    mail = OrderNotifier.user_order_received(user_orders(:one))
    assert_equal "Order Confirmation", mail.subject
    assert_equal ["asd@asd.com"], mail.to
    assert_equal ["e-xormail@mail.ru"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "user_order_shipped" do
    mail = OrderNotifier.user_order_shipped(user_orders(:two))
    assert_equal "Shipping confirmation", mail.subject
    assert_equal ["MyString"], mail.to
    assert_equal ["e-xormail@mail.ru"], mail.from
    assert_match /Shipping updates/, mail.body.encoded
  end

end
