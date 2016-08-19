class AddEditorAndAuthorIdsToCaseStudies < ActiveRecord::Migration
  def change
    add_column :case_studies, :editor_ids, :string
    add_column :case_studies, :author_ids, :string
  end
end
