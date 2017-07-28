class ArticlesController < ApplicationController

  get '/articles' do
    @articles = Article.all
    render_view :'articles/index'
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    render_view :'articles/show'
  end

end
