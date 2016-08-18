require "#{BASE_PATH}/app/uploaders/image_uploader"

class CaseStudy < Base
  include ActiveModel::Model
  extend CarrierWave::Mount
  mount_uploader :image, ImageUploader

  attr_accessor :id, :user_id, :placement_event_id, :project_name, :project_desc, :project_type_id, :project_type_other, :country, :region, :county, :city, :district_id, :saga_id, :survey_status_id, :survey_create_date, :survey_update_date, :project_area, :project_area_uom_id, :case_study_pk, :integer

  def initialize(case_study_hash={})
    self.user_id = case_study_hash[:user_id]
    self.placement_event_id = case_study_hash[:placement_event_id]
    self.project_name = case_study_hash[:project_name]
    self.project_desc = case_study_hash[:project_desc]
    self.project_type_id = case_study_hash[:project_type_id]
    self.project_type_other = case_study_hash[:project_type_other]
    self.country = case_study_hash[:country]
    self.region = case_study_hash[:region]
    self.county = case_study_hash[:county]
    self.city = case_study_hash[:city]
    self.district_id = case_study_hash[:district_id]
    self.saga_id = case_study_hash[:saga_id]
    self.survey_status_id = case_study_hash[:survey_status_id]
    self.survey_create_date = case_study_hash[:survey_create_date]
    self.survey_update_date = case_study_hash[:survey_update_date]
    self.project_area = case_study_hash[:project_area]
    self.project_area_uom_id = case_study_hash[:project_area_uom_id]
    self.case_study_pk = case_study_hash[:case_study_pk]
    self.integer = case_study_hash[:integer]
    self.id = case_study_hash[:id]
  end

  def upload_photos(photos)
    photos.compact.each do |photo|
      if photo
        self.image = File.open(photo.path)
        self.store_image!
      end
    end
  end

  def self.save(case_study_hash={})
    case_study_hash_data = CaseStudy.all
    case_study_hash[:id] = case_study_hash_data.collect{|data| data[:id].to_i}.compact.max.to_i + 1

    case_study_hash_data = case_study_hash_data + [case_study_hash]

    write_in_yml(case_study_hash_data)
    return CaseStudy.new(case_study_hash)
  end

  def self.find(id)
    hashes = all
    found = nil
    hashes.each do |hash|
      if hash[:id].to_i == id.to_i
        found = CaseStudy.new(hash)
        break
      end
    end
    found
  end

  def self.update(id, case_study_hash)
    hashes = all
    new_hashes = []
    hashes.each do |hash|
      if hash[:id].to_i == id.to_i
        hash = case_study_hash.merge!(:id => id.to_s)
      end
      new_hashes = new_hashes +[hash]
    end
    write_in_yml(new_hashes)
    true
  end

  def self.destroy(id)
    case_studies = all
    case_studies.reject! {|case_study| case_study[:id].to_i == id.to_i }
    write_in_yml(case_studies)
    true
  end

  def self.all
    YAML::load(File.open(CASE_STUDY_DATA_PATH)) || []
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << CaseStudy.new.attributes.keys
      all.each do |case_study|
        csv << case_study.values
      end
    end
  end

  private
  def self.write_in_yml(hash)
    File.open(CASE_STUDY_DATA_PATH, "w") do |file|
      file.write hash.compact.to_yaml
    end
  end


end
