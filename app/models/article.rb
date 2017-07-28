class Article < ActiveRecord::Base
  validates_presence_of :title, :body, :user_id
  belongs_to :user


  def created_date
    created_at.strftime('%d/%m/%Y')
  end

  def body_formatted
    if body[-1] == '.' and body.length <= 480
      body.slice(0..480).concat('..')
    else
      body.slice(0..480).concat('...')
    end
  end
end
