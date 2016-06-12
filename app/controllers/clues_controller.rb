class CluesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_clue, only: [:show, :edit,:checkin, :update, :destroy]
  

  # GET /clues
  # GET /clues.json
  def index
    @clues = Clue.all
  end

  # GET /clues/1
  # GET /clues/1.json
  def show
    @checkin = LocationCheckin.new
  end

  # GET /clues/new
  def new
    @clue = Clue.new
  end

  # GET /clues/1/edit
  def edit
  end

  # POST /clues
  # POST /clues.json
  def create
    @clue = Clue.new(clue_params)

    respond_to do |format|
      if @clue.save
        format.html { redirect_to @clue, notice: 'Clue was successfully created.' }
        format.json { render :show, status: :created, location: @clue }
      else
        format.html { render :new }
        format.json { render json: @clue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clues/1
  # PATCH/PUT /clues/1.json
  def update
    respond_to do |format|
      if @clue.update(clue_params)
        format.html { redirect_to @clue, notice: 'Clue was successfully updated.' }
        format.json { render :show, status: :ok, location: @clue }
      else
        format.html { render :edit }
        format.json { render json: @clue.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def checkin
    @checkin = ClueCheckin.new(clue_checkin_params)
    @checkin.clue_id = @location.clue.id
    @checkin.user_id = current_user.id
    @checkin.save
  
    @checkin.check_submission
    if @checkin.correct
      redirect_to rush_location_path(@rush, @rush.next_location(current_user))
    else
      redirect_to rush_location_clue_path(@rush, @location)
    end
  end

  # DELETE /clues/1
  # DELETE /clues/1.json
  def destroy
    @clue.destroy
    respond_to do |format|
      format.html { redirect_to clues_url, notice: 'Clue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clue
      @rush = Rush.find(params[:rush_id])
      #clue always belongs to a location
      @location = Location.find(params[:location_id])
      @clue = @location.clue
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clue_params
      params.require(:clue).permit(:location_id, :lat, :long)
    end
    
    def clue_checkin_params
      params.require(:clue_checkin).permit(:lat, :long)
    end
end
