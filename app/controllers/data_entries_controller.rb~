class DataEntriesController < ApplicationController
 # before_action :set_data_entry, only: [:show, :edit, :update, :destroy]
layout "data"
  # GET /data_entries
  # GET /data_entries.json
  def index
    #redirect_to(:action => 'addtribe')
  render("addtribe")
  end

  # GET /data_entries/1
  # GET /data_entries/1.json
  def show
   redirect_to(:action => "index")
  end
  def addlocation
       	@active = User.find(session[:user_id]).try :touch
 				@location = Location.new
  end
 def createlocation
			name = params[:retired]
			name.inspect_to_i
    		@active = User.find(session[:user_id]).try :touch
				@location = Location.new(data_entry_params)
		 		@location.date_created = Time.now
        @location.retired = params[:retired]
				@location.creator= session[:user_id]
				@location.save

    respond_to do |format|
      if @location.save
        format.html { redirect_to @data_entry, notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :addlocation }
        format.json { render json: @data_entry.errors, status: :unprocessable_entity }
      end
    end
 end
 def addtribe
		@active = User.find(session[:user_id]).try :touch
    @tribe = Tribe.new
 end
def createtribe
@active = User.find(session[:user_id]).try :touch
    @tribe = Tribe.new(tribe_params)

    respond_to do |format|
      if @tribe.save
        format.html { redirect_to @tribe, notice: 'Tribe was successfully created.' }
        format.json { render :show, status: :created, location: @tribe }
      else
        format.html { render :new }
        format.json { render json: @tribe.errors, status: :unprocessable_entity }
      end
    end
 end
 def addencountertype
@active = User.find(session[:user_id]).try :touch
    @encounters_type = EncountersType.new
 end
 def createencountertype
@active = User.find(session[:user_id]).try :touch
    @encounters_type = EncountersType.new(encounters_type_params)

    respond_to do |format|
      if @encounters_type.save
        format.html { redirect_to @encounters_type, notice: 'Encounters type was successfully created.' }
        format.json { render :show, status: :created, location: @encounters_type }
      else
        format.html { render :new }
        format.json { render json: @encounters_type.errors, status: :unprocessable_entity }
      end
    end
 end
  def addencounter
@active = User.find(session[:user_id]).try :touch
    @encounter = Encounter.new
    @encounter_type = EncountersType.all
    @people = Person.where(:voided => 0,:dead => 0)
    @locations = Location.all
    @patients = Patient.where(:voided => 0)
 end
 def createencounter
@active = User.find(session[:user_id]).try :touch
				@encounter = Encounter.new(encounter_params)
				@encounter.date_created = Time.now
				@encounter.creator= session[:user_id]
				@encounter.save
				@encounter_type = EncountersType.all
				@people = Person.all
				@locations = Location.where(:retired => 0 )
				@patients = Patient.where(:voided => 0)
    respond_to do |format|
      if @encounter.save
        format.html { redirect_to @encounter, notice: 'Encounter was successfully created.' }
        format.json { render :show, status: :created, location: @encounter }
      else
        format.html { render :new }
        format.json { render json: @encounter.errors, status: :unprocessable_entity }
      end
    end
 end
 def addpatient
@active = User.find(session[:user_id]).try :touch
				@patient = Patient.new
				@tribes = Tribe.all
 end
 def createpatient
@active = User.find(session[:user_id]).try :touch
    		@patient = Patient.new(patient_params)
   			@patient.date_created = Time.now
				@patient.creator= session[:user_id]
				@patient.save

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
 end
  # GET /data_entries/new
  def new
    @data_entry = DataEntry.new
  end

  # GET /data_entries/1/edit
  def edit
  end

  # POST /data_entries
  # POST /data_entries.json
  def create
    @data_entry = DataEntry.new(data_entry_params)

    respond_to do |format|
      if @data_entry.save
        format.html { redirect_to @data_entry, notice: 'Data entry was successfully created.' }
        format.json { render :show, status: :created, location: @data_entry }
      else
        format.html { render :new }
        format.json { render json: @data_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /data_entries/1
  # PATCH/PUT /data_entries/1.json
  def update
    respond_to do |format|
      if @data_entry.update(data_entry_params)
        format.html { redirect_to @data_entry, notice: 'Data entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @data_entry }
      else
        format.html { render :edit }
        format.json { render json: @data_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_entries/1
  # DELETE /data_entries/1.json
  def destroy
    @data_entry.destroy
    respond_to do |format|
      format.html { redirect_to data_entries_url, notice: 'Data entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_entry
       @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def data_entry_params
			params.require(:location).permit(:name, :description, :address1, :address2, :city_village, :state_province, :postal_code, :country, :latitude, :longitude, :creator, :date_created, :country_district, :neighborhood_cell, :region, :subregion, :township_division, :retired, :retired_by, :date_retired, :retire_reason, :parent_location, :uuid)
   
 end
end
