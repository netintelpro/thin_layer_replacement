json.id                      case_study.id
json.project_name            case_study.project_name

json.owner do
  json.id                    case_study.user.id
  json.name                  case_study.user.name
  json.email                 case_study.user.email
end

json.placement_event_id      case_study.placement_event_id
json.project_desc            case_study.project_desc
json.project_type_id         case_study.project_type_id
json.project_type_other      case_study.project_type_other
json.country                 case_study.country
json.region                  case_study.region
json.city                    case_study.city
json.district_id             case_study.district_id
json.saga_id                 case_study.saga_id
json.survey_status_id        case_study.survey_status_id
json.survey_create_date      case_study.survey_create_date
json.survey_update_date      case_study.survey_update_date
json.project_area            case_study.project_area
json.project_area_uom_id     case_study.project_area_uom_id
json.case_study_pk           case_study.case_study_pk
json.created_at              case_study.created_at
json.updated_at              case_study.updated_at

json.editors do
  json.array! case_study.editors do |user|
    json.id           user.id
    json.name         user.name
    json.email        user.email
  end
end

json.authors do
  json.array! case_study.authors do |user|
    json.id           user.id
    json.name         user.name
    json.email        user.email
  end
end