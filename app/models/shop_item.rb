class ShopItem < ActiveRecord::Base
  belongs_to :my_test_scaffold
  belongs_to :shop_cart
end
