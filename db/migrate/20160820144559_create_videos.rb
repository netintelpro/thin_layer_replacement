class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :case_study_id
      t.string :title
      t.text :link
      t.text :description
      t.text :tags

      t.timestamps null: false
    end
  end
end
