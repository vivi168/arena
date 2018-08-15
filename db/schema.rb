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

ActiveRecord::Schema.define(version: 2018_08_15_125845) do

  create_table "fights", force: :cascade do |t|
    t.integer "home_id"
    t.integer "away_id"
    t.integer "winner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["away_id"], name: "index_fights_on_away_id"
    t.index ["home_id"], name: "index_fights_on_home_id"
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
  end

end