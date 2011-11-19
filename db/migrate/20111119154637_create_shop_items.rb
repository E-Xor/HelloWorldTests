class CreateShopItems < ActiveRecord::Migration
  def self.up
    create_table :shop_items do |t|
      t.integer :my_test_scaffold_id
      t.integer :shop_cart_id

      t.timestamps
    end
  end

  def self.down
    drop_table :shop_items
  end
end
