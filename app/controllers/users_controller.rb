class UsersController < ApplicationController

  get '/login' do
    redirect_authenticated
    erb :'users/login'
  end

  get '/register' do
    redirect_authenticated
    @user = User.new
    erb :'users/register'
  end

  post '/login' do
    if params.values.any? { |val| val == '' }
      erb :'users/login', locals: { errors: ['Debes ingresar todos los campos del formulario.'] }
    end
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to 'articles'
    else
      erb :'users/login', locals: { errors: ['Usuario o contraseña incorrectos.'] }
    end
  end

  post '/register' do
    @user = User.new(name: params[:name], email: params[:email], username: params[:username], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect to '/articles'
    else
      erb :'users/register', locals: {errors: @user.errors.full_messages}
    end
  end

  get '/logout' do
    unless session[:user_id].nil?
      session.destroy
      redirect to '/'
    else
      redirect to '/login'
    end
  end

end
