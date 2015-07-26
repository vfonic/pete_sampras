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

ActiveRecord::Schema.define(version: 20150726183245) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "banners", force: :cascade do |t|
    t.string "image_name"
  end

  create_table "campaigns", force: :cascade do |t|
  end

  create_table "clicks", force: :cascade do |t|
    t.integer "banner_id"
    t.integer "campaign_id"
  end

  add_index "clicks", ["banner_id"], name: "index_clicks_on_banner_id", using: :btree
  add_index "clicks", ["campaign_id"], name: "index_clicks_on_campaign_id", using: :btree

  create_table "conversions", force: :cascade do |t|
    t.integer "click_id"
    t.decimal "revenue",  precision: 15, scale: 10
  end

  add_index "conversions", ["click_id"], name: "index_conversions_on_click_id", using: :btree

  create_table "impressions", force: :cascade do |t|
    t.integer "banner_id"
    t.integer "campaign_id"
  end

  add_index "impressions", ["banner_id"], name: "index_impressions_on_banner_id", using: :btree
  add_index "impressions", ["campaign_id"], name: "index_impressions_on_campaign_id", using: :btree

  create_table "serves", force: :cascade do |t|
    t.integer "banner_id"
    t.integer "campaign_id"
    t.integer "click_id"
    t.integer "conversion_id"
    t.decimal "revenue",       precision: 15, scale: 10
  end

  add_index "serves", ["campaign_id"], name: "index_serves_on_campaign_id", using: :btree

end
