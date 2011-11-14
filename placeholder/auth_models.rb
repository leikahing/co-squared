require 'data_mapper'

class User
  include DataMapper::Resource

  property :id,               Serial
  property :username,         String, :required => true
  property :email,            String, :required => true
  property :first_name,       String
  property :last_name,        String
  property :password,         BCryptHash
  property :password_expired, Boolean
  property :last_login,       EpochTime
  property :active,           Boolean, :default => true

  has n, :roles, :through => Resource
end

class Role
  include DataMapper::Resource

  property :id,           Serial
  property :role_id,      Integer, :required => true
  property :name,         String, :required => true
  property :description,  String

  has n, :users, :through => Resource
end

