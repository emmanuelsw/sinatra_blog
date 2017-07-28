class ArticlesController < ApplicationController

  get '/articles' do
    render_view :'articles/index'
  end

end
