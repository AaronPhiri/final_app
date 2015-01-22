class UsersPropertiesController < ApplicationController
  before_action :set_users_property, only: [:show, :edit, :update, :destroy]

  # GET /users_properties
  # GET /users_properties.json
  def index
    @users_properties = UsersProperty.all
  end

  # GET /users_properties/1
  # GET /users_properties/1.json
  def show
  end

  # GET /users_properties/new
  def new
    @users_property = UsersProperty.new
  end

  # GET /users_properties/1/edit
  def edit
  end

  # POST /users_properties
  # POST /users_properties.json
  def create
    @users_property = UsersProperty.new(users_property_params)

    respond_to do |format|
      if @users_property.save
        format.html { redirect_to @users_property, notice: 'Users property was successfully created.' }
        format.json { render :show, status: :created, location: @users_property }
      else
        format.html { render :new }
        format.json { render json: @users_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users_properties/1
  # PATCH/PUT /users_properties/1.json
  def update
    respond_to do |format|
      if @users_property.update(users_property_params)
        format.html { redirect_to @users_property, notice: 'Users property was successfully updated.' }
        format.json { render :show, status: :ok, location: @users_property }
      else
        format.html { render :edit }
        format.json { render json: @users_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users_properties/1
  # DELETE /users_properties/1.json
  def destroy
    @users_property.destroy
    respond_to do |format|
      format.html { redirect_to users_properties_url, notice: 'Users property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_property
      @users_property = UsersProperty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def users_property_params
      params.require(:users_property).permit(:user_id, :property, :property_value)
    end
end
