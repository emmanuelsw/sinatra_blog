class User < ActiveRecord::Base

  validates_presence_of :name, :email, :username
  validates :email, uniqueness: true
  validates :username, uniqueness: true
  has_secure_password

  has_many :articles
end
