class GroupShopItemsInShopCarts < ActiveRecord::Migration
  def self.up
    # Combine shop items in shop carts
    ShopCart.all.each do |sc|
      # group by product and count its sum
      sums = sc.shop_items.group(:my_test_scaffold_id).sum(:quantity)
      sums.each do |mts_id, q|
        if q > 1
          # remove multiple records
          sc.shop_items.where(:my_test_scaffold_id => mts_id).delete_all
          # and leave one record
          sc.shop_items.create :my_test_scaffold_id => mts_id, :quantity => q
        end
      end
    end
  end

  def self.down
    # split shop items back
    ShopItem.where('quantity > 1').each do |si|
      si.quantity.times do
        ShopItem.create :shop_cart_id => si.shop_cart_id, :my_test_scaffold_id => si.my_test_scaffold_id, :quantity => 1
      end
      si.destroy
    end
  end
end
