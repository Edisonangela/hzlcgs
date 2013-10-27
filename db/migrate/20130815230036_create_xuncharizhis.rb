class CreateXuncharizhis < ActiveRecord::Migration
  def change
    create_table :xuncharizhis do |t|
      t.integer :id
      t.boolean :zhuangtai
      t.date :faqishijian
      t.integer :shanghu_id
      t.string :wenti
      t.string :wentidalei
      t.boolean :kefutishi
      t.date :kefuhuifushijian
      t.string :kefuhuifu
      t.integer :user_id

      t.timestamps
    end
  end
end
