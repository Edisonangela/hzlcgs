class Changshang < Shangjia
  has_and_belongs_to_many :shanghus
  has_many :shangpins ,:dependent => :destroy
  attr_accessible :changzhi, :leixing, :name, :zhizhao,:shengchanxuke,:yangzhi,:fangyi,:lianxidianhua
end
