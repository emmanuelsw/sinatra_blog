class Article < ActiveRecord::Base
  validates_presence_of :title, :body, :user_id
  belongs_to :user


  def created_date
    created_at.strftime('%d/%m/%Y')
  end
end
