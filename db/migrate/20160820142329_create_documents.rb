class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.integer :case_study_id
      t.string :doc

      t.timestamps null: false
    end
  end
end
