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

ActiveRecord::Schema.define(version: 2023_05_04_195141) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "candidate_issues", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "issue_id"
    t.uuid "candidate_id"
    t.integer "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id"], name: "index_candidate_issues_on_candidate_id"
    t.index ["issue_id"], name: "index_candidate_issues_on_issue_id"
  end

  create_table "candidates", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "from"
    t.integer "years_exp"
    t.boolean "incumbent"
    t.integer "years_in_current_office"
    t.string "current_office"
    t.string "bio"
    t.integer "age"
    t.uuid "personal_party_id"
    t.uuid "running_party_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["personal_party_id"], name: "index_candidates_on_personal_party_id"
    t.index ["running_party_id"], name: "index_candidates_on_running_party_id"
  end

  create_table "elections", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "description"
    t.datetime "electionDate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "issues", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "parties", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "race_issues", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "race_id"
    t.uuid "issue_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["issue_id"], name: "index_race_issues_on_issue_id"
    t.index ["race_id"], name: "index_race_issues_on_race_id"
  end

  create_table "races", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "range"
    t.string "position"
    t.string "year"
    t.uuid "election_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["election_id"], name: "index_races_on_election_id"
  end

  add_foreign_key "candidate_issues", "candidates"
  add_foreign_key "candidate_issues", "issues"
  add_foreign_key "candidates", "parties", column: "personal_party_id"
  add_foreign_key "candidates", "parties", column: "running_party_id"
  add_foreign_key "race_issues", "issues"
  add_foreign_key "race_issues", "races"
  add_foreign_key "races", "elections"
end
