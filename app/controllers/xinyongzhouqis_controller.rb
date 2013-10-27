class XinyongzhouqisController < ApplicationController
  # GET /xinyongzhouqis
  # GET /xinyongzhouqis.json
  def index
    limit = params[:limit] || 25
    start = params[:start] || 0

    respond_to do |format|
      format.html # index.html.erb
      format.json  { 
         @xinyongzhouqis = Xinyongzhouqi.find(:all,:limit => limit, :offset =>start)
         dev_count = Xinyongzhouqi.count
              
         griddata = Hash.new
         griddata[:xinyongzhouqis] =@xinyongzhouqis.collect{|d|
         
           #tanweihao = d.tanwei.tanweihao if d.tanwei != nil
           {:id => d.id, :name => d.name, :shijianduan => d.shijianduan, :zhuangtai => d.zhuangtai}
           }
         griddata[:totalCount] = dev_count
          
         render :text => griddata.to_json() 
        }
    end
  end

  # GET /xinyongzhouqis/1
  # GET /xinyongzhouqis/1.json
  def show
    @xinyongzhouqi = Xinyongzhouqi.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @xinyongzhouqi }
    end
  end

  # GET /xinyongzhouqis/new
  # GET /xinyongzhouqis/new.json
  def new
    @xinyongzhouqi = Xinyongzhouqi.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @xinyongzhouqi }
    end
  end

  # GET /xinyongzhouqis/1/edit
  def edit
    @xinyongzhouqi = Xinyongzhouqi.find(params[:id])
  end

  # POST /xinyongzhouqis
  # POST /xinyongzhouqis.json
  def create
    @xinyongzhouqi = Xinyongzhouqi.new(params[:xinyongzhouqi])

    respond_to do |format|
      if @xinyongzhouqi.save
        format.html { redirect_to @xinyongzhouqi, notice: 'Xinyongzhouqi was successfully created.' }
        format.json { render json: @xinyongzhouqi, status: :created, location: @xinyongzhouqi }
      else
        format.html { render action: "new" }
        format.json { render json: @xinyongzhouqi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /xinyongzhouqis/1
  # PUT /xinyongzhouqis/1.json
  def update
    @xinyongzhouqi = Xinyongzhouqi.find(params[:id])

    respond_to do |format|
      if @xinyongzhouqi.update_attributes(params[:xinyongzhouqi])
        format.html { redirect_to @xinyongzhouqi, notice: 'Xinyongzhouqi was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @xinyongzhouqi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /xinyongzhouqis/1
  # DELETE /xinyongzhouqis/1.json
  def destroy
    @xinyongzhouqi = Xinyongzhouqi.find(params[:id])
    @xinyongzhouqi.destroy

    respond_to do |format|
      format.html { redirect_to xinyongzhouqis_url }
      format.json { head :no_content }
    end
  end
end
