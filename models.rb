#!/usr/bin/env ruby

require 'data_mapper'


class Post
  include DataMapper::Resource

  property :id,         Serial
  property :title,      String, :required => true
  property :body,       Text, :required => true
  property :summary,    Text
  property :created_at,  EpochTime
  property :guid,       UUID

  has n, :comments
  has n, :tags
  belongs_to :user
end

class Comment
  include DataMapper::Resource

  property :id,   Serial
  property :author, String
  property :comment, Text
  property :guid, UUID

  belongs_to :post
  belongs_to :user
end

class Tag
  include DataMapper::Resource

  property :id,   Serial
  property :name, String, :required => true
  property :description, Text
end

class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String, :required => true
  property :email, String, :required => true
  property :first_name, String
  property :last_name, String
  property :password, BCryptHash
  property :password_expired, Boolean
  property :last_login, EpochTime
  property :active, Boolean, :default => true
  property :guid, UUID

  has n, :roles, :through => Resource
end

class Role
  include DataMapper::Resource

  property :id, Serial
  property :role_id, Integer, :required => true
  property :guid, UUID
  property :name, String, :required => true

  has n, :users, :through => Resource
end

DataMapper.setup(:default, "sqlite://#{Dir.pwd}/test.db")
DataMapper.finalize
DataMapper.auto_upgrade!
DataMapper.auto_migrate!
