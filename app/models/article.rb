class Article < ActiveRecord::Base
  validates_presence_of :title, :body, :user_id
  belongs_to :user
end
