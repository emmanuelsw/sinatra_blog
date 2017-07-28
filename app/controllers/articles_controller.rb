class ArticlesController < ApplicationController

  get '/articles' do
    @articles = Article.all
    render_view :'articles/index'
  end

end
