class CreateUserOrders < ActiveRecord::Migration
  def self.up
    create_table :user_orders do |t|
      t.string :user_name
      t.text :user_address
      t.string :user_email
      t.string :user_pay_type

      t.timestamps
    end
  end

  def self.down
    drop_table :user_orders
  end
end
