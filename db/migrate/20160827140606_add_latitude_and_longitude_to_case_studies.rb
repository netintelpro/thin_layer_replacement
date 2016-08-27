class AddLatitudeAndLongitudeToCaseStudies < ActiveRecord::Migration
  def change
    add_column :case_studies, :latitude, :string
    add_column :case_studies, :longitude, :string
  end
end
