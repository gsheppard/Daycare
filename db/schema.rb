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

ActiveRecord::Schema.define(version: 20140522233018) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", force: true do |t|
    t.string  "identifier",     null: false
    t.integer "generation_id",  null: false
    t.integer "is_main_series", null: false
  end

  create_table "daycare_pokemons", force: true do |t|
    t.string   "nickname",                   null: false
    t.integer  "pokemon_id",                 null: false
    t.integer  "ability_id",                 null: false
    t.integer  "nature_id",                  null: false
    t.integer  "gender",                     null: false
    t.boolean  "hp_iv",      default: false, null: false
    t.boolean  "atk_iv",     default: false, null: false
    t.boolean  "def_iv",     default: false, null: false
    t.boolean  "spa_iv",     default: false, null: false
    t.boolean  "spd_iv",     default: false, null: false
    t.boolean  "spe_iv",     default: false, null: false
    t.integer  "move1"
    t.integer  "move2"
    t.integer  "move3"
    t.integer  "move4"
    t.integer  "user_id",                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "moves", force: true do |t|
    t.string  "identifier",              null: false
    t.integer "generation_id"
    t.integer "type_id"
    t.integer "power"
    t.integer "pp"
    t.integer "accuracy"
    t.integer "priority"
    t.integer "target_id"
    t.integer "damage_class_id"
    t.integer "effect_id"
    t.integer "effect_chance"
    t.integer "contest_type_id"
    t.integer "contest_effect_id"
    t.integer "super_contest_effect_id"
  end

  create_table "natures", force: true do |t|
    t.string  "identifier",        null: false
    t.integer "decreased_stat_id", null: false
    t.integer "increased_stat_id", null: false
    t.integer "hates_flavor_id",   null: false
    t.integer "likes_flavor_id",   null: false
  end

  create_table "pokemons", force: true do |t|
    t.string  "identifier",      null: false
    t.integer "species_id",      null: false
    t.integer "height",          null: false
    t.integer "weight",          null: false
    t.integer "base_experience", null: false
    t.integer "order",           null: false
    t.integer "is_default",      null: false
  end

  create_table "stats", force: true do |t|
    t.integer "damage_class_id"
    t.string  "identifier",      null: false
    t.integer "is_battle_only",  null: false
    t.integer "game_index"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "display_name",                        null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
