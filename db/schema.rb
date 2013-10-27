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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130823135802) do

  create_table "changshangs_shanghus", :force => true do |t|
    t.integer  "shanghu_id"
    t.integer  "changshang_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "diaoboshangs_shanghus", :force => true do |t|
    t.integer  "shanghu_id"
    t.integer  "diaoboshang_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "gongyingshangs_shanghus", :force => true do |t|
    t.integer  "shanghu_id"
    t.integer  "gongyingshang_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "guifans", :force => true do |t|
    t.string   "dalei"
    t.string   "neirong"
    t.integer  "fenzhi"
    t.string   "xuhao"
    t.string   "kaopingbumen"
    t.string   "kaohefangshi"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "shanghus", :force => true do |t|
    t.string   "tanwei_id"
    t.string   "zihao"
    t.string   "fuzeren"
    t.string   "dianhua"
    t.string   "leixing"
    t.string   "hetong"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "shanghus_shangpins", :force => true do |t|
    t.integer  "shanghu_id"
    t.integer  "shangpin_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "shanghus_xiaozuofangs", :force => true do |t|
    t.integer  "shanghu_id"
    t.integer  "xiaozuofang_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "shangjia", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.string   "leixing"
    t.string   "dizhi"
    t.datetime "zhizhao"
    t.datetime "shengchanxuke"
    t.datetime "liutong"
    t.datetime "fangyi"
    t.datetime "yangzhi"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "pinpai"
    t.datetime "tuzai"
    t.string   "lianxidianhua", :limit => 45
  end

  create_table "shangpins", :force => true do |t|
    t.string   "name"
    t.string   "leixing"
    t.string   "baozhuang"
    t.integer  "guige"
    t.string   "danzhong"
    t.integer  "changshang_id"
    t.integer  "gongyingshang_id"
    t.integer  "diaoboshang_id"
    t.integer  "xiaozuofang_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "tanweis", :force => true do |t|
    t.string   "tanweihao"
    t.string   "mianji"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password"
    t.string   "power"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "weiguijilus", :force => true do |t|
    t.integer  "shuanghu_id"
    t.integer  "yuangong_id"
    t.integer  "guifan_id"
    t.integer  "xinyongzhouqi_id"
    t.date     "shijian"
    t.string   "weiguineirong"
    t.string   "chuliqingkuang"
    t.float    "koufen"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "xinyongtongjis", :force => true do |t|
    t.integer  "shanghu_id"
    t.integer  "xinyongzhouqi_id"
    t.float    "defen"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "xinyongzhouqis", :force => true do |t|
    t.string   "name"
    t.string   "shijianduan"
    t.boolean  "zhuangtai"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "xuncharizhis", :force => true do |t|
    t.boolean  "zhuangtai"
    t.date     "faqishijian"
    t.integer  "shanghu_id"
    t.string   "wenti"
    t.string   "wentidalei"
    t.boolean  "kefutishi"
    t.date     "kefuhuifushijian"
    t.string   "kefuhuifu"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
