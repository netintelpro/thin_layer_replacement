class Api::V1::CaseStudiesController < Api::BaseController

  swagger_controller :case_studies, 'CaseStudies'

  swagger_api :index do
    summary 'Returns all case studies'
    notes 'Response is in Array'
  end

  swagger_api :show do
    summary "Fetches a single Case Study"
    param :path, :id, :integer, :required, "Case Study ID"
    response :ok, "Success", :CaseStudy
    response :not_found
  end

  def index
    @case_studies = CaseStudy.all
  end

  def show
    @case_study = CaseStudy.find params[:id]
  end
end