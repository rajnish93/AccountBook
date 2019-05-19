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

ActiveRecord::Schema.define(version: 2018_07_17_145326) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accountgroups", force: :cascade do |t|
    t.integer "rkaccountcode"
    t.string "rkaccountname"
    t.string "rkaccounttype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rkaccountcode"], name: "index_accountgroups_on_rkaccountcode", unique: true
    t.index ["rkaccountname"], name: "index_accountgroups_on_rkaccountname", unique: true
  end

  create_table "chartaccounts", force: :cascade do |t|
    t.integer "rkcoacode"
    t.string "rkcoaname"
    t.bigint "accountgroup_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accountgroup_id"], name: "index_chartaccounts_on_accountgroup_id"
    t.index ["rkcoacode"], name: "index_chartaccounts_on_rkcoacode", unique: true
    t.index ["rkcoaname"], name: "index_chartaccounts_on_rkcoaname", unique: true
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.boolean "rkactive"
    t.integer "rkdeptcode"
    t.string "rkdeptname"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_departments_on_company_id"
    t.index ["rkdeptcode"], name: "index_departments_on_rkdeptcode", unique: true
    t.index ["rkdeptname"], name: "index_departments_on_rkdeptname", unique: true
  end

  create_table "orders", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.text "address"
    t.date "delivery_date"
    t.text "product_id"
    t.string "payment_option"
    t.decimal "amount", precision: 9, scale: 2
    t.string "order_status"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_orders_on_company_id"
    t.index ["product_id"], name: "index_orders_on_product_id"
  end

  create_table "settings", force: :cascade do |t|
    t.string "var", null: false
    t.text "value"
    t.integer "thing_id"
    t.string "thing_type", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["thing_id"], name: "index_settings_on_thing_id"
    t.index ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true
  end

  create_table "suppliers", force: :cascade do |t|
    t.boolean "rksupplierstatus"
    t.string "rksuppliername"
    t.string "rksuppliertin"
    t.string "rksupplierpan"
    t.string "rksuppliergstn"
    t.string "rksupplierddalic"
    t.string "rksupplierphone"
    t.text "rksupplieraddress"
    t.string "rksuppliercity"
    t.string "rksupplierzone"
    t.string "rksupplierstate"
    t.string "rksupplierzipcode"
    t.string "rksuppliercountry"
    t.bigint "chartaccount_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chartaccount_id"], name: "index_suppliers_on_chartaccount_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "chartaccounts", "accountgroups"
  add_foreign_key "departments", "companies"
  add_foreign_key "orders", "companies"
  add_foreign_key "suppliers", "chartaccounts"
  add_foreign_key "users", "companies"
end
