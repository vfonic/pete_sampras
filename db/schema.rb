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

ActiveRecord::Schema.define(version: 20150722214702) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "serves", force: :cascade do |t|
    t.integer "banner_id"
    t.integer "campaign_id"
    t.integer "click_id"
    t.integer "conversion_id"
    t.decimal "revenue",       precision: 15, scale: 10
  end

  add_index "serves", ["campaign_id"], name: "index_serves_on_campaign_id", using: :btree

end
