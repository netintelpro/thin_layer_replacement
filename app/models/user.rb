class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  mount_uploader :avatar, PhotoUploader

  has_many :case_studies

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.find_for_linkedin_oauth(access_token, signed_in_resource=nil)
    data = access_token.info
    if user = User.find_by_email(data["email"])
    else
      user = User.new(email: data["email"], :name => data["name"])
      user.remote_avatar_url = data["image"]
      user.password = SecureRandom.base64(5)
      user.password_confirmation = user.password

      user.headline = data["headline"]
      user.description = data["description"]
      user.phone = data["phone"]
      user.location = data["location"]
      user.industry = data["industry"]
      user.public_profile = data.urls.public_profile rescue nil

      user.save(:validate => false)
    end
    return user
  end
end
