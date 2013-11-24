class DaoruController < ApplicationController
  
  def tanwei
  end

  def changshangbeian
  end
  
  def guifanbeian
   
 end
  
  def tanweidaoru
  require 'spreadsheet'
  @file_data=params[:lujing].read
  path =  "#{Rails.root}/public/excels/daoru.xls"
    File.open("#{Rails.root}/public/excels/daoru.xls", "wb") do |f| 
        f.write(@file_data)
    end
  Spreadsheet.client_encoding = 'UTF-8'
  book = Spreadsheet.open path
  sheet1 = book.worksheet 0
  sheet1.each 0 do |row|
    tanwei=Tanwei.new
    shanghu=Shanghu.new
    xinhao1=true
    if (row[1]==nil or row[2]==nil or row[3]==nil)
    next
    end
    shanghus = Shanghu.find_all_by_fuzeren(row[3])
    shanghus.each do |sh|
      if sh.zihao == row[2]
        xinhao1 = false
        shanghu = sh
        break
      end
    end

    # do something interesting with a row
    if(xinhao1)
    shanghu.fuzeren=row[3]
    shanghu.zihao=row[2]
    shanghu.save 
    end
    
    tanwei = Tanwei.find_by_tanweihao(row[1])
    if tanwei == nil
    tanwei = Tanwei.new
    tanwei.tanweihao = row[1]
    tanwei.save
    end
    tanwei.shanghus << shanghu
    
    
   end

   redirect_to :controller => 'tanweis' ,:action=>'index'
 end
 
 
 
 
 def changshangbeiandaoru
  require 'spreadsheet'
  @file_data=params[:lujing].read
  path =  "#{Rails.root}/public/excels/daoru.xls"
    File.open("#{Rails.root}/public/excels/daoru.xls", "wb") do |f| 
        f.write(@file_data)
    end
  Spreadsheet.client_encoding = 'UTF-8'
  book = Spreadsheet.open path
  sheet1 = book.worksheet 0

  sheet1.each 1 do |row|
#草草草
    changshang = Changshang.new
    shangpin = Shangpin.new
    shanghu = Shanghu.new
    tanwei = Tanwei.new
   
    if (row[0]==nil or row[7]==nil or row[3]==nil)
    next
    end
    
    tanwei = Tanwei.find_by_tanweihao(row[0])
    if tanwei == nil
      next
    end
    shanghu = tanwei.shanghus
    if shanghu.size != 1
      next
    end
    # do something interesting with a row
  
      #如该厂商未备案，则新建changshang
    if Changshang.find_by_name(row[3]) == nil
        
         changshang.name=row[3]
         changshang.pinpai=row[4]
         changshang.dizhi=row[5]
         changshang.lianxidianhua=row[18]
         if row[11] != nil
         changshang.zhizhao = row[11].to_date
         end
         if row[13] != nil
         changshang.shengchanxuke=row[13].to_date
         end
         if row[12] != nil
         changshang.fangyi=row[12].to_date
         end
         if row[15] != nil
         changshang.yangzhi=row[15].to_date
         end
         if row[16] != nil
         changshang.tuzai=row[16].to_date
         end

         changshang.save 
         #若厂商信息已备案，则根据已备案的信息进行changshang初始化
    else
         changshang= Changshang.find_by_name(row[3])
    end
       
      #查看商户目前关联的厂商中 是否已有 目前excel行中的厂商，若没有则添加 商户-厂商关系
    changshangxinhao = true
    shanghu[0].changshangs.each do |cs|
      if cs.name == changshang.name
         changshangxinhao = false
         break
      end
    end
    if changshangxinhao
        shanghu[0].changshangs << changshang
    end
     
  #检查商品的 品名/厂家/规格/单重，若没有找到相同数据，说明该商品之前未备案，则新建
    shangpinxinhao = true
    #该厂商是否就改规格的商品
    changshang.shangpins.each do |sp|
      #binding.pry
      if (sp.name == row[7].to_s and sp.guige == row[8].to_i and sp.danzhong == row[9].to_s and sp.baozhuang == row[10]) 
        
        shangpin = sp
        shangpinxinhao = false
        break
      else
        
      end 
    end
    #该厂家没有该规格的产品，添加商品并建立 厂商-商品 和商户-商品之间的关联
    if shangpinxinhao
      shangpin.name = row[7]
      shangpin.guige = row[8]
      shangpin.danzhong = row[9]
      shangpin.leixing = row[6]
      shangpin.baozhuang =row[10]
      shangpin.save
      changshang.shangpins << shangpin
      shanghu[0].shangpins << shangpin
    #该厂家若有该规格的产品
    else
      shanghushangpinxinhao = true
      #该商户是否有该规格商品
      shanghu[0].shangpins.each do |ps|
        if (ps.name == shangpin.name and ps.guige == shangpin.guige)
          shanghushangpinxinhao = false
        end
      end
      #该商户若没有该规格产品则添加（若有则不做任何操作）
      if shanghushangpinxinhao 
        shanghu[0].shangpins << shangpin 
      end
    end
    
   end

   redirect_to :controller => 'tanweis' ,:action=>'index'
 end
 
 
 def gongyingshangbeiandaoru
  require 'spreadsheet'
  @file_data=params[:lujing].read
  path =  "#{Rails.root}/public/excels/daoru.xls"
    File.open("#{Rails.root}/public/excels/daoru.xls", "wb") do |f| 
        f.write(@file_data)
    end
  Spreadsheet.client_encoding = 'UTF-8'
  book = Spreadsheet.open path
  sheet1 = book.worksheet 0
  sheet1.each 1 do |row|
    gongyingshang = Gongyingshang.new
    shangpin = Shangpin.new
    shanghu = Shanghu.new
    tanwei = Tanwei.new
   
    if (row[0]==nil or row[7]==nil or row[3]==nil)
    next
    end
    
    tanwei = Tanwei.find_by_tanweihao(row[0])
    if tanwei == nil
      next
    end
    shanghu = tanwei.shanghus
    if shanghu.size != 1
      next
    end
    # do something interesting with a row
  
      #如该厂商未备案，则新建changshang
    if Gongyingshang.find_by_name(row[3]) == nil
        
         gongyingshang.name=row[3]
         gongyingshang.pinpai=row[4]
         gongyingshang.dizhi=row[5]
         gongyingshang.lianxidianhua=row[18]
         if row[11] != nil
         gongyingshang.zhizhao = row[11].to_date
         end
         if row[13] != nil
         gongyingshang.shengchanxuke=row[13].to_date
         end
         if row[12] != nil
         gongyingshang.fangyi=row[12].to_date
         end
         if row[15] != nil
         gongyingshang.yangzhi=row[15].to_date
         end
         if row[16] != nil
         gongyingshang.tuzai=row[16].to_date
         end
         gongyingshang.save 
         #若厂商信息已备案，则根据已备案的信息进行changshang初始化
    else
         gongyingshang= Gongyingshang.find_by_name(row[3])
    end
       
      #查看商户目前关联的厂商中 是否已有 目前excel行中的厂商，若没有则添加 商户-厂商关系
    gongyingshangxinhao = true
    shanghu[0].gongyingshangs.each do |cs|
      if cs.name == gongyingshang.name
         gongyingshangxinhao = false
         break
      end
    end
    if gongyingshangxinhao
        shanghu[0].gongyingshangs << gongyingshang
    end
     
  #检查商品的 品名/厂家/规格/单重，若没有找到相同数据，说明该商品之前未备案，则新建
    shangpinxinhao = true
    #该厂商是否就改规格的商品
    gongyingshang.shangpins.each do |sp|
      #binding.pry
      if (sp.name == row[7].to_s and sp.guige == row[8].to_i and sp.danzhong == row[9].to_s and sp.baozhuang == row[10]) 
        
        shangpin = sp
        shangpinxinhao = false
        break
      else
        
      end 
    end
    #该厂家没有该规格的产品，添加商品并建立 厂商-商品 和商户-商品之间的关联
    if shangpinxinhao
      shangpin.name = row[7]
      shangpin.guige = row[8]
      shangpin.danzhong = row[9]
      shangpin.leixing = row[6]
      shangpin.baozhuang =row[10]
      shangpin.save
      gongyingshang.shangpins << shangpin
      shanghu[0].shangpins << shangpin
    #该厂家若有该规格的产品
    else
      shanghushangpinxinhao = true
      #该商户是否有该规格商品
      shanghu[0].shangpins.each do |ps|
        if (ps.name == shangpin.name and ps.guige == shangpin.guige)
          shanghushangpinxinhao = false
        end
      end
      #该商户若没有该规格产品则添加（若有则不做任何操作）
      if shanghushangpinxinhao 
        shanghu[0].shangpins << shangpin 
      end
    end
    
   end

   redirect_to :controller => 'tanweis' ,:action=>'index'
 end
 
  def xiaozuofangbeiandaoru
  require 'spreadsheet'
  @file_data=params[:lujing].read
  path =  "#{Rails.root}/public/excels/daoru.xls"
    File.open("#{Rails.root}/public/excels/daoru.xls", "wb") do |f| 
        f.write(@file_data)
    end
  Spreadsheet.client_encoding = 'UTF-8'
  book = Spreadsheet.open path
  sheet1 = book.worksheet 0
  sheet1.each 1 do |row|
    xiaozuofang = Xiaozuofang.new
    shangpin = Shangpin.new
    shanghu = Shanghu.new
    tanwei = Tanwei.new
   
    if (row[0]==nil or row[7]==nil or row[3]==nil)
    next
    end
    
    tanwei = Tanwei.find_by_tanweihao(row[0])
    if tanwei == nil
      next
    end
    shanghu = tanwei.shanghus
    if shanghu.size != 1
      next
    end
    # do something interesting with a row
  
      #如该厂商未备案，则新建changshang
    if Xiaozuofang.find_by_name(row[3]) == nil
        
         xiaozuofang.name=row[3]
         xiaozuofang.pinpai=row[4]
         xiaozuofang.dizhi=row[5]
         xiaozuofang.lianxidianhua=row[18]
         if row[11] != nil
         xiaozuofang.zhizhao = row[11].to_date
         end
         if row[13] != nil
         xiaozuofang.shengchanxuke=row[13].to_date
         end
         if row[12] != nil
         xiaozuofang.fangyi=row[12].to_date
         end
         if row[15] != nil
         xiaozuofang.yangzhi=row[15].to_date
         end
         if row[16] != nil
         xiaozuofang.tuzai=row[16].to_date
         end
         xiaozuofang.save 
         #若厂商信息已备案，则根据已备案的信息进行changshang初始化
    else
         xiaozuofang = Xiaozuofang.find_by_name(row[3])
    end
       
      #查看商户目前关联的厂商中 是否已有 目前excel行中的厂商，若没有则添加 商户-厂商关系
    xiaozuofangxinhao = true
    shanghu[0].xiaozuofangs.each do |cs|
      if cs.name == xiaozuofang.name
         xiaozuofangxinhao = false
         break
      end
    end
    if xiaozuofangxinhao
        shanghu[0].xiaozuofangs << xiaozuofang
    end
     
  #检查商品的 品名/厂家/规格/单重，若没有找到相同数据，说明该商品之前未备案，则新建
    shangpinxinhao = true
    #该厂商是否就改规格的商品
    xiaozuofang.shangpins.each do |sp|
      #binding.pry
      if (sp.name == row[7].to_s and sp.guige == row[8].to_i and sp.danzhong == row[9].to_s and sp.baozhuang == row[10]) 
        
        shangpin = sp
        shangpinxinhao = false
        break
      else
        
      end 
    end
    #该厂家没有该规格的产品，添加商品并建立 厂商-商品 和商户-商品之间的关联
    if shangpinxinhao
      shangpin.name = row[7]
      shangpin.guige = row[8]
      shangpin.danzhong = row[9]
      shangpin.leixing = row[6]
      shangpin.baozhuang =row[10]
      shangpin.save
      xiaozuofang.shangpins << shangpin
      shanghu[0].shangpins << shangpin
    #该厂家若有该规格的产品
    else
      shanghushangpinxinhao = true
      #该商户是否有该规格商品
      shanghu[0].shangpins.each do |ps|
        if (ps.name == shangpin.name and ps.guige == shangpin.guige)
          shanghushangpinxinhao = false
        end
      end
      #该商户若没有该规格产品则添加（若有则不做任何操作）
      if shanghushangpinxinhao 
        shanghu[0].shangpins << shangpin 
      end
    end
    
   end

   redirect_to :controller => 'tanweis' ,:action=>'index'
 end
 
 #导入excel表格
 def guifandaoru
  require 'spreadsheet'  
  @file_data=params[:lujing].read
  path="#{Rails.root}/public/excels/daoru.xls"
   File.open("#{Rails.root}" + "/public/excels/daoru.xls", "wb") do |f| 
        f.write(@file_data)
   end
  Spreadsheet.client_encoding = 'UTF-8'
  book = Spreadsheet.open path
  sheet1 = book.worksheet 0
  
  sheet1.each 1 do |row|
    guifan=Guifan.new
    # 没做校验
    # do something interesting with a row
    if(Guifan.find_by_xuhao(row[0])==nil && row[0]!=nil)
    guifan.xuhao=row[0]
    guifan.dalei=row[1]
    guifan.neirong=row[2]
    guifan.fenzhi=row[3]
    guifan.kaopingbumen=row[4]
    guifan.kaohefangshi=row[5]
    guifan.save
    end
    
   end

   redirect_to :action=>'list'
 end
 
 #导入excel表格

 def weiguijiludaoru
  require 'spreadsheet'
  @file_data=params[:lujing].read
  path=  "#{Rails.root}/public/excels/daoru.xls"
    File.open("#{Rails.root}/public/excels/daoru.xls", "wb") do |f| 
        f.write(@file_data)
    end
    
  Spreadsheet.client_encoding = 'UTF-8'
  book = Spreadsheet.open path
  sheet1 = book.worksheet 0
  
  sheet1.each 1 do |row|
    
    weiguijilu=Weiguijilu.new
    xinhao1=true
   # binding.pry
    if (row[0]==nil or row[5]==nil or row[4]==nil)
    next
    end
    if (Tanwei.find_by_tanweihao(row[0])==nil)
      next
    else
        tanwei = Tanwei.find_by_tanweihao(row[0])
        shanghu= tanwei.shanghus.first
    end
    #同一件事不导入第二遍
    jilus=Weiguijilu.find_all_by_shijian(row[4])
    if(jilus!=[])
      for jilu in jilus do
         
        if(jilu.shanghu.tanwei.tanweihao == row[0] and jilu.weiguineirong=row[5])
        xinhao1=false
        break
        end
     #jilu.shanghu_id != row[0]and jilu.shijian != row[4] and julu.chuliqingkuang != row[6] )
      end
    else
       xinhao1=true
    end
    
    #规范是否有，没有的话，就不导入
    gf=Guifan.find(row[2])
    if gf
       
    else
       xinhao1=false
    end
    
    # do something interesting with a row
    if(xinhao1)
    weiguijilu.shanghu=shanghu
    weiguijilu.yuangong_id=row[1]
    weiguijilu.guifan_id=gf.id
    weiguijilu.xinyongzhouqi_id=row[3]
    weiguijilu.shijian=row[4].to_date
    weiguijilu.weiguineirong=row[5]
    weiguijilu.chuliqingkuang=row[6]

    weiguijilu.fenzhi=gf.fenzhi.to_i*0.1


    
    user = User.find_by_name(row[8])
    weiguijilu.user = user
    weiguijilu.save 
    end
    
   end

   redirect_to :action=>'list'
 end
 
 
 



 
end
