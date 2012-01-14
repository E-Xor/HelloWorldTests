class AddUserOrderIdToShopItem < ActiveRecord::Migration
  def self.up
    add_column :shop_items, :user_order_id, :integer
  end

  def self.down
    remove_column :shop_items, :user_order_id
  end
end
