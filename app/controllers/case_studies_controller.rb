class CaseStudiesController < ApplicationController
  before_action :set_case_study, only: [:show, :edit, :update, :destroy]

  # GET /case_studies
  # GET /case_studies.json
  def index
    @case_studies = CaseStudy.all
    respond_to do |format|
      format.html { }
      format.csv { send_data @case_studies.to_csv }
    end
  end

  # GET /case_studies/1
  # GET /case_studies/1.json
  def show
  end

  # GET /case_studies/new
  def new
    @case_study = CaseStudy.new
    @user = User.all
  end

  # GET /case_studies/1/edit
  def edit
  end

  # POST /case_studies
  # POST /case_studies.json
  def create
    @case_study = CaseStudy.new(case_study_params)
    @case_study.user = current_user

    respond_to do |format|
      if @case_study.save
        format.html { redirect_to @case_study, notice: 'Case study was successfully created.' }
        format.json { render :show, status: :created, location: @case_study }
      else
        format.html { render :new }
        format.json { render json: @case_study.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /case_studies/1
  # PATCH/PUT /case_studies/1.json
  def update
    respond_to do |format|
      if @case_study.update(case_study_params)
        format.html { redirect_to @case_study, notice: 'Case study was successfully updated.' }
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
    @case_study.destroy
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
      params.require(:case_study).permit(:user_id, :placement_event_id, :project_name, :project_desc, :project_type_id, :project_type_other, :country, :region, :county, :city, :district_id, :saga_id, :survey_status_id, :survey_create_date, :survey_update_date, :project_area, :project_area_uom_id, :case_study_pk, :integer, :editor_ids => [], :author_ids => [], :photos_attributes => [:id, :image, :_destroy] , :documents_attributes => [:id, :doc, :_destroy], :videos_attributes => [:id, :link, :title, :description, :tags, :_destroy])
    end
end
