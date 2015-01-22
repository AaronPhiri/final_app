class TribesController < ApplicationController
  before_action :set_tribe, only: [:show, :edit, :update, :destroy,]
	layout "tribes"
  # GET /tribes
  # GET /tribes.json
  def index
 		@active = User.find(session[:user_id]).try :touch
    @tribes = Tribe.all.paginate(page: params[:page], per_page: 12)
  end

  # GET /tribes/1
  # GET /tribes/1.json
  def show
 		@active = User.find(session[:user_id]).try :touch
  end
 def getall
   	@tribesall = Tribe.all.paginate(page: params[:page], per_page: 6)
    @active = User.find(session[:user_id]).try :touch
 end
 def showall
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
   
		#@name.inspect_to_i
end
  # GET /tribes/new
  def new
 		@active = User.find(session[:user_id]).try :touch
    @tribe = Tribe.new
  end

  # GET /tribes/1/edit
  def edit
 		@active = User.find(session[:user_id]).try :touch
  end

  # POST /tribes
  # POST /tribes.json
  def create
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

  # PATCH/PUT /tribes/1
  # PATCH/PUT /tribes/1.json
  def update
 					@active = User.find(session[:user_id]).try :touch
		  respond_to do |format|
						if @tribe.update(tribe_params)
						  format.html { redirect_to @tribe, notice: 'Tribe was successfully updated.' }
						  format.json { render :show, status: :ok, location: @tribe }
								else
									format.html { render :edit }
									format.json { render json: @tribe.errors, status: :unprocessable_entity }
								end
					end
  	end
	

  # DELETE /tribes/1
  # DELETE /tribes/1.json
  def destroy
 		@active = User.find(session[:user_id]).try :touch
    @tribe.destroy
    respond_to do |format|
      format.html { redirect_to tribes_url, notice: 'Tribe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tribe
      @tribe = Tribe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tribe_params
      params.require(:tribe).permit(:retired, :name)
    end
end
