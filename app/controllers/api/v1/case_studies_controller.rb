class Api::V1::CaseStudiesController < Api::BaseController

  def index
    @case_studies = CaseStudy.all
  end

  def show
    @case_study = CaseStudy.find params[:id]
  end
end