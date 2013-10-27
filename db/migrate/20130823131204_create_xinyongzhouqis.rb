class CreateXinyongzhouqis < ActiveRecord::Migration
  def change
    create_table :xinyongzhouqis do |t|
      t.integer :id
      t.string :name
      t.string :shijianduan
      t.boolean :zhuangtai

      t.timestamps
    end
  end
end
