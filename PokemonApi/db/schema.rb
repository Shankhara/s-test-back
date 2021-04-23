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

ActiveRecord::Schema.define(version: 2021_04_20_172206) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", force: :cascade do |t|
    t.bigint "combat_id"
    t.bigint "pokemon_id"
    t.bigint "move_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["combat_id"], name: "index_actions_on_combat_id"
    t.index ["move_id"], name: "index_actions_on_move_id"
    t.index ["pokemon_id"], name: "index_actions_on_pokemon_id"
  end

  create_table "combats", force: :cascade do |t|
    t.integer "winner_id"
    t.integer "xp_gain"
    t.bigint "attacker_id"
    t.bigint "opponent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attacker_id"], name: "index_combats_on_attacker_id"
    t.index ["opponent_id"], name: "index_combats_on_opponent_id"
  end

  create_table "moves", force: :cascade do |t|
    t.string "name"
    t.integer "damage"
    t.bigint "pokemon_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id"], name: "index_moves_on_pokemon_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.string "p_type"
    t.integer "exp", default: 0
    t.integer "hp", default: 100
    t.boolean "available", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "actions", "combats"
  add_foreign_key "actions", "moves"
  add_foreign_key "actions", "pokemons"
  add_foreign_key "combats", "pokemons", column: "attacker_id"
  add_foreign_key "combats", "pokemons", column: "opponent_id"
  add_foreign_key "moves", "pokemons"
end
