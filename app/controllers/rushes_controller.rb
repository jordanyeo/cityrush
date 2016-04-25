class RushesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_rush, only: [:show, :edit, :update, :destroy]

  # GET /rushes
  # GET /rushes.json
  def index
    @rushes = Rush.all
  end

  # GET /rushes/1
  # GET /rushes/1.json
  def show
  end

  # GET /rushes/new
  def new
    @rush = Rush.new
  end

  # GET /rushes/1/edit
  def edit
  end

  # POST /rushes
  # POST /rushes.json
  def create
    @rush = Rush.new(rush_params)

    respond_to do |format|
      if @rush.save
        format.html { redirect_to @rush, notice: 'Rush was successfully created.' }
        format.json { render :show, status: :created, location: @rush }
      else
        format.html { render :new }
        format.json { render json: @rush.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rushes/1
  # PATCH/PUT /rushes/1.json
  def update
    respond_to do |format|
      if @rush.update(rush_params)
        format.html { redirect_to @rush, notice: 'Rush was successfully updated.' }
        format.json { render :show, status: :ok, location: @rush }
      else
        format.html { render :edit }
        format.json { render json: @rush.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rushes/1
  # DELETE /rushes/1.json
  def destroy
    @rush.destroy
    respond_to do |format|
      format.html { redirect_to rushes_url, notice: 'Rush was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rush
      @rush = Rush.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rush_params
      params.require(:rush).permit(:name, :scheduled_at)
    end
end
