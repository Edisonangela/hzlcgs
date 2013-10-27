class Shanghu < ActiveRecord::Base
  has_and_belongs_to_many :changshangs
  has_and_belongs_to_many :gongyingshangs
  has_and_belongs_to_many :diaoboshangs
  has_and_belongs_to_many :xiaozuofangs
  has_and_belongs_to_many :shangpins
  has_many :weiguijilus
  has_many :xuncharizhis
  belongs_to :tanwei
  has_many :xinyongtongjis
  attr_accessible :leixing, :tanwei_id, :dianhua, :fuzeren, :zihao, :hetong
  
  def tanweihao
     if self.tanwei != nil
        tanweihao = self.tanwei.tanweihao        
     else
        tanweihao = nil
     end
  end
  
  def tanweihao=(tanweihao)
       @tanwei = Tanwei.find_by_tanweihao(tanweihao)       
       @shanghu = @tanwei.shanghus.first
       self.id = @shanghu.id        
  end 
end
