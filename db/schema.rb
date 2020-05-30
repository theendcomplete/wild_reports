# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_30_145219) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.bigint "organization_id"
    t.string "name", default: "", null: false
    t.string "barcode", default: "", null: false
    t.string "wb_code", default: "", null: false
    t.string "code", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["barcode", "organization_id"], name: "index_items_on_barcode_and_organization_id", unique: true
    t.index ["code", "organization_id"], name: "index_items_on_code_and_organization_id", unique: true
    t.index ["organization_id"], name: "index_items_on_organization_id"
    t.index ["wb_code", "organization_id"], name: "index_items_on_wb_code_and_organization_id", unique: true
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "inn"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stock_infos", force: :cascade do |t|
    t.bigint "item_id"
    t.datetime "last_change_date"
    t.string "supplier_article"
    t.string "tech_size"
    t.integer "quantity"
    t.boolean "is_supply"
    t.boolean "is_realization"
    t.integer "quantity_full"
    t.integer "quantity_not_in_orders"
    t.string "warehouse_name"
    t.integer "in_way_to_client"
    t.integer "in_way_from_client"
    t.integer "nm_id"
    t.string "subject"
    t.string "category"
    t.integer "days_on_site"
    t.string "brand"
    t.integer "price"
    t.integer "discount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id", "last_change_date"], name: "index_stock_infos_on_item_id_and_last_change_date", unique: true
    t.index ["item_id"], name: "index_stock_infos_on_item_id"
    t.index ["warehouse_name"], name: "index_stock_infos_on_warehouse_name"
  end

  create_table "user_organizations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "organization_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_user_organizations_on_organization_id"
    t.index ["user_id"], name: "index_user_organizations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "jti", null: false
    t.integer "role", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
