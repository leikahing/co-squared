class Blog
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :name, String
  property :slug, String
end
