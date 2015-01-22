class CohortsMembersController < ApplicationController
  before_action :set_cohorts_member, only: [:show, :edit, :update, :destroy]

  # GET /cohorts_members
  # GET /cohorts_members.json
  def index
    @cohorts_members = CohortsMember.all
  end

  # GET /cohorts_members/1
  # GET /cohorts_members/1.json
  def show
  end

  # GET /cohorts_members/new
  def new
    @cohorts_member = CohortsMember.new
  end

  # GET /cohorts_members/1/edit
  def edit
  end

  # POST /cohorts_members
  # POST /cohorts_members.json
  def create
    @cohorts_member = CohortsMember.new(cohorts_member_params)

    respond_to do |format|
      if @cohorts_member.save
        format.html { redirect_to @cohorts_member, notice: 'Cohorts member was successfully created.' }
        format.json { render :show, status: :created, location: @cohorts_member }
      else
        format.html { render :new }
        format.json { render json: @cohorts_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cohorts_members/1
  # PATCH/PUT /cohorts_members/1.json
  def update
    respond_to do |format|
      if @cohorts_member.update(cohorts_member_params)
        format.html { redirect_to @cohorts_member, notice: 'Cohorts member was successfully updated.' }
        format.json { render :show, status: :ok, location: @cohorts_member }
      else
        format.html { render :edit }
        format.json { render json: @cohorts_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cohorts_members/1
  # DELETE /cohorts_members/1.json
  def destroy
    @cohorts_member.destroy
    respond_to do |format|
      format.html { redirect_to cohorts_members_url, notice: 'Cohorts member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cohorts_member
      @cohorts_member = CohortsMember.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cohorts_member_params
      params.require(:cohorts_member).permit(:cohort_id, :patient_id)
    end
end
