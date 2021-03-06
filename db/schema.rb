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

ActiveRecord::Schema.define(version: 20170424213721) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string   "name"
    t.string   "author"
    t.string   "editorial"
    t.integer  "year_of_publication"
    t.float    "qualification"
    t.integer  "genre_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["genre_id"], name: "index_books_on_genre_id", using: :btree
  end

  create_table "cities", force: :cascade do |t|
    t.string   "place_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collections", force: :cascade do |t|
    t.string   "name"
    t.string   "author"
    t.string   "editorial"
    t.integer  "year_of_publication"
    t.float    "qualification"
    t.integer  "genre_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["genre_id"], name: "index_collections_on_genre_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.text     "comment"
    t.integer  "product_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_comments_on_product_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres_interests", force: :cascade do |t|
    t.integer  "interest_id"
    t.integer  "genre_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["genre_id"], name: "index_genres_interests_on_genre_id", using: :btree
    t.index ["interest_id"], name: "index_genres_interests_on_interest_id", using: :btree
  end

  create_table "interests", force: :cascade do |t|
    t.string   "name"
    t.string   "icon_name"
    t.integer  "photo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photo_id"], name: "index_interests_on_photo_id", using: :btree
  end

  create_table "interests_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "interest_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["interest_id"], name: "index_interests_users_on_interest_id", using: :btree
    t.index ["user_id"], name: "index_interests_users_on_user_id", using: :btree
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
    t.index ["product_id"], name: "index_photos_on_product_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.text     "description"
    t.boolean  "special"
    t.boolean  "available"
    t.integer  "cover"
    t.integer  "status"
    t.integer  "value"
    t.string   "code_type"
    t.string   "code"
    t.string   "product_item_type"
    t.integer  "product_item_id"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["product_item_type", "product_item_id"], name: "index_products_on_product_item_type_and_product_item_id", using: :btree
    t.index ["user_id"], name: "index_products_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "email"
    t.decimal  "qualification"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.integer  "city_id"
    t.integer  "photo_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.index ["city_id"], name: "index_users_on_city_id", using: :btree
    t.index ["photo_id"], name: "index_users_on_photo_id", using: :btree
  end

end
