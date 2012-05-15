class CreateAuthUsers < ActiveRecord::Migration
  def self.up
    create_table :auth_users do |t|
      t.string :user_name
      t.string :enc_pass
      t.string :pass_salt

      t.timestamps
    end
  end

  def self.down
    drop_table :auth_users
  end
end
