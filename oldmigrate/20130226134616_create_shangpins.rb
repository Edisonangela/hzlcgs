class CreateShangpins < ActiveRecord::Migration
  def change
    create_table :shangpins do |t|
      t.string :name
      t.string :leixing
      t.string :baozhuang
      t.integer :guige
      t.string :danzhong
      t.integer :changshang_id
      t.integer :gongyingshang_id
      t.integer :diaoboshang_id
      t.integer :xiaozuofang_id

      t.timestamps
    end
  end
end
