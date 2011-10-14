require 'data_mapper'

class Post
  include DataMapper::Resource

  property :id,         Serial
  property :title,      String, :required => true
  property :body,       Text, :required => true
  property :summary,    Text
  property :created_at, EpochTime
  property :guid,       UUID

  has n, :comments
  has n, :tags
  belongs_to :user
end

class Comment
  include DataMapper::Resource

  property :id,       Serial
  property :author,   String
  property :comment,  Text
  property :guid,     UUID

  belongs_to :post
  belongs_to :user
end

class Tag
  include DataMapper::Resource

  property :id,           Serial
  property :name,         String, :required => true
  property :description,  Text
end

