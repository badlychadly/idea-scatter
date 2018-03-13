class CategoriesController < ApplicationController


  get '/categories' do
    erb :'categories/index'
  end


  get '/categories/new' do
    erb :'categories/new'
  end

  post '/categories' do
    binding.pry
    if !params[:categories][:category_ids].empty?
      @categories = params[:categories][:category_ids].map do |category|
      Category.find_by(id: category)
      end
    end
    if !params[:categories][:new].empty?
      params[:categories][:new].each do |category|
        @categories << Category.create(name: category)
      end
    end
    if !params[:item][:names].empty?
      params[:item][:names].each do |name|
        obj = Item.find_by(name: name)
        @categories.each do |category|
          category.category_ideas.create(item: obj)
        end
      end
    end
  end


end
