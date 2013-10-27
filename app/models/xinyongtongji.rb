class Xinyongtongji < ActiveRecord::Base
  attr_accessible :defen, :id, :shanghu_id, :xinyongzhouqi_id
  belongs_to :shanghu
  belongs_to :xinyongzhouqi
end
