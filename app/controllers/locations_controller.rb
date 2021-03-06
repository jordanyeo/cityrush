class LocationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_location, only: [:show, :edit, :update, :destroy, :checkin]
  before_action :set_rush

  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    if (current_user.rushes.pluck(:id).include? params[:rush_id].to_i) && (@location.rush_order <= @rush.user_rush(current_user).active_location)      
      @checkins = @location.location_checkins.for_user(current_user)
      if @checkins.length > 0  && @checkins.last.correct
        if @location.clue
          redirect_to rush_location_clue_path(@rush, @location)
        else
          redirect_to dashboard_path
        end
      else
        @checkin = LocationCheckin.new
      end
    else
      redirect_to dashboard_url
    end
  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def checkin
    @checkin = LocationCheckin.new(location_checkin_params)
    @checkin.location_id = @location.id
    @checkin.user_id = current_user.id
    @checkin.save
  
    @checkin.check_submission
    if @checkin.correct
      if @location.clue
        redirect_to rush_location_clue_path(@rush, @location)
      else
        @rush.user_rush(current_user).update_attribute(:complete, true)
        redirect_to dashboard_path
      end
    else
      redirect_to rush_location_path(@rush, @location)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end
    
    def set_rush
      @rush = Rush.find(params[:rush_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:rush_id, :name, :description, :lat, :long)
    end
    
    def location_checkin_params
      params.require(:location_checkin).permit(:lat, :long)
    end
end
