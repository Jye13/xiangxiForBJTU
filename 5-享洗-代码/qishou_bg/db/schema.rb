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

ActiveRecord::Schema.define(version: 20170424135540) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",                                             collation: "utf8_general_ci"
    t.decimal  "lat",        precision: 10, scale: 6
    t.decimal  "lng",        precision: 10, scale: 6
    t.string   "comment",                                          collation: "utf8_general_ci"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "nick",                                     collation: "utf8_general_ci"
    t.string   "password_digest",                          collation: "utf8_general_ci"
    t.integer  "is_del",          default: 0, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "role_id"
    t.integer  "region_id"
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "logo"
    t.integer  "is_delete",  default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "functions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.decimal  "price",      precision: 10
    t.integer  "amount"
    t.integer  "product_id"
    t.integer  "user_id"
    t.integer  "order_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "merchant_productships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "merchant_id"
    t.integer  "product_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "merchant_stationships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "merchant_id"
    t.integer  "station_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "merchants", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "nick",                                     collation: "utf8_general_ci"
    t.string   "password_digest"
    t.string   "mobile"
    t.string   "mail"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "is_delete",       default: 0, null: false
    t.integer  "status",          default: 1, null: false
    t.string   "license"
    t.string   "comment"
    t.string   "logo"
    t.string   "card"
    t.string   "rename",                                   collation: "utf8_general_ci"
    t.string   "sex"
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "user_id"
    t.string   "address_id"
    t.string   "price"
    t.integer  "status",     default: 0, null: false
    t.integer  "is_del",     default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "orderstations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "station_id"
    t.string  "order_id"
    t.integer "is_del",     default: 0, null: false
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "logo"
    t.integer  "is_delete",   default: 0, null: false
    t.integer  "category_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "regions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",                    collation: "utf8_general_ci"
    t.integer  "parent_id"
    t.integer  "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rider_stationships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "rider_id"
    t.integer  "station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "riderorders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "rider_id"
    t.string   "order_id"
    t.integer  "is_del",     default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "riders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "password_digest",             null: false
    t.string   "mobile",                      null: false
    t.string   "sex"
    t.string   "license_num"
    t.integer  "is_del",          default: 0, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "status",          default: 1, null: false
    t.string   "id_front"
    t.string   "id_back"
    t.integer  "region_id"
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nick"
    t.integer  "is_del",                   default: 0, null: false
    t.text     "comment",    limit: 65535,             null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "stations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "address_id"
    t.integer  "region_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "is_del",     default: 0, null: false
    t.integer  "status",     default: 0, null: false
  end

  create_table "user_adddressships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "useraddresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "user_id",                            collation: "latin1_swedish_ci"
    t.string  "address",               null: false, collation: "latin1_swedish_ci"
    t.string  "latitude",                           collation: "latin1_swedish_ci"
    t.string  "longitude",                          collation: "latin1_swedish_ci"
    t.integer "is_del",    default: 0, null: false
    t.string  "phone"
    t.string  "remark"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                                       collation: "latin1_swedish_ci"
    t.string   "password_digest",                            collation: "latin1_swedish_ci"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "sex",                                        collation: "latin1_swedish_ci"
    t.string   "mobile",                        null: false, collation: "latin1_swedish_ci"
    t.string   "is_del",          default: "0", null: false, collation: "latin1_swedish_ci"
  end

end
