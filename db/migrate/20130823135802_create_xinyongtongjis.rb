class CreateXinyongtongjis < ActiveRecord::Migration
  def change
    create_table :xinyongtongjis do |t|
      t.integer :id
      t.integer :shanghu_id
      t.integer :xinyongzhouqi_id
      t.float :defen

      t.timestamps
    end
  end
end
