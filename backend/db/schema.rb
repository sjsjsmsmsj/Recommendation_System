# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_01_04_104026) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "ai_modules", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.boolean "is_active"
    t.string "module_type"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "ai_requests", force: :cascade do |t|
    t.bigint "ai_module_id", null: false
    t.datetime "created_at", null: false
    t.text "input_data"
    t.string "request_status"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["ai_module_id"], name: "index_ai_requests_on_ai_module_id"
    t.index ["user_id"], name: "index_ai_requests_on_user_id"
  end

  create_table "ai_responses", force: :cascade do |t|
    t.bigint "ai_request_id", null: false
    t.datetime "created_at", null: false
    t.text "output_data"
    t.integer "processing_time"
    t.datetime "updated_at", null: false
    t.index ["ai_request_id"], name: "index_ai_responses_on_ai_request_id"
  end

  create_table "logs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "log_level"
    t.text "message"
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "paid_at", precision: nil
    t.string "payment_method"
    t.string "payment_status"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "system_settings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "setting_key"
    t.string "setting_value"
    t.datetime "updated_at", null: false
  end

  create_table "usage_histories", force: :cascade do |t|
    t.bigint "ai_module_id", null: false
    t.bigint "ai_request_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "used_at", precision: nil
    t.bigint "user_id", null: false
    t.index ["ai_module_id"], name: "index_usage_histories_on_ai_module_id"
    t.index ["ai_request_id"], name: "index_usage_histories_on_ai_request_id"
    t.index ["user_id"], name: "index_usage_histories_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "full_name"
    t.string "password_hash"
    t.bigint "role_id", null: false
    t.string "status"
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "ai_requests", "ai_modules"
  add_foreign_key "ai_requests", "users"
  add_foreign_key "ai_responses", "ai_requests"
  add_foreign_key "payments", "users"
  add_foreign_key "usage_histories", "ai_modules"
  add_foreign_key "usage_histories", "ai_requests"
  add_foreign_key "usage_histories", "users"
  add_foreign_key "users", "roles"
end
