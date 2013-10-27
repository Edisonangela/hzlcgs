class CreateTanweis < ActiveRecord::Migration
  def change
    create_table :tanweis do |t|
      t.string :tanweihao
      t.string :mianji

      t.timestamps
    end
  end
end
