# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130122153519) do

  create_table "auth_users", :force => true do |t|
    t.string   "user_name"
    t.string   "enc_pass"
    t.string   "pass_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cars", :force => true do |t|
    t.string   "name"
    t.string   "options"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fb_users", :force => true do |t|
    t.string   "graph_id"
    t.string   "access_token"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "my_test_scaffolds", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "price",              :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "payment_types", :force => true do |t|
    t.string   "payment_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resque_ques", :force => true do |t|
    t.string   "printed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shop_carts", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shop_items", :force => true do |t|
    t.integer  "my_test_scaffold_id"
    t.integer  "shop_cart_id"
    t.integer  "quantity",            :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_order_id"
  end

  create_table "texts", :force => true do |t|
    t.string   "str"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_orders", :force => true do |t|
    t.string   "user_name"
    t.text     "user_address"
    t.string   "user_email"
    t.string   "user_pay_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
