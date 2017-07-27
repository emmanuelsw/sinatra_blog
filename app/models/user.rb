class User < ActiveRecord::Base

  validates_presence_of :name, :email, :username
  has_secure_password

end
