class ShanghusDiaoboshangs < ActiveRecord::Migration
  def up
      create_table :diaoboshangs_shanghus do |t|
      t.integer :shanghu_id
      t.integer :diaoboshang_id


      t.timestamps
    end
  end

  def down
  end
end
