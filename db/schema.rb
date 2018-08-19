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

ActiveRecord::Schema.define(version: 2018_08_19_183401) do

  create_table "fights", force: :cascade do |t|
    t.integer "home_id"
    t.integer "home_weapon_id"
    t.integer "away_id"
    t.integer "away_weapon_id"
    t.integer "winner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["away_id"], name: "index_fights_on_away_id"
    t.index ["away_weapon_id"], name: "index_fights_on_away_weapon_id"
    t.index ["home_id"], name: "index_fights_on_home_id"
    t.index ["home_weapon_id"], name: "index_fights_on_home_weapon_id"
    t.index ["winner_id"], name: "index_fights_on_winner_id"
  end

  create_table "gladiators", force: :cascade do |t|
    t.string "name"
    t.integer "max_hp"
    t.integer "stamina"
    t.integer "strength"
    t.integer "agility"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "turns", force: :cascade do |t|
    t.string "action"
    t.integer "fight_id"
    t.integer "offense_id"
    t.integer "defense_id"
    t.integer "damage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["defense_id"], name: "index_turns_on_defense_id"
    t.index ["fight_id"], name: "index_turns_on_fight_id"
    t.index ["offense_id"], name: "index_turns_on_offense_id"
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.integer "damage_low"
    t.integer "damage_high"
    t.integer "speed"
  end

end
