# encoding: utf-8
class XuncharizhisController < ApplicationController
  # GET /xuncharizhis
  # GET /xuncharizhis.json
  def index
    limit = params[:limit] || 25
    start = params[:start] || 0

    respond_to do |format|
      format.html # index.html.erb
      format.json  { 
          @shanghus = Array.new
          @xuncharizhis = Array.new
        if(params[:searchzhuangtai] != nil && params[:searchkefutishi] != nil)
          @xuncharizhis = Xuncharizhi.find(:all,:limit => limit, :offset =>start,:conditions => ["zhuangtai like ? and kefutishi like ?",[params[:searchzhuangtai].to_i],params[:searchkefutishi]])
        elsif(params[:searchzhuangtai] != nil)
         #binding.pry
          @xuncharizhis = Xuncharizhi.find(:all,:limit => limit, :offset =>start,:conditions => ["zhuangtai like ? ",params[:searchzhuangtai].to_i] )
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
                sh.xuncharizhis.each do |xcrz|
                 @xuncharizhis << xcrz
                end
             end  
          end
        elsif (params[:searchzihao] != nil)
           @shanghus = Shanghu.find(:all,:limit => limit, :offset =>start,:conditions => ["zihao like ? ","%" + params[:searchzihao] +"%"] )
           @shanghus.each do |sh|
                sh.xuncharizhis.each do |xcrz|
                 @xuncharizhis << xcrz
                end
           end 
           
        elsif(params[:searchwenti] != nil)
         #binding.pry
          @xuncharizhis = Xuncharizhi.find(:all,:limit => limit, :offset =>start,:conditions => ["wenti like ? ","%" + params[:searchwenti] +"%"] )
        #elsif (params[:searchpinlei])
         # @shangpins = Shangpin.find(:all,:limit => limit, :offset =>start,:conditions => ["leixing like ? ","%" + params[:searchpinlei] +"%"] ) 
        else
          @xuncharizhis = Xuncharizhi.find(:all,:limit => limit, :offset =>start)
          dev_count = Xuncharizhi.count
        end     
         griddata = Hash.new
         griddata[:xuncharizhis] = @xuncharizhis.collect{|d|
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
             
             {:id => d.id,:faqishijian =>d.faqishijian,:zhuangtai => d.zhuangtai, :wentidalei => d.wentidalei, :wenti => d.wenti, :tanweihao => tanweihao,:zihao =>shanghuzihao,:kefutishi => d.kefutishi,
              :kefuhuifushijian => d.kefuhuifushijian,:kefuhuifu => d.kefuhuifu,:faqiren => faqiren}
           }
         griddata[:totalCount] = Xuncharizhi.count
          
         render :text => griddata.to_json() 
        }
    end
  end

  # GET /xuncharizhis/1
  # GET /xuncharizhis/1.json
  def show
    @xuncharizhi = Xuncharizhi.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @xuncharizhi }
    end
  end

  # GET /xuncharizhis/new
  # GET /xuncharizhis/new.json
  def new
    @xuncharizhi = Xuncharizhi.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @xuncharizhi }
    end
  end

  # GET /xuncharizhis/1/edit
  def edit
    @xuncharizhi = Xuncharizhi.find(params[:id])
  end

  # POST /xuncharizhis
  # POST /xuncharizhis.json
  def create
    @xuncharizhi = Xuncharizhi.new(params[:xuncharizhi])

    respond_to do |format|
      if @xuncharizhi.save
        format.html { redirect_to @xuncharizhi, notice: 'Xuncharizhi was successfully created.' }
        format.json { render json: @xuncharizhi, status: :created, location: @xuncharizhi }
      else
        format.html { render action: "new" }
        format.json { render json: @xuncharizhi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /xuncharizhis/1
  # PUT /xuncharizhis/1.json
  def update
    @xuncharizhi = Xuncharizhi.find(params[:id])

    respond_to do |format|
      if @xuncharizhi.update_attributes(params[:xuncharizhi])
        format.html { redirect_to @xuncharizhi, notice: 'Xuncharizhi was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @xuncharizhi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /xuncharizhis/1
  # DELETE /xuncharizhis/1.json
  def destroy
    @xuncharizhi = Xuncharizhi.find(params[:id])
    @xuncharizhi.destroy

    respond_to do |format|
      format.html { redirect_to xuncharizhis_url }
      format.json { head :no_content }
    end
  end
  
  
  #editgrid更新，route里有 get定义
  def updatel
    
    @xuncharizhi = Xuncharizhi.find(params[:id])
    #视图中输入的是摊位号，而巡查日志表中存的是商户的Id，再次进行转换
    if params[:field] == 'tanweihao'

     @tanwei = Tanwei.find_by_tanweihao(params[:value])    
     if @tanwei != nil   
      @shanghu = @tanwei.shanghus.first       
      params[:value] = @shanghu.id
      params[:field] = 'shanghu_id'
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
    @xuncharizhi.try("#{params[:field]}=",params[:value])
    @xuncharizhi.save
    respond_to do |format|
       if params[:field] == 'shanghu_id'
       format.json {
     
        griddata = Hash.new
        griddata[:zihao] = @shanghu.zihao

         render :text => griddata.to_json()}
      else
       format.json { head :no_content }
       
      end
      
    end
  end
  
  #editgrid
  def deletel
    @xuncharizhi = Xuncharizhi.find(params[:id])
    @xuncharizhi.destroy
    respond_to do |format|
       format.json { head :no_content }
    end
  end
  
  #editgrid
  def createl
    @xuncharizhi = Xuncharizhi.new()
    @xuncharizhi.wentidalei = params[:wentidalei]
    @xuncharizhi.zhuangtai = params[:zhuangtai]
    @xuncharizhi.kefuhuifushijian = params[:kefuhuifushijian]
    @xuncharizhi.faqishijian = params[:faqishijian]
    @xuncharizhi.user_id = params[:faqiren]
    respond_to do |format|
        if @xuncharizhi.save
        #format.html { redirect_to @gongyingshang, notice: 'Gongyingshang was successfully created.' }
        #format.js { 
          #response.headers["Content-Type"] = "text/javascript; charset=utf-8"
         # render :layout => false
          # }
        format.json { 
          griddata = Hash.new
          griddata[:insert_id] = @xuncharizhi.id
          render :text => griddata.to_json() }
        else
        format.html { render action: "new" }
        format.json { render json: @xuncharizhi.errors, status: :unprocessable_entity }
        end
    end
  end

end
