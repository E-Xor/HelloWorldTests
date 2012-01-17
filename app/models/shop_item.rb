class ShopItem < ActiveRecord::Base
  belongs_to :user_order
  belongs_to :my_test_scaffold
  belongs_to :shop_cart

  def total_price
    my_test_scaffold.price * quantity
  end

end
