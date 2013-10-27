class GuifansController < ApplicationController
  # GET /guifans
  # GET /guifans.json
  def index
    limit = params[:limit] || 25
    start = params[:start] || 0

    respond_to do |format|
      format.html # index.html.erb
      format.json  { 
         @guifans = Guifan.find(:all,:limit => limit, :offset =>start)
         dev_count = Guifan.count
              
         griddata = Hash.new
         griddata[:guifans] =@guifans.collect{|d|
         
           #tanweihao = d.tanwei.tanweihao if d.tanwei != nil
           {:id => d.id, :dalei => d.dalei, :fenzhi => d.fenzhi, :kaopingbumen => d.kaopingbumen, :kaohefangshi => d.kaohefangshi, :neirong => d.neirong, :xuhao => d.xuhao}
           }
         griddata[:totalCount] = dev_count
          
         render :text => griddata.to_json() 
        }
    end
  end

  # GET /guifans/1
  # GET /guifans/1.json
  def show
    @guifan = Guifan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @guifan }
    end
  end

  # GET /guifans/new
  # GET /guifans/new.json
  def new
    @guifan = Guifan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @guifan }
    end
  end

  # GET /guifans/1/edit
  def edit
    @guifan = Guifan.find(params[:id])
  end

  # POST /guifans
  # POST /guifans.json
  def create
    @guifan = Guifan.new(params[:guifan])

    respond_to do |format|
      if @guifan.save
        format.html { redirect_to @guifan, notice: 'Guifan was successfully created.' }
        format.json { render json: @guifan, status: :created, location: @guifan }
      else
        format.html { render action: "new" }
        format.json { render json: @guifan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /guifans/1
  # PUT /guifans/1.json
  def update
    @guifan = Guifan.find(params[:id])

    respond_to do |format|
      if @guifan.update_attributes(params[:guifan])
        format.html { redirect_to @guifan, notice: 'Guifan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @guifan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guifans/1
  # DELETE /guifans/1.json
  def destroy
    @guifan = Guifan.find(params[:id])
    @guifan.destroy

    respond_to do |format|
      format.html { redirect_to guifans_url }
      format.json { head :no_content }
    end
  end
  
  def guifandaleis


    respond_to do |format|
      format.html # index.html.erb
      format.json  { 
      @guifans = Guifan.find(:all)
      @daleis = Array.new
      for guifan in @guifans 
           @biaoji = true
          for dalei in @daleis
            if guifan.dalei == dalei
              @biaoji = false
              break
            end   
          end 
          if @biaoji 
              @daleis << guifan.dalei
          end
           
      end   
         griddata = Hash.new
         griddata[:daleis] = Array.new
         for dalei in @daleis
           griddata[:daleis] << {:dalei => dalei}
         end
           #tanweihao = d.tanwei.tanweihao if d.tanwei != nil          
         render :text => griddata.to_json() 
        }
    end
  end
  
  def guifanneirongs
      respond_to do |format|
      format.html # index.html.erb
      format.json  { 
      if params[:dalei] != nil
      @guifans=Guifan.find_all_by_dalei(params[:dalei])
      else
      @guifans=Guifan.find(:all)
      end
      griddata = Hash.new
      griddata[:guifanneirongs] =@guifans.collect{|d|
         
           #tanweihao = d.tanwei.tanweihao if d.tanwei != nil
           {:id => d.id,  :fenzhi => d.fenzhi,:guifanneirong => d.neirong}
           }
      
         render :text => griddata.to_json() 
      }
     end
  
  end
  
end    
