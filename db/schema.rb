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

ActiveRecord::Schema.define(version: 2019_05_18_100041) do

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

  create_table "accountjournals", force: :cascade do |t|
    t.integer "rkvouchercode"
    t.bigint "chartaccount_id"
    t.bigint "sale_id"
    t.decimal "rkvoucheramount", precision: 9, scale: 2
    t.text "rkvoucherdescription"
    t.datetime "rkvoucherdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chartaccount_id"], name: "index_accountjournals_on_chartaccount_id"
    t.index ["rkvouchercode"], name: "index_accountjournals_on_rkvouchercode", unique: true
    t.index ["sale_id"], name: "index_accountjournals_on_sale_id"
  end

  create_table "batches", force: :cascade do |t|
    t.boolean "rkbatchstatus"
    t.string "rkbatchno"
    t.bigint "product_id"
    t.integer "rkbatchstock"
    t.string "rkbatchpacking"
    t.decimal "rkbatchpurchaserate", precision: 9, scale: 2
    t.decimal "rkbatchsalerate", precision: 9, scale: 2
    t.decimal "rkbatchwholesalerate", precision: 9, scale: 2
    t.date "rkbatchexpiry"
    t.decimal "rkbatchmrp", precision: 9, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_batches_on_product_id"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "customers", force: :cascade do |t|
    t.boolean "rkcustomerstatus"
    t.string "rkcustomername"
    t.string "rkcustomertin"
    t.string "rkcustomerpan"
    t.string "rkcustomergstn"
    t.string "rkcustomerddalic"
    t.string "rkcustomerphone"
    t.text "rkcustomeraddress"
    t.string "rkcustomercity"
    t.string "rkcustomerzone"
    t.string "rkcustomerstate"
    t.string "rkcustomerzipcode"
    t.string "rkcustomercountry"
    t.bigint "chartaccount_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chartaccount_id"], name: "index_customers_on_chartaccount_id"
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

  create_table "employees", force: :cascade do |t|
    t.boolean "rkactive"
    t.integer "rkempcode"
    t.string "rkempname"
    t.string "rkempgender"
    t.bigint "department_id"
    t.datetime "rkhiredate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_employees_on_department_id"
    t.index ["rkempcode"], name: "index_employees_on_rkempcode", unique: true
  end

  create_table "invoice_series", force: :cascade do |t|
    t.string "rkseriesname"
    t.string "rkseriesvalue"
    t.boolean "rkseriesactive", default: true
    t.boolean "rkseriesdefault", default: false
    t.integer "rkfirst_number", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "productcategories", force: :cascade do |t|
    t.string "rkproductcategorycode"
    t.string "rkproductcategoryname"
    t.bigint "chartaccount_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chartaccount_id"], name: "index_productcategories_on_chartaccount_id"
    t.index ["rkproductcategorycode"], name: "index_productcategories_on_rkproductcategorycode", unique: true
    t.index ["rkproductcategoryname"], name: "index_productcategories_on_rkproductcategoryname", unique: true
  end

  create_table "productpurchasegsts", force: :cascade do |t|
    t.bigint "chartaccount_id"
    t.bigint "supplier_id"
    t.bigint "employee_id"
    t.string "rkpurchaseinvoiceno"
    t.date "rkpurchasedate"
    t.date "rkpurchaseduedate"
    t.string "rktransportname"
    t.string "rkpurchasegrno"
    t.date "rkgoodsreceived"
    t.integer "rkpurchasenocase"
    t.decimal "rkpurchasesubtotal", precision: 9, scale: 2
    t.decimal "rkpurchasetotaligst", precision: 9, scale: 2
    t.decimal "rkpurchasetotalcgst", precision: 9, scale: 2
    t.decimal "rkpurchasetotalsgst", precision: 9, scale: 2
    t.decimal "rkpurchasediscount", precision: 9, scale: 2
    t.decimal "rkpurchaseshipping", precision: 9, scale: 2
    t.decimal "rkpurchasegrandtotal", precision: 9, scale: 2
    t.string "rkpurchaseinwords"
    t.integer "rkpurchaseunittotal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "invoice_series_id"
    t.index ["chartaccount_id"], name: "index_productpurchasegsts_on_chartaccount_id"
    t.index ["employee_id"], name: "index_productpurchasegsts_on_employee_id"
    t.index ["invoice_series_id"], name: "index_productpurchasegsts_on_invoice_series_id"
    t.index ["supplier_id"], name: "index_productpurchasegsts_on_supplier_id"
  end

  create_table "productpurchasevats", force: :cascade do |t|
    t.bigint "chartaccount_id"
    t.bigint "supplier_id"
    t.bigint "employee_id"
    t.string "rkpurchaseinvoiceno"
    t.date "rkpurchasedate"
    t.date "rkpurchaseduedate"
    t.string "rktransportname"
    t.string "rkpurchasegrno"
    t.date "rkgoodsreceived"
    t.integer "rkpurchasenocase"
    t.integer "rkpurchaseccpercent"
    t.decimal "rkpurchasesubtotal", precision: 9, scale: 2
    t.decimal "rkpurchasetotalcc", precision: 9, scale: 2
    t.decimal "rkpurchaseccadded", precision: 9, scale: 2
    t.decimal "rkpurchasediscount", precision: 9, scale: 2
    t.decimal "rkpurchaseshipping", precision: 9, scale: 2
    t.decimal "rkpurchasegrandtotal", precision: 9, scale: 2
    t.string "rkpurchaseinwords"
    t.integer "rkpurchaseunittotal"
    t.integer "rkpurchasevatpercent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chartaccount_id"], name: "index_productpurchasevats_on_chartaccount_id"
    t.index ["employee_id"], name: "index_productpurchasevats_on_employee_id"
    t.index ["supplier_id"], name: "index_productpurchasevats_on_supplier_id"
  end

  create_table "products", force: :cascade do |t|
    t.boolean "rkproductstatus"
    t.string "rkproductname"
    t.text "rkproductdescription"
    t.bigint "supplier_id"
    t.bigint "productcategory_id"
    t.bigint "chartaccount_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chartaccount_id"], name: "index_products_on_chartaccount_id"
    t.index ["productcategory_id"], name: "index_products_on_productcategory_id"
    t.index ["supplier_id"], name: "index_products_on_supplier_id"
  end

  create_table "purchproditemgsts", force: :cascade do |t|
    t.bigint "productpurchasegst_id"
    t.string "rkpurchprodname"
    t.string "rkpurchprodbatch"
    t.string "rkpurchprodhsncode"
    t.string "rkpurchproduom"
    t.date "rkpurchprodexp"
    t.integer "rkpurchprodqty"
    t.decimal "rkpurchprodrate", precision: 9, scale: 2
    t.decimal "rkpurchprodigst", precision: 5, scale: 2
    t.decimal "rkpurchprodcgst", precision: 5, scale: 2
    t.decimal "rkpurchprodsgst", precision: 5, scale: 2
    t.decimal "rkpurchprodigstval", precision: 9, scale: 2
    t.decimal "rkpurchprodcgstval", precision: 9, scale: 2
    t.decimal "rkpurchprodsgstval", precision: 9, scale: 2
    t.decimal "rkpurchprodamount", precision: 9, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["productpurchasegst_id"], name: "index_purchproditemgsts_on_productpurchasegst_id"
  end

  create_table "purchproditemvats", force: :cascade do |t|
    t.bigint "productpurchasevat_id"
    t.bigint "product_id"
    t.string "rkpurchprobatch"
    t.string "rkpurchproduom"
    t.date "rkpurchprodexp"
    t.integer "rkpurchprodqty"
    t.integer "rkpurchprodfree"
    t.decimal "rkpurchprodrate", precision: 9, scale: 2
    t.decimal "rkpurchprodsubval", precision: 9, scale: 2
    t.decimal "rkpurchprodamount", precision: 9, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_purchproditemvats_on_product_id"
    t.index ["productpurchasevat_id"], name: "index_purchproditemvats_on_productpurchasevat_id"
  end

  create_table "sales", force: :cascade do |t|
    t.string "rksaleinvoice"
    t.date "rksaledate"
    t.date "rksaleduedate"
    t.bigint "customer_id"
    t.bigint "product_id"
    t.bigint "employee_id"
    t.bigint "accountjournal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accountjournal_id"], name: "index_sales_on_accountjournal_id"
    t.index ["customer_id"], name: "index_sales_on_customer_id"
    t.index ["employee_id"], name: "index_sales_on_employee_id"
    t.index ["product_id"], name: "index_sales_on_product_id"
    t.index ["rksaleinvoice"], name: "index_sales_on_rksaleinvoice", unique: true
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

  create_table "taxrates", force: :cascade do |t|
    t.bigint "chartaccount_id"
    t.string "rktaxtype"
    t.string "rktaxname"
    t.decimal "rktaxpercent", precision: 3, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chartaccount_id"], name: "index_taxrates_on_chartaccount_id"
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

  add_foreign_key "accountjournals", "chartaccounts"
  add_foreign_key "batches", "products"
  add_foreign_key "chartaccounts", "accountgroups"
  add_foreign_key "customers", "chartaccounts"
  add_foreign_key "departments", "companies"
  add_foreign_key "employees", "departments"
  add_foreign_key "orders", "companies"
  add_foreign_key "productcategories", "chartaccounts"
  add_foreign_key "productpurchasegsts", "chartaccounts"
  add_foreign_key "productpurchasegsts", "employees"
  add_foreign_key "productpurchasegsts", "suppliers"
  add_foreign_key "productpurchasevats", "chartaccounts"
  add_foreign_key "productpurchasevats", "employees"
  add_foreign_key "productpurchasevats", "suppliers"
  add_foreign_key "products", "chartaccounts"
  add_foreign_key "products", "productcategories"
  add_foreign_key "products", "suppliers"
  add_foreign_key "purchproditemgsts", "productpurchasegsts"
  add_foreign_key "purchproditemvats", "productpurchasevats"
  add_foreign_key "purchproditemvats", "products"
  add_foreign_key "sales", "accountjournals"
  add_foreign_key "sales", "customers"
  add_foreign_key "sales", "employees"
  add_foreign_key "sales", "products"
  add_foreign_key "suppliers", "chartaccounts"
  add_foreign_key "taxrates", "chartaccounts"
  add_foreign_key "users", "companies"
end
