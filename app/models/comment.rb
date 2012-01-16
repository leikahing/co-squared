class Comment
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :author, String
  property :comment, Text
end
