class ShanghusShangpins < ActiveRecord::Migration
  def up
      create_table :shanghus_shangpins do |t|
      t.integer :shanghu_id
      t.integer :shangpin_id


      t.timestamps
      end
  end

  def down
  end
end
