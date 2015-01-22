class EncountersController < ApplicationController
  before_action :set_encounter, only: [:show, :edit, :update, :destroy]
layout "encounters"
  # GET /encounters
  # GET /encounters.json
  def index
 		@active = User.find(session[:user_id]).try :touch
    @encounters = Encounter.all.paginate(page: params[:page], per_page: 12)
  end

  # GET /encounters/1
  # GET /encounters/1.json
  def show
				 @active = User.find(session[:user_id]).try :touch
  end
	 def encountertypewithtotal
		  		@active = User.find(session[:user_id]).try :touch
				 	@encounters = Encounter.count
					@encountertype = EncountersType.find_by_sql("select encounters_types.name, count(*) as count
				from encounters  inner join encounters_types on encounters_types.encounter_type_id = encounters.encounter_type where  				encounters_types.encounter_type_id = encounters.encounter_type 
				group by encounters.encounter_type order by count desc limit 12")

											#@encountertype = EncountersType.find_by_sql("select encounters_types.name, count(*) as count, users.username
											#from encounters inner join encounters_types on encounters_types.encounter_type_id = encounters.encounter_type
											#inner join users on encounters.creator = users.user_id group by voided_by order by count desc")
	 end

  def encounterproviderwithtotal
				@active = User.find(session[:user_id]).try :touch
				@encountertype = Person.find_by_sql("select people.person_id, count(*) as count
				from encounters  inner join people on people.person_id = encounters.provider_id where  	people.person_id = encounters.provider_id   
				group by encounters.provider_id  order by count desc limit 12")


 end
 def encounterperlocation
			@active = User.find(session[:user_id]).try :touch
   		@encountertype =  Location.find_by_sql("select locations.name, count(*) as count
				from encounters  inner join locations on locations.location_id = encounters.location_id  where  	locations.location_id = encounters.location_id
				group by encounters.location_id  order by count desc limit 12")
 end
  def patientencountertypepercount
			@active = User.find(session[:user_id]).try :touch
			@encountertype = Encounter.find_by_sql("select patient_id,encounters_types.name,count(*) as count  from encounters inner join encounters_types on encounters_types.encounter_type_id = encounters.encounter_type  group by patient_id,encounter_type  order by patient_id desc limit 12")
 end
  # GET /encounters/new
  def new
 		@active = User.find(session[:user_id]).try :touch
    @encounter = Encounter.new
    @encounter_type = EncountersType.all
    @people = Person.where(:voided => 0,:dead => 0)
    @locations = Location.all
    @patients = Patient.where(:voided => 0)
  end

  # GET /encounters/1/edit
  def edit
 		@active = User.find(session[:user_id]).try :touch
		@encounter_type = EncountersType.all
    @person = Person.count
    @locations = Location.all
  end

  # POST /encounters
  # POST /encounters.json
  def create
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

  # PATCH/PUT /encounters/1
  # PATCH/PUT /encounters/1.json
  def update
 				@active = User.find(session[:user_id]).try :touch
    respond_to do |format|
      if @encounter.update(encounter_params)
        format.html { redirect_to @encounter, notice: 'Encounter was successfully updated.' }
        format.json { render :show, status: :ok, location: @encounter }
      else
        format.html { render :edit }
        format.json { render json: @encounter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /encounters/1
  # DELETE /encounters/1.json
  def destroy
 		@active = User.find(session[:user_id]).try :touch
    @encounter.destroy
    respond_to do |format|
      format.html { redirect_to encounters_url, notice: 'Encounter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_encounter
      @encounter = Encounter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def encounter_params
      params.require(:encounter).permit(:encounter_type, :patient_id, :provider_id, :location_id, :form_id, :encounter_datetime, :creator, :date_created, :voided, :voided_by, :date_voided, :void_reason, :uuid, :changed_by, :date_changed)
    end
end
