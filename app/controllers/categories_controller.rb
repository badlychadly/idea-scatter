class CategoriesController < ApplicationController


  get '/categories' do
    erb :'categories/index'
  end


  get '/categories/:id' do
    @category = Category.find_by(id: params[:id])
    erb :'categories/show'
  end


end
