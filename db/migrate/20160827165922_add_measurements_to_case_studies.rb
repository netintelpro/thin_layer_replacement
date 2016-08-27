class AddMeasurementsToCaseStudies < ActiveRecord::Migration
  def change
    add_column :case_studies, :measurements, :text
  end
end
