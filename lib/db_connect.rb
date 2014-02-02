require 'active_record'
require 'pg'
require 'protected_attributes'
require 'friendly_id'

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

class Haiku < ActiveRecord::Base
  extend FriendlyId
  friendly_id :body, :use => :slugged

  attr_accessible :tweet_id, :author, :body, :posted_at

  validates :tweet_id, :presence => true, :uniqueness => true
  validates :author, :body, :posted_at, :presence => true
end
