class ShanghusChangshangs < ActiveRecord::Migration
  def up
    create_table :changshangs_shanghus do |t|
      t.integer :shanghu_id
      t.integer :changshang_id


      t.timestamps
    end
  end

  def down
  end
end
