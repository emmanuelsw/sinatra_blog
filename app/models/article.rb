class Article < ActiveRecord::Base

  TITLE_REGEX = /\A[[:alpha:]\d\s\"\-\'\,\.\!\\¿\?\\¡]+\z/

  validates_presence_of :title, :body, :user_id

  validates :title, length: {in: 8..200},
    format: { with: TITLE_REGEX,
    message: 'debe contener caracteres válidos' }

  validates :body, length: {in: 200..4000}

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
