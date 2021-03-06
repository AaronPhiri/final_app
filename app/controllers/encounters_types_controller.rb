class EncountersTypesController < ApplicationController
  before_action :set_encounters_type, only: [:show, :edit, :update, :destroy]

  # GET /encounters_types
  # GET /encounters_types.json
  def index
 		@active = User.find(session[:user_id]).try :touch
    @encounters_types = EncountersType.all
  end

  # GET /encounters_types/1
  # GET /encounters_types/1.json
  def show
 		@active = User.find(session[:user_id]).try :touch
  end

  # GET /encounters_types/new
  def new
 		@active = User.find(session[:user_id]).try :touch
    @encounters_type = EncountersType.new
  end

  # GET /encounters_types/1/edit
  def edit
 		@active = User.find(session[:user_id]).try :touch
  end

  # POST /encounters_types
  # POST /encounters_types.json
  def create
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

  # PATCH/PUT /encounters_types/1
  # PATCH/PUT /encounters_types/1.json
  def update
 					@active = User.find(session[:user_id]).try :touch
    respond_to do |format|
      if @encounters_type.update(encounters_type_params)
        format.html { redirect_to @encounters_type, notice: 'Encounters type was successfully updated.' }
        format.json { render :show, status: :ok, location: @encounters_type }
      else
        format.html { render :edit }
        format.json { render json: @encounters_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /encounters_types/1
  # DELETE /encounters_types/1.json
  def destroy
 		@active = User.find(session[:user_id]).try :touch
    @encounters_type.destroy
    respond_to do |format|
      format.html { redirect_to encounters_types_url, notice: 'Encounters type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_encounters_type
      @encounters_type = EncountersType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def encounters_type_params
      params.require(:encounters_type).permit(:name, :description, :creator, :date_created, :retired, :retired_by, :date_retired, :retire_reason, :uuid)
    end
end
