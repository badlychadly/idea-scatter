class CategoriesController < ApplicationController


  get '/categories' do
    erb :'categories/index'
  end


  get '/categories/new' do
    erb :'categories/new'
  end

  post '/categories' do

    if !params[:categories].all?{|c| c.empty?} && !params[:items].all?{|i| i.empty?}
      @categories = []
      @items = []
      params[:categories].each do |name|
        category = Category.find_or_create_by(name: name)
        @categories << category if category.save
        params[:items].each do |item_name|

          item = Item.find_or_create_by(name: item_name)
          @items << item if item.save
          current_user.category_ideas.create(category: category, item: item)
        end
      end
      current_user.categories = @categories
      current_user.items = @items
    else
      ridirect '/categories'
    end
    redirect '/users/categories'

  end


end
