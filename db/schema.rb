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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170324182358) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "base_goods_descriptions", force: :cascade do |t|
    t.text     "name"
    t.text     "description"
    t.text     "country"
    t.boolean  "in_hand"
    t.text     "base"
    t.integer  "burning_time"
    t.integer  "height"
    t.integer  "cost"
    t.integer  "diameter"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.text     "youtube_link"
    t.string   "slug"
    t.index ["slug"], name: "index_base_goods_descriptions_on_slug", unique: true, using: :btree
  end

  create_table "delivery_options", force: :cascade do |t|
    t.text     "description"
    t.integer  "cost"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "goods", force: :cascade do |t|
    t.integer  "base_goods_description_id"
    t.text     "color"
    t.integer  "quantity"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.text     "color_code"
    t.index ["base_goods_description_id"], name: "index_goods_on_base_goods_description_id", using: :btree
  end

  create_table "images", force: :cascade do |t|
    t.integer  "base_goods_description_id"
    t.text     "alt"
    t.text     "title"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["base_goods_description_id"], name: "index_images_on_base_goods_description_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.text     "email"
    t.text     "phone"
    t.text     "person"
    t.text     "address"
    t.integer  "delivery_option_id"
    t.json     "cart"
    t.integer  "status",             default: 0, null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "cost"
    t.integer  "delivery_cost"
    t.index ["delivery_option_id"], name: "index_orders_on_delivery_option_id", using: :btree
  end

  create_table "reserves", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "good_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["good_id"], name: "index_reserves_on_good_id", using: :btree
    t.index ["order_id"], name: "index_reserves_on_order_id", using: :btree
  end

  add_foreign_key "goods", "base_goods_descriptions"
  add_foreign_key "images", "base_goods_descriptions"
  add_foreign_key "orders", "delivery_options"
  add_foreign_key "reserves", "goods"
  add_foreign_key "reserves", "orders"
end
