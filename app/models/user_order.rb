class UserOrder < ActiveRecord::Base
  has_many :shop_items, :dependent => :destroy

  PAYMENT_TYPES = PaymentType.all(:select => 'payment_type').map(&:payment_type)
  validates :user_name, :user_address, :user_email, :user_pay_type, :presence => true
  validates :user_pay_type, :inclusion => PAYMENT_TYPES + ["PayPal"] # Additional PayPal for the integration test
  def add_shop_items_from_user_cart(shop_cart)
    shop_cart.shop_items.each do |si|
      si.shop_cart_id = nil
      shop_items << si
    end
  end
end
