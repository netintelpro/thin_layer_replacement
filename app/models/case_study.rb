class CaseStudy < ActiveRecord::Base
  serialize :editor_ids, Array
  serialize :author_ids, Array
  belongs_to :user

  has_many :photos
  accepts_nested_attributes_for :photos, allow_destroy: true, :reject_if => proc { |photo| photo['image'].blank? }

  has_many :documents
  accepts_nested_attributes_for :documents, allow_destroy: true, :reject_if => proc { |document| document['doc'].blank? }

  has_many :videos
  accepts_nested_attributes_for :videos, allow_destroy: true, :reject_if => proc { |video| video['link'].blank?  }

  def editors
    User.where(:id => self.editor_ids)
  end

  def authors
    User.where(:id => self.author_ids)
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end

end
