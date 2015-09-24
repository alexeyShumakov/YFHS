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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150924100927) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "builder_cards", force: :cascade do |t|
    t.integer  "card_id"
    t.integer  "deck_id"
    t.integer  "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "builder_cards", ["card_id"], name: "index_builder_cards_on_card_id", using: :btree
  add_index "builder_cards", ["deck_id"], name: "index_builder_cards_on_deck_id", using: :btree

  create_table "cards", force: :cascade do |t|
    t.string   "card_game_id"
    t.string   "name"
    t.string   "card_set"
    t.integer  "durability"
    t.string   "card_type"
    t.string   "race"
    t.string   "player_class_str"
    t.string   "faction"
    t.string   "rarity"
    t.integer  "cost"
    t.integer  "attack"
    t.integer  "health"
    t.string   "text"
    t.string   "flavor"
    t.string   "artist"
    t.boolean  "collectible"
    t.boolean  "elite"
    t.string   "locale"
    t.json     "mechanics"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
    t.string   "img_gold_file_name"
    t.string   "img_gold_content_type"
    t.integer  "img_gold_file_size"
    t.datetime "img_gold_updated_at"
    t.integer  "player_class_id"
  end

  add_index "cards", ["player_class_id"], name: "index_cards_on_player_class_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "news_id"
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["news_id"], name: "index_comments_on_news_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "deck_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "decks", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "deck_type_id"
  end

  add_index "decks", ["deck_type_id"], name: "index_decks_on_deck_type_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "news_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likes", ["news_id"], name: "index_likes_on_news_id", using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "news", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "news", ["user_id"], name: "index_news_on_user_id", using: :btree

  create_table "player_classes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

  create_table "users", force: :cascade do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "builder_cards", "cards"
  add_foreign_key "builder_cards", "decks"
  add_foreign_key "cards", "player_classes"
  add_foreign_key "comments", "news"
  add_foreign_key "comments", "users"
  add_foreign_key "decks", "deck_types"
  add_foreign_key "likes", "news"
  add_foreign_key "likes", "users"
  add_foreign_key "news", "users"
end
