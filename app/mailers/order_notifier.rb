class OrderNotifier < ActionMailer::Base
  default :from => "e-xormail@mail.ru"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.user_order_received.subject
  #
  def user_order_received(user_order)
    @user_order = user_order

    mail :to => @user_order.user_email, :subject => 'Order Confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.user_order_shipped.subject
  #
  def user_order_shipped(user_order)
#    @greeting = "Hi"
#
#    mail :to => "to@example.org"
    @user_order = user_order
    mail :to => @user_order.user_email, :subject => 'Shipping confirmation'
  end
end
