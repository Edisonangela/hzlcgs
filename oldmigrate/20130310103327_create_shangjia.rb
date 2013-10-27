class CreateShangjia < ActiveRecord::Migration
  def change
    create_table :shangjia do |t|
      t.string :type
      t.string :name
      t.string :leixing
      t.string :dizhi
      t.string :pinpai
      t.string :lianxidianhua
      t.datetime :zhizhao
      t.datetime :shengchanxuke
      t.datetime :liutong
      t.datetime :fangyi
      t.datetime :yangzhi
      t.datetime :tuzai

      t.timestamps
    end
  end
end
