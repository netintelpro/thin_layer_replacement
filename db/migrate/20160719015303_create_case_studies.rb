class CreateCaseStudies < ActiveRecord::Migration
  def change
    create_table :case_studies do |t|
      t.integer :user_id
      t.string :placement_event_id
      t.string :project_name
      t.text :project_desc
      t.integer :project_type_id
      t.string :project_type_other
      t.string :country
      t.string :region
      t.string :county
      t.string :city
      t.integer :district_id
      t.integer :saga_id
      t.integer :survey_status_id
      t.date :survey_create_date
      t.date :survey_update_date
      t.integer :project_area
      t.integer :project_area_uom_id
      t.string :case_study_pk
      t.string :integer

      t.timestamps null: false
    end
  end
end
