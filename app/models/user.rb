class User < ActiveRecord::Base

  validates_presence_of :name, :email, :username

  validates :name, format: { with: /\A[[:alpha:]\s]+\z/,
    message: 'debe contener caracteres válidos' }

  validates :email, uniqueness: true, email: true

  validates :username, uniqueness: true,
    format: { with: /\A[[:alpha:]\d\_\-]+\z/,
    message: 'debe contener caracteres válidos' }

  validates :password, length: { minimum: 8 }

  has_secure_password
  has_many :articles
end
