
class UsersController < ApplicationController


  get '/signup' do
    if !logged_in?
      erb :'users/signup'
    else
      redirect '/ideas'
    end
  end

  post '/signup' do
    params[:username].strip!
    @user = User.create(params)
    if @user.save
      session[:user_id] = @user.id
      redirect '/ideas'
    else
      flash[:notice] = @user.errors.full_messages
      redirect '/signup'
    end
  end


  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect '/ideas'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if !!@user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/ideas'
    else
      flash[:notice] = "Check input fields"
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end




end
