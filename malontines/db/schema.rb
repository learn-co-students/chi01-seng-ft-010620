# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_05_194134) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "love_notes", force: :cascade do |t|
    t.string "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "malones", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "svg_url"
    t.string "note_position"
  end

  create_table "malontines", force: :cascade do |t|
    t.bigint "creator_id", null: false
    t.bigint "malone_id", null: false
    t.bigint "love_note_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.index ["creator_id"], name: "index_malontines_on_creator_id"
    t.index ["love_note_id"], name: "index_malontines_on_love_note_id"
    t.index ["malone_id"], name: "index_malontines_on_malone_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "malontines", "love_notes"
  add_foreign_key "malontines", "malones"
  add_foreign_key "malontines", "users", column: "creator_id"
end
