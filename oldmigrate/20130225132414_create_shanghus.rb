class CreateShanghus < ActiveRecord::Migration
  def change
    create_table :shanghus do |t|
      t.string :tanwei_id
      t.string :zihao
      t.string :fuzeren
      t.string :dianhua
      t.string :leixing
      t.string :hetong
      t.timestamps
    end
  end
end
