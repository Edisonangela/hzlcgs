class YuangongsController < ApplicationController
  # GET /yuangongs
  # GET /yuangongs.json
  def index
    @yuangongs = Yuangong.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @yuangongs }
    end
  end

  # GET /yuangongs/1
  # GET /yuangongs/1.json
  def show
    @yuangong = Yuangong.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @yuangong }
    end
  end

  # GET /yuangongs/new
  # GET /yuangongs/new.json
  def new
    @yuangong = Yuangong.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @yuangong }
    end
  end

  # GET /yuangongs/1/edit
  def edit
    @yuangong = Yuangong.find(params[:id])
  end

  # POST /yuangongs
  # POST /yuangongs.json
  def create
    @yuangong = Yuangong.new(params[:yuangong])

    respond_to do |format|
      if @yuangong.save
        format.html { redirect_to @yuangong, notice: 'Yuangong was successfully created.' }
        format.json { render json: @yuangong, status: :created, location: @yuangong }
      else
        format.html { render action: "new" }
        format.json { render json: @yuangong.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /yuangongs/1
  # PUT /yuangongs/1.json
  def update
    @yuangong = Yuangong.find(params[:id])

    respond_to do |format|
      if @yuangong.update_attributes(params[:yuangong])
        format.html { redirect_to @yuangong, notice: 'Yuangong was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @yuangong.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yuangongs/1
  # DELETE /yuangongs/1.json
  def destroy
    @yuangong = Yuangong.find(params[:id])
    @yuangong.destroy

    respond_to do |format|
      format.html { redirect_to yuangongs_url }
      format.json { head :no_content }
    end
  end
end
