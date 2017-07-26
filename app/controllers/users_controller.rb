class UsersController < ApplicationController

  get '/login' do
    erb :'users/login'
  end

  get '/register' do
    erb :'users/register'
  end

  post '/login' do
    "Bien hecho! #{params[:username]}, #{params[:password]} "
  end

end
