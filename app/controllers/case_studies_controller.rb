class CaseStudiesController < ApplicationController
  #before_action :set_case_study, only: [:show, :edit, :update, :destroy]

  # GET /case_studies
  # GET /case_studies.json
  def index
    @case_studies = YAML::load(File.open(CASE_STUDY_DATA_PATH)) || []
  end

  # GET /case_studies/1
  # GET /case_studies/1.json
  def show
    @case_study = CaseStudy.find(params[:id])
  end

  # GET /case_studies/new
  def new
    @case_study = CaseStudy.new
    @user = []
  end

  # GET /case_studies/1/edit
  def edit
    @case_study = CaseStudy.find(params[:id])
  end

  # POST /case_studies
  # POST /case_studies.json
  def create
    @case_study = CaseStudy.new(params[:case_study])
    if @case_study.save(@case_study.attributes)
      redirect_to root_url, notice: "New Case Study saved successfully."
    else
      render "new"
    end

  end

  # PATCH/PUT /case_studies/1
  # PATCH/PUT /case_studies/1.json
  def update
    respond_to do |format|
      if CaseStudy.update(params[:id],case_study_params)
        format.html { redirect_to case_study_url(:id => params[:id]), notice: 'Case study was successfully updated.' }
        format.json { render :show, status: :ok, location: @case_study }
      else
        format.html { render :edit }
        format.json { render json: @case_study.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /case_studies/1
  # DELETE /case_studies/1.json
  def destroy
    CaseStudy.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to case_studies_url, notice: 'Case study was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_case_study
      @case_study = CaseStudy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def case_study_params
      params.require(:case_study).permit(:user_id, :placement_event_id, :project_name, :project_desc, :project_type_id, :project_type_other, :country, :region, :county, :city, :district_id, :saga_id, :survey_status_id, :survey_create_date, :survey_update_date, :project_area, :project_area_uom_id, :case_study_pk, :integer)
    end
end
