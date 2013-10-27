class CreateGuifans < ActiveRecord::Migration
  def change
    create_table :guifans do |t|
      t.integer :id
      t.string :dalei
      t.string :neirong
      t.integer :fenzhi
      t.string :xuhao
      t.string :kaopingbumen
      t.string :kaohefangshi

      t.timestamps
    end
  end
end
