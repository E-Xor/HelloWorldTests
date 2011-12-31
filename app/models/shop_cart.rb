class ShopCart < ActiveRecord::Base
  has_many :shop_items, :dependent => :destroy

  def add_test_scaffold(mts_id)
    current_shop_item = shop_items.where(:my_test_scaffold_id => mts_id).first
    if current_shop_item
      current_shop_item.quantity += 1
    else
      current_shop_item = ShopItem.new(:my_test_scaffold_id => mts_id)
      shop_items << current_shop_item
    end
    current_shop_item
  end
end
