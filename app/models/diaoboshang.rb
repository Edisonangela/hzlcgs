class Diaoboshang < Shangjia
  has_and_belongs_to_many :shanghus
  has_many :shangpins,:dependent => :destroy
  attr_accessible :dizhi, :leixing, :liutong, :name, :zhizhao
end
