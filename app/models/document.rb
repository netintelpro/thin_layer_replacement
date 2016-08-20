class Document < ActiveRecord::Base
  mount_uploader :doc, DocumentUploader

  belongs_to :case_study
end
