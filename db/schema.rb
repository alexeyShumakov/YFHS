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

ActiveRecord::Schema.define(version: 20160202180720) do

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
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
    t.string   "img_gold_file_name"
    t.string   "img_gold_content_type"
    t.integer  "img_gold_file_size"
    t.datetime "img_gold_updated_at"
    t.integer  "player_class_id"
    t.integer  "comments_count",        default: 0
  end

  add_index "cards", ["player_class_id"], name: "index_cards_on_player_class_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.string   "body"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "deck_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "decks", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "deck_type_id"
    t.integer  "player_class_id"
    t.string   "description"
    t.integer  "user_id"
    t.json     "curve"
    t.integer  "comments_count",  default: 0
  end

  add_index "decks", ["deck_type_id"], name: "index_decks_on_deck_type_id", using: :btree
  add_index "decks", ["player_class_id"], name: "index_decks_on_player_class_id", using: :btree
  add_index "decks", ["user_id"], name: "index_decks_on_user_id", using: :btree

  create_table "dialogs", force: :cascade do |t|
    t.integer  "owner_id"
    t.integer  "company_id"
    t.integer  "duplicate_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "unread",       default: true
  end

  add_index "dialogs", ["company_id"], name: "index_dialogs_on_company_id", using: :btree
  add_index "dialogs", ["duplicate_id"], name: "index_dialogs_on_duplicate_id", using: :btree
  add_index "dialogs", ["owner_id"], name: "index_dialogs_on_owner_id", using: :btree

  create_table "dialogs_messages", force: :cascade do |t|
    t.integer  "dialog_id"
    t.integer  "message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "dialogs_messages", ["dialog_id"], name: "index_dialogs_messages_on_dialog_id", using: :btree
  add_index "dialogs_messages", ["message_id"], name: "index_dialogs_messages_on_message_id", using: :btree

  create_table "guide_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guides", force: :cascade do |t|
    t.integer  "comments_count",    default: 0
    t.string   "name"
    t.string   "body"
    t.integer  "guide_category_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "guides", ["guide_category_id"], name: "index_guides_on_guide_category_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.string   "body"
    t.integer  "user_id"
    t.integer  "target_user_id"
    t.boolean  "unread",         default: true
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "messages", ["target_user_id"], name: "index_messages_on_target_user_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "news", force: :cascade do |t|
    t.string   "name"
    t.string   "body"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "user_id"
    t.integer  "comments_count", default: 0
  end

  add_index "news", ["user_id"], name: "index_news_on_user_id", using: :btree

  create_table "player_classes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

  create_table "rs_evaluations", force: :cascade do |t|
    t.string   "reputation_name"
    t.integer  "source_id"
    t.string   "source_type"
    t.integer  "target_id"
    t.string   "target_type"
    t.float    "value",           default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "data"
  end

  add_index "rs_evaluations", ["reputation_name", "source_id", "source_type", "target_id", "target_type"], name: "index_rs_evaluations_on_reputation_name_and_source_and_target", unique: true, using: :btree
  add_index "rs_evaluations", ["reputation_name"], name: "index_rs_evaluations_on_reputation_name", using: :btree
  add_index "rs_evaluations", ["source_id", "source_type"], name: "index_rs_evaluations_on_source_id_and_source_type", using: :btree
  add_index "rs_evaluations", ["target_id", "target_type"], name: "index_rs_evaluations_on_target_id_and_target_type", using: :btree

  create_table "rs_reputation_messages", force: :cascade do |t|
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "receiver_id"
    t.float    "weight",      default: 1.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rs_reputation_messages", ["receiver_id", "sender_id", "sender_type"], name: "index_rs_reputation_messages_on_receiver_id_and_sender", unique: true, using: :btree
  add_index "rs_reputation_messages", ["receiver_id"], name: "index_rs_reputation_messages_on_receiver_id", using: :btree
  add_index "rs_reputation_messages", ["sender_id", "sender_type"], name: "index_rs_reputation_messages_on_sender_id_and_sender_type", using: :btree

  create_table "rs_reputations", force: :cascade do |t|
    t.string   "reputation_name"
    t.float    "value",           default: 0.0
    t.string   "aggregated_by"
    t.integer  "target_id"
    t.string   "target_type"
    t.boolean  "active",          default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "data"
  end

  add_index "rs_reputations", ["reputation_name", "target_id", "target_type"], name: "index_rs_reputations_on_reputation_name_and_target", unique: true, using: :btree
  add_index "rs_reputations", ["reputation_name"], name: "index_rs_reputations_on_reputation_name", using: :btree
  add_index "rs_reputations", ["target_id", "target_type"], name: "index_rs_reputations_on_target_id_and_target_type", using: :btree

  create_table "synergies", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "user_id"
    t.integer  "player_class_id"
    t.integer  "comments_count",  default: 0
  end

  add_index "synergies", ["player_class_id"], name: "index_synergies_on_player_class_id", using: :btree
  add_index "synergies", ["user_id"], name: "index_synergies_on_user_id", using: :btree

  create_table "synergy_cards", force: :cascade do |t|
    t.integer  "synergy_id"
    t.integer  "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "synergy_cards", ["card_id"], name: "index_synergy_cards_on_card_id", using: :btree
  add_index "synergy_cards", ["synergy_id"], name: "index_synergy_cards_on_synergy_id", using: :btree

  create_table "twitch_streams", force: :cascade do |t|
    t.string   "streamer_name"
    t.string   "avatar"
    t.integer  "viewers"
    t.boolean  "online"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
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
    t.string   "name"
    t.string   "nickname"
    t.string   "public_nickname"
    t.string   "image"
    t.integer  "role",                   default: 0
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "authentication_token"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["nickname"], name: "index_users_on_nickname", unique: true, using: :btree
  add_index "users", ["public_nickname"], name: "index_users_on_public_nickname", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "builder_cards", "cards"
  add_foreign_key "builder_cards", "decks"
  add_foreign_key "cards", "player_classes"
  add_foreign_key "comments", "users"
  add_foreign_key "decks", "deck_types"
  add_foreign_key "decks", "player_classes"
  add_foreign_key "decks", "users"
  add_foreign_key "news", "users"
  add_foreign_key "synergies", "player_classes"
  add_foreign_key "synergies", "users"
  add_foreign_key "synergy_cards", "cards"
  add_foreign_key "synergy_cards", "synergies"
end
