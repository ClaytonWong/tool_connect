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

ActiveRecord::Schema.define(version: 20171104114411) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conversations", force: :cascade do |t|
    t.bigint "owner_id"
    t.bigint "hirer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hirer_id"], name: "index_conversations_on_hirer_id"
    t.index ["owner_id"], name: "index_conversations_on_owner_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "conversation_id"
    t.bigint "user_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "username"
    t.string "family_name"
    t.string "middle_names"
    t.string "first_name"
    t.date "date_of_birth"
    t.string "country"
    t.string "state"
    t.integer "postcode"
    t.string "suburb"
    t.string "street_address"
    t.integer "level"
    t.string "unit"
    t.decimal "longitude", precision: 10, scale: 6
    t.decimal "decimal", precision: 10, scale: 6
    t.decimal "latitude", precision: 10, scale: 6
    t.string "ph_num"
    t.string "mob_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "tools", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "cost_of_hire_cents"
    t.bigint "owner_id"
    t.text "image_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_tools_on_owner_id"
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
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "conversations", "users", column: "hirer_id"
  add_foreign_key "conversations", "users", column: "owner_id"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "tools", "users", column: "owner_id"
end
