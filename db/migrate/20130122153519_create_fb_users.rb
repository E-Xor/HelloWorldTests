class CreateFbUsers < ActiveRecord::Migration
  def change
    create_table :fb_users do |t|
      t.string :graph_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :access_token

      t.timestamps
    end
  end
end
