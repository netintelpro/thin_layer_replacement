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

  attr_accessor :email
  attr_reader :email

  def email=(email_address)
    new_user = User.find_by_email(email_address)
    self.user = new_user || User.new(:email => email_address, :password => '12345678', :password_confirmation => '12345678')
  end

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

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      case_study = find_by_id(row["id"]) || new
      case_study.attributes = row #row.to_hash.slice(*accessible_attributes)
      case_study.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path, csv_options: {encoding: "iso-8859-1:utf-8"})
      when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

end
