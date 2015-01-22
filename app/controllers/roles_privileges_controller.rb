class RolesPrivilegesController < ApplicationController
  before_action :set_roles_privilege, only: [:show, :edit, :update, :destroy]

  # GET /roles_privileges
  # GET /roles_privileges.json
  def index
    @roles_privileges = RolesPrivilege.all
  end

  # GET /roles_privileges/1
  # GET /roles_privileges/1.json
  def show
  end

  # GET /roles_privileges/new
  def new
    @roles_privilege = RolesPrivilege.new
  end

  # GET /roles_privileges/1/edit
  def edit
  end

  # POST /roles_privileges
  # POST /roles_privileges.json
  def create
    @roles_privilege = RolesPrivilege.new(roles_privilege_params)

    respond_to do |format|
      if @roles_privilege.save
        format.html { redirect_to @roles_privilege, notice: 'Roles privilege was successfully created.' }
        format.json { render :show, status: :created, location: @roles_privilege }
      else
        format.html { render :new }
        format.json { render json: @roles_privilege.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roles_privileges/1
  # PATCH/PUT /roles_privileges/1.json
  def update
    respond_to do |format|
      if @roles_privilege.update(roles_privilege_params)
        format.html { redirect_to @roles_privilege, notice: 'Roles privilege was successfully updated.' }
        format.json { render :show, status: :ok, location: @roles_privilege }
      else
        format.html { render :edit }
        format.json { render json: @roles_privilege.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles_privileges/1
  # DELETE /roles_privileges/1.json
  def destroy
    @roles_privilege.destroy
    respond_to do |format|
      format.html { redirect_to roles_privileges_url, notice: 'Roles privilege was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roles_privilege
      @roles_privilege = RolesPrivilege.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def roles_privilege_params
      params.require(:roles_privilege).permit(:role, :privilege)
    end
end
