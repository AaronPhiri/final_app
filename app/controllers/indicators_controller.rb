class IndicatorsController < ApplicationController
  
 
  # GET /indicators
  # GET /indicators.json
  def index
   	@active = User.find(session[:user_id]).try :touch
 redirect_to(:action => "showindicators")
end
 def showindicators
 		@active = User.find(session[:user_id]).try :touch
   	@usercount = User.count
    @userretired =  User.retired.count
   	@usernotretired = User.notretired.count
 		@tribes = Tribe.all
		@encountertype1 =  Location.find_by_sql("select locations.name, count(*) as count
				from encounters  inner join locations on locations.location_id = encounters.location_id  where  	locations.location_id = encounters.location_id
				group by encounters.location_id  order by count desc")

 		@users = System.find_by_sql("select systems.system_name,count(*) as count  from users inner join systems on  systems.id = users.system_id  group by users.system_id order by count desc")

		@encountertype2 = Person.find_by_sql("select people.person_id, count(*) as count
				from encounters  inner join people on people.person_id = encounters.provider_id where  	people.person_id = encounters.provider_id   
				group by encounters.provider_id  order by count desc")
		@encountertype3 = EncountersType.find_by_sql("select encounters_types.name, count(*) as count
				from encounters  inner join encounters_types on encounters_types.encounter_type_id = encounters.encounter_type where  				encounters_types.encounter_type_id = encounters.encounter_type 
				group by encounters.encounter_type order by count desc")
 		@users2 = User.find_by_sql("select users.username,count(*) as count  from encounters inner join users on users.user_id = encounters.creator  group by encounters.creator order by count desc")

 		@online = Online.all

 end

def backtoadmin
		 @active = User.find(session[:user_id]).try :touch
		 authorized_user = User.find(session[:user_id])
   if authorized_user.system == "administrator"
   
   redirect_to(:controller =>"Administrator_page",:action => "index")
   else
    redirect_to(:action=> "login")
   end

end
  # GET /indicators/1
  # GET /indicators/1.json
  def show
  end

  # GET /indicators/new
  def new
    
  end

  # GET /indicators/1/edit
  def edit
  end

  # POST /indicators
  # POST /indicators.json
  def create
   
  end

  # PATCH/PUT /indicators/1
  # PATCH/PUT /indicators/1.json
  def update
    
  end

  # DELETE /indicators/1
  # DELETE /indicators/1.json
  def destroy
 end
    
end
private 
   

