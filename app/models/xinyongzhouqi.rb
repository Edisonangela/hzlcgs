class Xinyongzhouqi < ActiveRecord::Base
  attr_accessible :id, :name , :shijianduan , :zhuangtai
  has_many :weiguijilus
  has_many :xinyongtongjis
end
