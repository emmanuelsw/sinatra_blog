class UsersController < ApplicationController

  get '/login' do
    erb :'users/login'
  end

  get '/register' do
    @user = User.new
    erb :'users/register'
  end

  post '/login' do
    "Bien hecho! #{params[:username]}, #{params[:password]} "
  end

  post '/register' do
    @user = User.new(name: params[:name], email: params[:email], username: params[:username], password: params[:password])
    if @user.save
      redirect to '/articles'
    else
      erb :'users/register', locals: {errors: @user.errors.full_messages}
    end
  end

end
