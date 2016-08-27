class MapsController < ApplicationController

  def index
    @case_studies = CaseStudy.all
    @map_view_case_study = @case_studies.first
    render :layout => true
  end


end
