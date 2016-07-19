json.array!(@case_studies) do |case_study|
  json.extract! case_study, :id, :user_id, :placement_event_id, :project_name, :project_desc, :project_type_id, :project_type_other, :country, :region, :county, :city, :district_id, :saga_id, :survey_status_id, :survey_create_date, :survey_update_date, :project_area, :project_area_uom_id, :case_study_pk, :integer
  json.url case_study_url(case_study, format: :json)
end
