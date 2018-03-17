class CategoriesController < ApplicationController


  get '/categories' do
    erb :'categories/index'
  end

  get '/categories/new' do
    if logged_in?
      erb :'categories/new'
    else
      redirect '/loggin'
    end
  end

  post '/categories' do
    Category.find_or_create_by(params)
    redirect '/categories'
  end


  get '/categories/:id' do
    @category = Category.find_by(id: params[:id])
    erb :'categories/show'
  end




end
