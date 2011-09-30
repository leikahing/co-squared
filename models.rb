#!/usr/bin/env ruby

require 'data_mapper'


class Post
  include DataMapper::Resource

  property :id,         Serial
  property :title,      String, :required => true
  property :body,       Text, :required => true
  property :summary,    Text
  property :createdAt,  EpochTime
  property :guid,       UUID

  has n, :comments
  has n, :tags
  belongs_to :user
end

class Comment
  include DataMapper::Resource

  property :id,   Serial
  property :postAuthor, String
  property :comment, Text
  property :guid, UUID

  belongs_to :post
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
  property :userName, String, :required => true
  property :email, String, :required => true
  property :firstName, String
  property :lastName, String
  property :password, BCryptHash
  property :lastLogin, EpochTime
  property :active, Boolean, :default => true
  property :guid, UUID

  has n, :roles, :through => Resource
end

class Role
  include DataMapper::Resource

  property :id, Serial
  property :roleId, Integer, :required => true
  property :guid, UUID
  property :name, String, :required => true

  has n, :users, :through => Resource
end

#DataMapper.setup(:default, 'sqlite://{Dir.pwd}/test.db')
DataMapper.setup(:default, "sqlite::memory:")
DataMapper.finalize
DataMapper.auto_upgrade!
DataMapper.auto_migrate!
#User.auto_migrate!
#Role.auto_migrate!
