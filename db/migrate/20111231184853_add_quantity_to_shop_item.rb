class AddQuantityToShopItem < ActiveRecord::Migration
  def self.up
    add_column :shop_items, :quantity, :integer, :default => 1, :after => :shop_cart_id
  end

  def self.down
    remove_column :shop_items, :quantity
  end
end
