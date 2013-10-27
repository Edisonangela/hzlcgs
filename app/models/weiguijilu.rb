class Weiguijilu < ActiveRecord::Base
  attr_accessible :chuliqingkuang, :guifan_id, :id, :fenzhi, :shijian, :shanghu_id, :user_id, :weiguineirong, :xinyongzhouqi_id
  belongs_to :shanghu
  belongs_to :guifan
  belongs_to :user
  belongs_to :xinyongzhouqi
  #has_and_belongs_to_many :yuangongs
end
