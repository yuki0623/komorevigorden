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

ActiveRecord::Schema.define(version: 2020_07_25_043956) do

  create_table "casts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer "password"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_casts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_casts_on_reset_password_token", unique: true
  end

  create_table "gests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer "password"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "age"
    t.string "from"
    t.decimal "birthday", precision: 10
    t.string "nickname"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_gests_on_email", unique: true
    t.index ["reset_password_token"], name: "index_gests_on_reset_password_token", unique: true
  end

  create_table "groups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_groups_on_name", unique: true
  end

  create_table "groups_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hosts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_hosts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_hosts_on_reset_password_token", unique: true
  end

  create_table "kartes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "age", null: false
    t.string "from", null: false
    t.decimal "birthday", precision: 10, null: false
    t.string "gender_identities"
    t.text "consultation_content", null: false
    t.text "hearing1", null: false
    t.text "hearing2", null: false
    t.text "hearing3"
    t.text "hearing4"
    t.text "remarks"
    t.bigint "host_id"
    t.bigint "casts_id"
    t.bigint "gests_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["casts_id"], name: "index_kartes_on_casts_id"
    t.index ["gests_id"], name: "index_kartes_on_gests_id"
    t.index ["host_id"], name: "index_kartes_on_host_id"
  end

  create_table "messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content", null: false
    t.text "image"
    t.bigint "group_id"
    t.bigint "host_id", null: false
    t.bigint "casts_id", null: false
    t.bigint "gests_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["casts_id"], name: "index_messages_on_casts_id"
    t.index ["gests_id"], name: "index_messages_on_gests_id"
    t.index ["group_id"], name: "index_messages_on_group_id"
    t.index ["host_id"], name: "index_messages_on_host_id"
  end

  add_foreign_key "messages", "groups"
end
