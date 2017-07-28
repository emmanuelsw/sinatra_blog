class ArticlesController < ApplicationController

  get '/articles' do
    @articles = Article.all
    render_view :'articles/index'
  end

  get '/articles/new' do
    @article = Article.new
    render_view :'articles/new'
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    render_view :'articles/show'
  end

 post '/articles' do
   redirect_unauthenticated
   @article = Article.new(title: params[:title], body: params[:body], user_id: current_user.id)
   if @article.save
     redirect to "/articles/#{@article.id}"
   else
     erb :'articles/new', locals: {errors: @article.errors.full_messages}
   end
 end


end
