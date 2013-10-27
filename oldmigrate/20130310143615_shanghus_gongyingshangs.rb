class ShanghusGongyingshangs < ActiveRecord::Migration
  def up
      create_table :gongyingshangs_shanghus do |t|
      t.integer :shanghu_id
      t.integer :gongyingshang_id


      t.timestamps
    end
  end

  def down
  end
end
