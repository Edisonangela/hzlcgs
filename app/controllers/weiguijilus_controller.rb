# encoding: utf-8
class WeiguijilusController < ApplicationController
  # GET /weiguijilus
  # GET /weiguijilus.json
  
 def index
    limit = params[:limit] || 25
    start = params[:start] || 0

    respond_to do |format|
      format.html # index.html.erb
      format.json  { 
        @shanghus = Array.new
        @weiguijilus = Array.new
         #binding.pry
       if(params[:searchzihao] != nil && params[:searchxinyongzhouqiname] != nil)

         shanghu_id = Shanghu.find_by_zihao(params[:searchzihao]).id
         xinyongzhouqi_id = Xinyongzhouqi.find_by_name(params[:searchxinyongzhouqiname]).id
         @weiguijilus = Weiguijilu.find(:all,:limit => limit, :offset =>start,:conditions => ["shanghu_id = ? and xinyongzhouqi_id = ?",shanghu_id,xinyongzhouqi_id])
       elsif(params[:searchtanweihao] != nil)
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
                sh.weiguijilus.each do |xcrz|
                 @weiguijilus << xcrz
                end
             end  
          end

        elsif (params[:searchzihao] != nil)
           @shanghus = Shanghu.find(:all,:limit => limit, :offset =>start,:conditions => ["zihao like ? ","%" + params[:searchzihao] +"%"] )
           @shanghus.each do |sh|
                sh.weiguijilus.each do |xcrz|
                 @weiguijilus << xcrz
                end
           end 
             
        elsif (params[:searchweiguineirong] != nil)
           @weiguijilus = Weiguijilu.find(:all,:limit => limit, :offset =>start,:conditions => ["weiguineirong like ? ","%" + params[:searchweiguineirong] +"%"] )
            
      
          
        
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
          @weiguijilus = Weiguijilu.find(:all,:limit => limit, :offset =>start)
          dev_count = Weiguijilu.count
        end     
         griddata = Hash.new
         griddata[:weiguijilus] = @weiguijilus.collect{|d|
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
           shanghuzihao = @shanghu.zihao
           end
             
           if d.user != nil
              faqiren = d.user.name
           else
              faqiren = nil
           end
           
           if d.guifan_id != nil
               guifandalei = Guifan.find(d.guifan_id).dalei
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
     
             
             {:id => d.id,:faqiren => faqiren,:dalei => guifandalei,:zihao => shanghuzihao,:guifan_id =>d.guifan_id,:shijian =>d.shijian, :chuliqingkuang => d.chuliqingkuang, :fenzhi => d.fenzhi, :tanweihao => tanweihao,:weiguineirong => d.weiguineirong,
              :xinyongzhouqi_id => d.xinyongzhouqi_id}
           }
         griddata[:totalCount] = Weiguijilu.count
          
         render :text => griddata.to_json() 
        }
    end
  end

  # GET /weiguijilus/1
  # GET /weiguijilus/1.json
  def show
    @weiguijilu = Weiguijilu.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @weiguijilu }
    end
  end

  # GET /weiguijilus/new
  # GET /weiguijilus/new.json
  def new
    @weiguijilu = Weiguijilu.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @weiguijilu }
    end
  end

  # GET /weiguijilus/1/edit
  def edit
    @weiguijilu = Weiguijilu.find(params[:id])
  end

  # POST /weiguijilus
  # POST /weiguijilus.json
  def create
    @weiguijilu = Weiguijilu.new(params[:weiguijilu])

    respond_to do |format|
      if @weiguijilu.save
        format.html { redirect_to @weiguijilu, notice: 'Weiguijilu was successfully created.' }
        format.json { render json: @weiguijilu, status: :created, location: @weiguijilu }
      else
        format.html { render action: "new" }
        format.json { render json: @weiguijilu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /weiguijilus/1
  # PUT /weiguijilus/1.json
  def update
    @weiguijilu = Weiguijilu.find(params[:id])

    respond_to do |format|
      if @weiguijilu.update_attributes(params[:weiguijilu])
        format.html { redirect_to @weiguijilu, notice: 'Weiguijilu was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @weiguijilu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weiguijilus/1
  # DELETE /weiguijilus/1.json
  def destroy
    @weiguijilu = Weiguijilu.find(params[:id])
    @weiguijilu.destroy

    respond_to do |format|
      format.html { redirect_to weiguijilus_url }
      format.json { head :no_content }
    end
  end
  
  def updatel
    @weiguijilu = Weiguijilu.find(params[:id])
    
    #视图中输入的是摊位号，而巡查日志表中存的是商户的Id，再次进行转换
    if params[:field] == 'tanweihao'
     @tanwei = Tanwei.find_by_tanweihao(params[:value])
     if @tanwei !=nil       
     @shanghu = @tanwei.shanghus.first       
      params[:value] = @shanghu.id
      params[:field] = 'shanghu_id'
      zihao = @shanghu.zihao
       #@shanghus.each do |shs| 
        #  str =''
        #  str << "#{shs.zihao}"+"  "         
       #end
     else
       params[:value] = nil
       params[:field] = 'shanghu_id'
       zihao = "无该摊位"
     end
    end
    
    #若更改的是guifan)_id列，那么自动计算出 fenzhi和neirong，用作后续有操作:保存进数据库并返回到视图成进行更新
    if params[:field] == 'guifan_id'
      @guifan = Guifan.find(params[:value])
      @weiguijilu.fenzhi = @guifan.fenzhi.to_i*0.1
      @weiguijilu.weiguineirong = @guifan.neirong
      
    end
    
    if params[:field] != 'dalei'
    @weiguijilu.try("#{params[:field]}=",params[:value])   
    @weiguijilu.save
    end
    
    respond_to do |format|
       if params[:field] == 'shanghu_id'
       format.json {
     
        griddata = Hash.new
        griddata[:zihao] = zihao

         render :text => griddata.to_json()}
          #若更改的是guifan)_id列，那么自动计算出 fenzhi和neirong，用作后续有操作:保存进数据库并返回到视图成进行更新
      elsif params[:field] == 'guifan_id'
        format.json {
        griddata = Hash.new   
        griddata[:fenzhi] = @guifan.fenzhi.to_i*0.1
        griddata[:weiguineirong] = @guifan.neirong
        render :text => griddata.to_json()}
         
      else
       format.json { head :no_content }
       
      end
      
    end
  end
  
  
    def createl
    @weiguijilu_shangyitiao = Weiguijilu.find(:last)
    @weiguijilu = Weiguijilu.new
    if @weiguijilu_shangyitiao != nil
      if @weiguijilu_shangyitiao.guifan_id
        @weiguijilu.guifan_id = @weiguijilu_shangyitiao.guifan_id
      end
      if @weiguijilu_shangyitiao.fenzhi !=nil
        @weiguijilu.fenzhi = @weiguijilu_shangyitiao.fenzhi
      end
      if @weiguijilu_shangyitiao.weiguineirong != nil
        @weiguijilu.weiguineirong = @weiguijilu_shangyitiao.weiguineirong
      end
    #设定当前周期为每条新建记录的信用周期，信用周期属性不显示在grid视图中
    
    @weiguijilu.xinyongzhouqi = Xinyongzhouqi.find_by_zhuangtai(1)
    end
    @weiguijilu.shijian = params[:shijian]
    @weiguijilu.user_id = params[:faqiren]
    respond_to do |format|
        if @weiguijilu.save
        #format.html { redirect_to @gongyingshang, notice: 'Gongyingshang was successfully created.' }
        #format.js { 
          #response.headers["Content-Type"] = "text/javascript; charset=utf-8"
         # render :layout => false
          # }
        format.json { 
          griddata = Hash.new
          griddata[:insert_id] = @weiguijilu.id
          griddata[:shijian] = @weiguijilu.shijian
          griddata[:faqiren] = User.find(session[:user_id]).name
          griddata[:guifan_id] = @weiguijilu.guifan_id
          griddata[:fenzhi] = @weiguijilu.fenzhi
          if @weiguijilu.guifan != nil
             griddata[:guifandalei] = @weiguijilu.guifan.dalei
          end
          griddata[:weiguineirong] = @weiguijilu.weiguineirong
          render :text => griddata.to_json() }
        else
        format.html { render action: "new" }
        format.json { render json: @xuncharizhi.errors, status: :unprocessable_entity }
        end
    end
  end
  
  def deletel
    @weiguijilu = Weiguijilu.find(params[:id])
    @weiguijilu.destroy
    respond_to do |format|
    format.json { head :no_content }
    end
  end
  

 def chaxunfromtongji
    limit = params[:limit] || 25
    start = params[:start] || 0
    @url = '/Weiguijilus.json?searchzihao='
    @url<< params[:searchzihao] 
    @url<<'&' 
    @url<<'searchxinyongzhouqiname='
    @url<< params[:searchxinyongzhouqiname]
    #format.html { render action: "new" }
    respond_to do |format|
      format.html # new.html.erb
      
     end
    
    
  end
  
  
end
