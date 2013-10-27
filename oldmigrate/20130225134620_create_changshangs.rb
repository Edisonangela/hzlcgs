class CreateChangshangs < ActiveRecord::Migration
  def change
    create_table :changshangs do |t|
      t.string :name
      t.string :changzhi
      t.string :leixing
      t.datetime :zhizhao
      t.datetime :liutong
      t.datetime :xuke

      t.timestamps
    end
  end
end
