class XinyongtongjisController < ApplicationController
  # GET /xinyongtongjis
  # GET /xinyongtongjis.json
  def index
    limit = params[:limit] || 25
    start = params[:start] || 0

    respond_to do |format|
      format.html # index.html.erb
      format.json  { 
        @shanghus = Array.new
        @xinyongtongjis = Array.new
        if(params[:searchtanweihao] != nil)
         #binding.pry
          @tanweis = Tanwei.find(:all,:limit => limit, :offset =>start,:conditions => ["tanweihao like ? ","%" + params[:searchtanweihao] +"%"] )
 
          @tanweis.each do |tw|
            tw.shanghus.each do |sh|
            
              @shanghus << sh 
            end
          end
          if (@shanghus != [])
            #binding.pry
             @shanghus.each do |sh|
                sh.xinyongtongjis.each do |xcrz|
                 @xinyongtongjis << xcrz
                end
             end  
          end

        elsif (params[:searchzihao] != nil)
           @shanghus = Shanghu.find(:all,:limit => limit, :offset =>start,:conditions => ["zihao like ? ","%" + params[:searchzihao] +"%"] )
           @shanghus.each do |sh|
                sh.xinyongtongjis.each do |xcrz|
                 @xinyongtongjis << xcrz
                end
           end 
        elsif (params[:searchfuzeren])
          @shanghus = Shanghu.find(:all,:limit => limit, :offset =>start,:conditions => ["fuzeren like ? ","%" + params[:searchfuzeren] +"%"] ) 
          @shanghus.each do |sh|
                sh.xinyongtongjis.each do |xcrz|
                 @xinyongtongjis << xcrz
                end
           end 
       # if(params[:search] != nil && params[:searchkefutishi] != nil)
        #  @xuncharizhis = Xuncharizhi.find(:all,:limit => limit, :offset =>start,:conditions => ["zhuangtai like ? and kefutishi like ?",[params[:searchzhuangtai].to_i],params[:searchkefutishi]])
       # elsif(params[:searchzhuangtai] != nil)
         #binding.pry
        #  @xuncharizhis = Xuncharizhi.find(:all,:limit => limit, :offset =>start,:conditions => ["zhuangtai like ? ",params[:searchzhuangtai].to_i] )
        #elsif (params[:searchpinlei])
        #  @shangpins = Shangpin.find(:all,:limit => limit, :offset =>start,:conditions => ["leixing like ? ","%" + params[:searchpinlei] +"%"] )
        #elsif (params[:searchshangjia])
         #  @shangjias = Shangjia.find(:all,:limit => limit, :offset =>start,:conditions => ["name like ? ","%" + params[:searchshangjia] +"%"] ) 
         #  @shangpins = Array.new
          # @shangjias.each do |sj|
          #    sj.shangpins.each do |sp|
          #      @shangpins << sp
          #    end
         #  end      
      
        #elsif (params[:searchpinlei])
         # @shangpins = Shangpin.find(:all,:limit => limit, :offset =>start,:conditions => ["leixing like ? ","%" + params[:searchpinlei] +"%"] ) 
       else
          @xinyongtongjis = Xinyongtongji.find(:all,:limit => limit, :offset =>start)
          dev_count = Xinyongtongji.count
        end     
         griddata = Hash.new
         griddata[:xinyongtongjis] = @xinyongtongjis.collect{|d|
           #   shangjialeixing = '厂家'
            #  shangjia = d.changshang.name
           
           #elsif d.diaoboshang != nil
            #  shangjialeixing = '调拨商'
             # shangjia = d.diaoboshang.name
           
           #elsif d.gongyingshang != nil
            #  shangjialeixing = '供应商'
             # shangjia = d.gongyingshang.name
           
           #elsif d.xiaozuofang != nil
            #  shangjialeixing = '小作坊'
             # shangjia = d.xiaozuofang.name
           #else
             
           #end
           if d.shanghu_id != nil
           @shanghu = Shanghu.find(d.shanghu_id)
           tanweihao=@shanghu.tanweihao
           shanghu_zihao = @shanghu.zihao
           shanghu_fuzeren = @shanghu.fuzeren
           shanghu_dianhua = @shanghu.dianhua
           end
          
           if d.xinyongzhouqi_id != nil
             
             xinyongzhouqi_name = d.xinyongzhouqi.name
           end
             

           

             
            # if d.guifan_id != nil
             #     guifan = d.guifan.neirong
             #   else
              #    guifan = nil
             #end
             
              #if d.yuangongs != nil
              #    yuangongs = d.yuangongs
              #  else
              #    faqiren = nil
             #end  
     
             
             {:id => d.id,:zihao => shanghu_zihao,:fuzeren => shanghu_fuzeren,:dianhua => shanghu_dianhua,:defen => d.defen, :tanweihao => tanweihao,:xinyongzhouqi => xinyongzhouqi_name}
           }
         griddata[:totalCount] = Xinyongtongji.count
          
         render :text => griddata.to_json() 
        }
    end
  end

  # GET /xinyongtongjis/1
  # GET /xinyongtongjis/1.json
  def show
    @xinyongtongji = Xinyongtongji.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @xinyongtongji }
    end
  end

  # GET /xinyongtongjis/new
  # GET /xinyongtongjis/new.json
  def new
    @xinyongtongji = Xinyongtongji.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @xinyongtongji }
    end
  end

  # GET /xinyongtongjis/1/edit
  def edit
    @xinyongtongji = Xinyongtongji.find(params[:id])
  end

  # POST /xinyongtongjis
  # POST /xinyongtongjis.json
  def create
    @xinyongtongji = Xinyongtongji.new(params[:xinyongtongji])

    respond_to do |format|
      if @xinyongtongji.save
        format.html { redirect_to @xinyongtongji, notice: 'Xinyongtongji was successfully created.' }
        format.json { render json: @xinyongtongji, status: :created, location: @xinyongtongji }
      else
        format.html { render action: "new" }
        format.json { render json: @xinyongtongji.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /xinyongtongjis/1
  # PUT /xinyongtongjis/1.json
  def update
    @xinyongtongji = Xinyongtongji.find(params[:id])

    respond_to do |format|
      if @xinyongtongji.update_attributes(params[:xinyongtongji])
        format.html { redirect_to @xinyongtongji, notice: 'Xinyongtongji was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @xinyongtongji.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /xinyongtongjis/1
  # DELETE /xinyongtongjis/1.json
  def destroy
    @xinyongtongji = Xinyongtongji.find(params[:id])
    @xinyongtongji.destroy

    respond_to do |format|
      format.html { redirect_to xinyongtongjis_url }
      format.json { head :no_content }
    end
  end
  
  def koufenjisuan(guifans,weiguijilus)
    koufen=0
       a=Array.new
       a[0]=0
       for guifan in guifans
       id=guifan.id   
       a[id]=0
       end
       
        if (weiguijilus!=[])
       
          for weiguijilu in weiguijilus 
            if a[weiguijilu.guifan_id].to_f+weiguijilu.fenzhi.to_f >=weiguijilu.guifan.fenzhi.to_f
                  a[weiguijilu.guifan_id]=weiguijilu.guifan.fenzhi.to_f
            else       
                 
                  a[weiguijilu.guifan_id]=a[weiguijilu.guifan_id].to_f+weiguijilu.fenzhi.to_f
            end
          end
        end
       for kf in a
       koufen=koufen+kf
       end
       koufen
  end
  
  def shuaxintongji(sh)
     #若该商户该期没计算过得分，新建一条统计记录 
     if( Xinyongtongji.find_all_by_shanghu_id_and_xinyongzhouqi_id(sh.id,params[:xinyongzhouqi])==[])
       xinyongtongji=Xinyongtongji.new
       xinyongtongji.shanghu_id=sh.id
       xinyongtongji.xinyongzhouqi_id=params[:xinyongzhouqi]
       weiguijilus=Weiguijilu.find_all_by_shanghu_id_and_xinyongzhouqi_id(sh.id,xinyongtongji.xinyongzhouqi_id)
       guifans=Guifan.find(:all)
       koufenzhi=self.koufenjisuan(guifans,weiguijilus)
       xinyongtongji.defen=100-koufenzhi
       xinyongtongji.save
     #若该商户已计算过得分，更新一条记录
     else
       
       xinyongtongji=Xinyongtongji.find_by_shanghu_id_and_xinyongzhouqi_id(sh.id,params[:xinyongzhouqi])
       weiguijilus=Weiguijilu.find_all_by_shanghu_id_and_xinyongzhouqi_id(sh.id,xinyongtongji.xinyongzhouqi_id)
       
       guifans=Guifan.find(:all)
       koufenzhi=self.koufenjisuan(guifans,weiguijilus)
       xinyongtongji.update_attribute(:defen,100-koufenzhi)
     end
  end
  
  
  
  def gengxin
  if params[:xinyongzhouqi_id] != ''  
    params[:xinyongzhouqi] = Xinyongzhouqi.find_by_name(params[:xinyongzhouqi_id]).id
   if params[:tanweihao] != ''
     @tanwei = Tanwei.find_by_tanweihao(params[:tanweihao])
     shanghu_id = @tanwei.shanghus.first.id
   else
     shanghu_id = ''
   end
   #shanghu_id=params[:xinyongtongji][:shanghu_id]
   #若输入的商户号为空，则更新该期所有商户的得分
   if(shanghu_id=='')
    shanghus=Shanghu.find(:all)
    for shanghu in shanghus  
    #该方法在楼上定义了
    shuaxintongji(shanghu)
    end
    redirect_to :action=>'index'
    #:xinyongtongji_shanghu_id =>params[:tanweihao],:xinyongtongji_xinyongzhouqi_id=>params[:xinyongzhouqi]
   #若输入了商户，则更新单个商户该周期的得分
   else
    if (Shanghu.find(shanghu_id)!=nil)
     shanghu=Shanghu.find(shanghu_id) 
     shuaxintongji(shanghu)
     redirect_to :action=>'index'
     #:xinyongtongji_shanghu_id =>params[:tanweihao],:xinyongtongji_xinyongzhouqi_id=>params[:xinyongzhouqi]
    else
     #提示用户，没这商户
    end
   end
  else
   redirect_to :action=>'index'
  end
  end
end
