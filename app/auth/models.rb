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
  property :guid,             UUID

  has n, :roles, :through => Resource
end

class Role
  include DataMapper::Resource

  property :id,       Serial
  property :role_id,  Integer, :required => true
  property :guid,     UUID
  property :name,     String, :required => true

  has n, :users, :through => Resource
end

