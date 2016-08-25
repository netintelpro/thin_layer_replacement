json.case_studies do
  json.array! @case_studies do |case_study|
    json.partial! '/api/v1/case_studies/case_study', case_study: case_study
  end
end