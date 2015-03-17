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

ActiveRecord::Schema.define(version: 20150317003258) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "black_cards", force: :cascade do |t|
    t.string  "text",      limit: 255,             null: false
    t.integer "draw",      limit: 2,   default: 0
    t.integer "pick",      limit: 2,   default: 1
    t.string  "watermark", limit: 5
  end

  add_index "black_cards", ["text"], name: "black_cards_text_key", unique: true, using: :btree

  create_table "card_set", force: :cascade do |t|
    t.boolean "active",                              null: false
    t.string  "name",        limit: 255
    t.boolean "base_deck",                           null: false
    t.string  "description", limit: 255
    t.integer "weight",                  default: 0, null: false
  end

  create_table "card_set_black_card", primary_key: "card_set_id", force: :cascade do |t|
    t.integer "black_card_id", null: false
  end

  create_table "card_set_white_card", primary_key: "card_set_id", force: :cascade do |t|
    t.integer "white_card_id", null: false
  end

  create_table "cards", force: :cascade do |t|
    t.string "color", null: false
    t.string "text",  null: false
  end

  create_table "decks", force: :cascade do |t|
    t.string "color", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string  "name",    null: false
    t.integer "game_id", null: false
  end

  create_table "white_cards", force: :cascade do |t|
    t.string "text",      limit: 255, null: false
    t.string "watermark", limit: 5
  end

  add_index "white_cards", ["text"], name: "white_cards_text_key", unique: true, using: :btree

  add_foreign_key "card_set_black_card", "black_cards", name: "fk513da45c997611f9"
  add_foreign_key "card_set_black_card", "card_set", name: "fk513da45cb2505f39"
  add_foreign_key "card_set_white_card", "card_set", name: "fkc2487272b2505f39"
  add_foreign_key "card_set_white_card", "white_cards", name: "fkc2487272bfd29b4d"
end
