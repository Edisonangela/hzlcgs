class CreateWeiguijilus < ActiveRecord::Migration
  def change
    create_table :weiguijilus do |t|
      t.integer :id
      t.integer :shanghu_id
      t.integer :yuangong_id
      t.integer :guifan_id
      t.integer :xinyongzhouqi_id
      t.date :shijian
      t.string :weiguineirong
      t.string :chuliqingkuang
      t.float :fenzhi
      t.integer :user_id

      t.timestamps
    end
  end
end
