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

ActiveRecord::Schema.define(version: 20170526121534) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",                                             collation: "utf8_general_ci", comment: "地址名"
    t.decimal  "lat",        precision: 10, scale: 6,                                            comment: "经度"
    t.decimal  "lng",        precision: 10, scale: 6,                                            comment: "纬度"
    t.string   "comment",                                          collation: "utf8_general_ci", comment: "详情"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "nick",                                     collation: "utf8_general_ci", comment: "账户名"
    t.string   "password_digest",                          collation: "utf8_general_ci", comment: "密码"
    t.integer  "is_del",          default: 0, null: false,                               comment: "是否可用"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "role_id",                                                                comment: "角色id"
    t.integer  "region_id",                                                              comment: "地区id"
  end

  create_table "advertisements", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "product_id"
    t.string   "ad_logo",                   collation: "utf8_general_ci"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "product_name",              collation: "utf8_general_ci"
    t.string   "name",                      collation: "utf8_general_ci"
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",                                collation: "utf8_general_ci", comment: "品类名"
    t.string   "logo",                                                              comment: "品类图案"
    t.integer  "is_delete",  default: 0, null: false,                               comment: "是否可用"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "cityprices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "city",       comment: "城市名"
    t.string "product_id", comment: "商品id"
    t.string "price",      comment: "商品价格"
  end

  create_table "coupons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",                                               collation: "utf8_general_ci", comment: "优惠券详情"
    t.datetime "from",                                                                             comment: "优惠开始时间"
    t.datetime "to",                                                                               comment: "优惠结束时间"
    t.decimal  "price",      precision: 10,                                                        comment: "优惠起始价格"
    t.decimal  "discount",   precision: 10,                                                        comment: "可优惠价格"
    t.integer  "is_del",                    default: 0, null: false,                               comment: "是否可用"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.decimal  "price",      precision: 10,              comment: "购物价格"
    t.integer  "amount",                                 comment: "购物数量"
    t.integer  "product_id",                             comment: "商品id"
    t.integer  "user_id",                                comment: "用户id"
    t.integer  "order_id",                               comment: "订单id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "logs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "user_card_id",                                                                        comment: "用户卡号id"
    t.decimal  "real_money",   precision: 10,                                                         comment: "真钱数额"
    t.decimal  "fake_money",   precision: 10,                                                         comment: "假钱数额"
    t.string   "method",                                                collation: "utf8_general_ci", comment: "方式"
    t.integer  "status",                                                                              comment: "状态"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "order_id",                    default: -1, null: false,                               comment: "订单id"
  end

  create_table "merchant_incomes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "merchant_id",                                           comment: "商户id"
    t.decimal  "price",         precision: 10,                          comment: "实际收入"
    t.decimal  "discount",      precision: 10,                          comment: "折扣消费"
    t.integer  "order_id",                                              comment: "订单id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "is_settlement",                default: 1, null: false, comment: "是否结算"
  end

  create_table "merchant_logs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.decimal  "money",       precision: 10, scale: 6,              comment: "收入金额"
    t.integer  "user_id",                                           comment: "用户id"
    t.integer  "product_id",                                        comment: "商品id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "merchant_id",                                       comment: "商户id"
  end

  create_table "merchant_orderships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "merchant_id",                          comment: "商户id"
    t.integer  "order_id",                             comment: "订单id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "is_del",      default: 0, null: false, comment: "使用情况"
  end

  create_table "merchant_productships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "merchant_id",                                       comment: "商户id"
    t.integer  "product_id",                                        comment: "商品id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.decimal  "price",       precision: 10, scale: 6,              comment: "价格"
  end

  create_table "merchant_stationships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "merchant_id",              comment: "商户id"
    t.integer  "station_id",               comment: "站点ID"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "merchants", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "nick",                                     collation: "utf8_general_ci", comment: "商户名"
    t.string   "password_digest",                          collation: "utf8_general_ci", comment: "商户密码"
    t.string   "mobile",                                                                 comment: "商户手机"
    t.string   "mail",                                                                   comment: "商户邮箱"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "is_delete",       default: 0, null: false,                               comment: "可用状态"
    t.integer  "status",          default: 1, null: false,                               comment: "使用状态"
    t.string   "license",                                                                comment: "身份证件"
    t.string   "comment",                                  collation: "utf8_general_ci", comment: "详情"
    t.string   "logo",                                     collation: "utf8_general_ci", comment: "照片路径"
    t.string   "card",                                     collation: "utf8_general_ci", comment: "营业执照"
    t.string   "rename",                                   collation: "utf8_general_ci", comment: "真实姓名"
    t.string   "sex",                                      collation: "utf8_general_ci", comment: "性别"
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "user_id",                                                              collation: "latin1_swedish_ci", comment: "用户id"
    t.string   "address_id",                                                           collation: "latin1_swedish_ci", comment: "地址id"
    t.decimal  "price",          precision: 10,                                                                        comment: "价格"
    t.integer  "status",                                  default: 0,     null: false,                                 comment: "状态"
    t.integer  "is_del",                                  default: 0,     null: false,                                 comment: "是否删除"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.string   "product_id",                                              null: false,                                 comment: "商品id"
    t.integer  "product_nums",                                                                                         comment: "商品数量"
    t.decimal  "discount",       precision: 10,           default: 0,     null: false,                                 comment: "折扣"
    t.decimal  "merchant_price", precision: 10, scale: 6, default: "0.0",                                              comment: "商户获利"
    t.integer  "withdraw",                                default: 1,     null: false,                                 comment: "是否结算"
  end

  create_table "orderstations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "station_id",                          comment: "站点id"
    t.string  "order_id",                            comment: "订单id"
    t.integer "is_del",     default: 0, null: false, comment: "使用情况"
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",                                                          collation: "utf8_general_ci", comment: "商品名"
    t.string   "logo",                                                                                        comment: "商品图案"
    t.integer  "is_delete",                            default: 0, null: false,                               comment: "是否删除"
    t.integer  "category_id",                                                                                 comment: "品类id"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.decimal  "price1",      precision: 10, scale: 6
    t.decimal  "price2",      precision: 10, scale: 6
    t.decimal  "price3",      precision: 10, scale: 6
    t.decimal  "price4",      precision: 10, scale: 6
    t.decimal  "price5",      precision: 10, scale: 6
    t.decimal  "price6",      precision: 10, scale: 6
  end

  create_table "regions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",                    collation: "utf8_general_ci", comment: "地区名"
    t.integer  "parent_id",                                             comment: "父级id"
    t.integer  "level",                                                 comment: "级别"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rider_stationships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "rider_id",                comment: "骑手id"
    t.integer  "station_id",              comment: "站点id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "riderorders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "rider_id",                            comment: "骑手id"
    t.string   "order_id",                            comment: "订单id"
    t.integer  "is_del",     default: 0, null: false, comment: "可用情况"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "riders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",                                     collation: "utf8_general_ci", comment: "骑手名"
    t.string   "password_digest",             null: false,                               comment: "骑手密码"
    t.string   "mobile",                      null: false,                               comment: "骑手电话"
    t.string   "sex",                                                                    comment: "骑手性别"
    t.string   "license_num",                                                            comment: "身份证号"
    t.integer  "is_del",          default: 0, null: false,                               comment: "是否删除"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "status",          default: 1, null: false,                               comment: "可用状态"
    t.string   "id_front"
    t.string   "id_back"
    t.integer  "region_id",                                                              comment: "地区id"
  end

  create_table "role_serviceships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "role_id",                 comment: "角色id"
    t.integer  "service_id",              comment: "服务id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nick",                                              comment: "角色昵称"
    t.integer  "is_del",                   default: 0, null: false, comment: "删除情况"
    t.text     "comment",    limit: 65535,             null: false, comment: "详情"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "services", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "function",                collation: "utf8_general_ci", comment: "功能情况"
    t.integer  "pid",                                                   comment: "父级id"
    t.string   "url",                                                   comment: "连接"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                                comment: "站点名"
    t.integer  "address_id",                          comment: "地址id"
    t.integer  "region_id",                           comment: "地区id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "is_del",     default: 0, null: false, comment: "是否删除"
    t.integer  "status",     default: 0, null: false, comment: "使用状况"
  end

  create_table "suggest_priceships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "merchant_id"
    t.integer  "product_id"
    t.decimal  "price",       precision: 10
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "user_adddressships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",                 comment: "用户id"
    t.integer  "address_id",              comment: "地址id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "user_id",                                                            comment: "用户id"
    t.decimal  "real_money", precision: 10, scale: 2, default: "0.0",                comment: "真钱"
    t.decimal  "fake_money", precision: 10, scale: 2, default: "100.0",              comment: "假钱"
    t.integer  "is_del",                              default: 0,       null: false, comment: "是否删除"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
  end

  create_table "user_couponships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "user_id",                             comment: "用户id"
    t.integer  "coupon_id",                           comment: "优惠券id"
    t.integer  "is_del",     default: 0, null: false, comment: "删除情况"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "useraddresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "user_id",                             collation: "latin1_swedish_ci", comment: "用户id"
    t.string  "address",   default: "", null: false,                                 comment: "地址详情"
    t.string  "latitude",                            collation: "latin1_swedish_ci", comment: "经度"
    t.string  "longitude",                           collation: "latin1_swedish_ci", comment: "纬度"
    t.integer "is_del",    default: 0,  null: false,                                 comment: "删除情况"
    t.string  "phone",                                                               comment: "电话"
    t.string  "remark"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                                                                       comment: "用户名"
    t.string   "password_digest",                            collation: "latin1_swedish_ci", comment: "用户密码"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "sex",                                        collation: "latin1_swedish_ci", comment: "性别"
    t.string   "mobile",                        null: false, collation: "latin1_swedish_ci", comment: "电话"
    t.string   "is_del",          default: "0", null: false, collation: "latin1_swedish_ci", comment: "可用情况"
    t.string   "avatar"
  end

end
