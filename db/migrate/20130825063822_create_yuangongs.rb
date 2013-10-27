class CreateYuangongs < ActiveRecord::Migration
  def change
    create_table :yuangongs do |t|
      t.int :id
      t.varchar :name
      t.varchar :sex
      t.varchar :shenfenzhenghao
      t.varchar :jiguan
      t.int :nianling
      t.varchar :dianhua
      t.string :zhaopianlujing

      t.timestamps
    end
  end
end
