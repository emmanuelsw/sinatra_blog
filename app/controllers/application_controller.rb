class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'blog_secret_session'
  end

  configure :development do
    register Sinatra::Reloader
  end

  helpers do

    def redirect_authenticated
      redirect to '/articles' if signed_in?
    end

    def render_view url
      if signed_in?
        erb url
      else
        erb :'users/login', locals: {errors: ['Debes iniciar sesión para acceder a este recurso.']}
      end
    end

    def signed_in?
      !!session[:user_id]
    end
  end

  get '/' do
    erb :welcome
  end

end
