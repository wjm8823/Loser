class WeightsController < ApplicationController

  def index
    @weights = Weight.order('week')
  end

  def show
    @weight = Weight.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @weight }
    end
  end

  def new
    @weight = Weight.new
    unless params[:player_id].nil?
      @weight.player_id = params[:player_id]
      t = Player.find_by_id(params[:player_id]).weights.maximum(:week)
      t == nil ? @weight.week = 0 : @weight.week = t+1 
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @weight }
    end
  end

  def edit
    @weight = Weight.find(params[:id])
  end

  def create
    @weight = Weight.new(params[:weight])
    respond_to do |format|
      if @weight.save 
        format.html { redirect_to player_path(@weight.player.id), notice: 'Weight was successfully created.' }
        format.json { render json: @weight, status: :created, location: @weight }
      else
        format.html { render action: "new" }
        format.json { render json: @weight.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @weight = Weight.find(params[:id])

    respond_to do |format|
      if @weight.update_attributes(params[:weight])
        format.html { redirect_to @weight, notice: 'Weight was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @weight.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @weight = Weight.find(params[:id])
    @weight.destroy

    respond_to do |format|
      format.html { redirect_to weights_url }
      format.json { head :ok }
    end
  end
end
