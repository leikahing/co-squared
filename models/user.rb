require 'dm-types'

class User
  include DataMapper::Resource
  include DataMapper::Validate

  attr_accessor :password

  # property <name>, <type>
  property :id, Serial
  property :username, String
  property :email, String
  property :first_name, String
  property :surname, String
  property :password, BCryptHash
  property :last_login, DateTime

  validates_presence_of :email
  validates_presence_of :password, :if => :password_required
  validates_uniqueness_of :email, :case_sensitive => false
  validates_format_of :email, :with => :email_address

  def self.authenticate(username, password)
    user = first(:conditions => { :username => username}) if username.present?
    user && user.has_password?(password) ? user : nil
  end
end
