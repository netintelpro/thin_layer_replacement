require 'yaml'
require 'digest/sha1'

class User
  ROLES = {:user => :user, :vip => :vip, :admin => :admin}
  attr_accessor :id, :email, :password, :password_confirmation, :role, :created_at, :errors

  def initialize(user_hash={})
    self.email = user_hash[:email] if user_hash[:email].present?
    self.password = user_hash[:password] if user_hash[:password].present?
    self.errors = []
  end

  def attributes
    instance_variables.map do |var|
      [var[1..-1].to_sym, instance_variable_get(var)]
    end.to_h
  end

  def save(user_hash={})
      user_hash[:password] = Digest::SHA1.hexdigest(user_hash[:password])
      user_hash_data = YAML::load(File.open(USER_DATA_PATH))
      user_hash_data = [] unless user_hash_data

      if user_hash_data.collect{|user| user[:email]}.include?(user_hash[:email])
        self.errors << "Email has already been taken"
        return false
      end

      user_hash_data = user_hash_data + [user_hash]

      File.open(USER_DATA_PATH, "w") do |file|
        file.write user_hash_data.to_yaml
      end
      return true
  end

end
