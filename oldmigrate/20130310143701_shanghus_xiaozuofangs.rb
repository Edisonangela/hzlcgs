class ShanghusXiaozuofangs < ActiveRecord::Migration
  def up
      create_table :xiaozuofangs_shanghus do |t|
      t.integer :shanghu_id
      t.integer :xiaozuofang_id


      t.timestamps
    end
  end

  def down
  end
end
