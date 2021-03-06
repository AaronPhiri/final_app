class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]
layout "locations"
  # GET /locations
  # GET /locations.json
  def index
 		@active = User.find(session[:user_id]).try :touch
    @locations = Location.paginate(page: params[:page], per_page: 12)
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
 			@active = User.find(session[:user_id]).try :touch
  end

  # GET /locations/new
  def new
 		@active = User.find(session[:user_id]).try :touch
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
 @active = User.find(session[:user_id]).try :touch
  end

  # POST /locations
  # POST /locations.json
  def create
 				@active = User.find(session[:user_id]).try :touch
				@location = Location.new(location_params)
		 		@location.date_created = Time.now
				@location.creator= session[:user_id]
				@location.save

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
 				@active = User.find(session[:user_id]).try :touch
        @location.update(location_params)
        @location.changed_by = session[:user_id]
				@location.date_changed = Time.now
        @location.country = "Malawi"
    if 	@location.retired == 1
       	@location.retired_by = session[:user_id]
    end
     		@location.save
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
 @active = User.find(session[:user_id]).try :touch
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:name, :description, :address1, :address2, :city_village, :state_province, :postal_code, :country, :latitude, :longitude, :creator, :date_created, :country_district, :neighborhood_cell, :region, :subregion, :township_division, :retired, :retired_by, :date_retired, :retire_reason, :parent_location, :uuid)
    end
end
