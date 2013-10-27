class Xuncharizhi < ActiveRecord::Base
  attr_accessible :faqishijian, :id, :kefuhuifu, :kefutishi, :kefuhuifushijian, :shanghu_id, :user_id, :wenti, :wentidalei, :zhuangtai
  belongs_to :shanghu
  belongs_to :user
  
end
