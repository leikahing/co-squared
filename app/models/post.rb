class Post
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :title, String
  property :body, Text
  property :slug, Slug
  property :created_at, DateTime
  property :updated_at, DateTime
end
