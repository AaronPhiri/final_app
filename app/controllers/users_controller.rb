class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
 	before_action :confirm_logged_in

  layout "users"
	respond_to :json, :html
  # GET /users
  # GET /users.json
  def index
        
				@users = User.all.paginate(page: params[:page], per_page: 12)
				@system = System.all.paginate(page: params[:page], per_page: 12)
        @active = User.find(session[:user_id]).try :touch


  end
 #check for retired Users
 def retired
		@active = User.find(session[:user_id]).try :touch
   	@users = User.retired
  render("index")
 			
 end
 #check for not retired
  def notretired
					@users = User.notretired
				 	@active = User.find(session[:user_id]).try :touch
  render("index")
  end
   def getnametosearch
				  @users = User.all
				  @tribes = Tribe.all

			 	@active = User.find(session[:user_id]).try :touch
				@tribesall = Tribe.all
				@found= []
			 	@name = []
			 	@tribesall.each do |tribe| 
						if tribe.patients.count > 0
						
						 @found << tribe.patients.count
						  @name << " '#{tribe.name}', "
     end

    end 
		@found = @found.join(",")
		@name = @name.join(" ")
   
   end
  #search user by name
  def searchbyname
 				@active = User.find(session[:user_id]).try :touch
   			name = params[:username]
    	year = params[:year]
   
  		 @users = User.where(:username => name).all
 			if @users.any?
  			render("index")
 			else
				 flash[:notice] =" No user found by the name:  #{name}"
				 render(:action => "getnametosearch")
         return false
			end
  end

  # GET /users/1
  # GET /users/1.json
  def show
 				@active = User.find(session[:user_id]).try :touch
  end

  # GET /users/new
  def new
				@user = User.new
				@system = System.all
				@creator = User.all
				@person = Person.all
 				@active = User.find(session[:user_id]).try :touch
  end

  # GET /users/1/edit
  def edit
				@system = System.all
				@creator = User.all
				@person = Person.all
 				@active = User.find(session[:user_id]).try :touch
  end

  # POST /users
  # POST /users.json
  def create
				@user = User.new(user_params)
				@user.date_created = Time.now
      
				@user.creator= session[:user_id]
				@user.save
				 @active = User.find(session[:user_id]).try :touch
				@system = System.all
				@creator = User.all
				@person = Person.all
    respond_to do |format|
      if @user.save

        format.html { redirect_to @user, adduser: "User #{(@user.username).capitalize} was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else

        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
 				@active = User.find(session[:user_id]).try :touch
				@system = System.all
				@creator = User.all
				@person = Person.all
				@user.update(user_params)
				@user.changed_by = session[:user_id]
				@user.date_changed = Time.now
    if 	@user.retired == "YES"
       	@user.retired_by = session[:user_id]
    end
     		@user.save
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  def delete
 		@active = User.find(session[:user_id]).try :touch
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
 		@active = User.find(session[:user_id]).try :touch
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def summaryofusers
					@active = User.find(session[:user_id]).try :touch
					@usercount = User.count
					@userretired =  User.retired.count
					@usernotretired = User.notretired.count

 					@users = System.find_by_sql("select systems.system_name,count(*) as count  from users inner join systems on  systems.id = users.system_id  group by users.system_id order by count desc")
		 @found= []
		 @name = []
		 @users.each do |tribe| 
      
      
       @found << tribe.count
    

		
end
		
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:system_id, :username, :password,:password_confirmation,:year, :secret_question, :secret_answer,:person_id, :retired,  :retire_reason, :uuid)
    end
end
