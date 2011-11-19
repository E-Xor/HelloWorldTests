class CreateShopCarts < ActiveRecord::Migration
  def self.up
    create_table :shop_carts do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :shop_carts
  end
end
