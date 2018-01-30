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

ActiveRecord::Schema.define(version: 20180103193456) do

  create_table "activities", force: :cascade do |t|
    t.text "city", null: false
    t.text "name", null: false
    t.text "address", null: false
    t.integer "owner", null: false
    t.float "mark", null: false
    t.integer "rank", null: false
    t.index ["id"], name: "Activity_id_uindex", unique: true
    t.index ["rank"], name: "Activity_rank_uindex", unique: true
  end

  create_table "activitiesOpinions", force: :cascade do |t|
    t.integer "activity", null: false
    t.integer "user", null: false
    t.text "opinion"
    t.float "mark", null: false
    t.index ["id"], name: "ActivityOpinion_id_uindex", unique: true
  end

  create_table "cities", force: :cascade do |t|
    t.integer "country", null: false
    t.text "name", null: false
    t.text "description"
    t.integer "rank", default: 0, null: false
    t.index ["id"], name: "City_id_uindex", unique: true
    t.index ["rank"], name: "City_rank_uindex", unique: true
  end

  create_table "countries", force: :cascade do |t|
    t.text "name", null: false
    t.text "description"
    t.integer "touristsCount"
  end

  create_table "hotelOpinions", force: :cascade do |t|
    t.integer "hotel", null: false
    t.integer "user", null: false
    t.text "opinion"
    t.float "mark", null: false
    t.index ["id"], name: "HotelOpinion_id_uindex", unique: true
  end

  create_table "hotels", force: :cascade do |t|
    t.integer "city", null: false
    t.text "name", null: false
    t.text "address", null: false
    t.integer "owner", null: false
    t.float "mark", null: false
    t.integer "rank", null: false
    t.index ["rank"], name: "Hotel_rank_uindex", unique: true
  end

  create_table "restaurantOpinions", force: :cascade do |t|
    t.integer "restaurant", null: false
    t.integer "user", null: false
    t.text "opinion"
    t.float "mark", null: false
    t.index ["id"], name: "RestaurantOpinion_id_uindex", unique: true
  end

  create_table "restaurants", force: :cascade do |t|
    t.integer "city", null: false
    t.text "name", null: false
    t.text "address", null: false
    t.integer "owner", null: false
    t.float "mark", null: false
    t.integer "rank", null: false
    t.index ["id"], name: "Restaurant_id_uindex", unique: true
    t.index ["rank"], name: "Restaurant_rank_uindex", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.text "name", null: false
    t.boolean "professional", default: false, null: false
    t.index ["id"], name: "User_id_uindex", unique: true
    t.index ["name"], name: "User_name_uindex", unique: true
  end

end
