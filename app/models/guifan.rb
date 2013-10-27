class Guifan < ActiveRecord::Base
  attr_accessible :dalei, :fenzhi, :id, :kaohefangshi, :kaopingbumen, :neirong, :xuhao
  has_many :weiguijilus
end
