class CategoriesController < ApplicationController


  get '/categories' do
    erb :'categories/index'
  end


  get '/categories/new' do
    erb :'categories/new'
  end

  post '/categories' do

    if !params[:categories].all?{|c| c.empty?} && !params[:items].all?{|i| i.empty?}
      params[:categories].each do |name|
        category = Category.find_or_create_by(name: name)
        params[:items].each do |item_name|
          item = Item.find_or_create_by(name: item_name)
          current_user.category_ideas.create(category: category, item: item)
        end
      end
    else
      ridirect '/categories'
    end
    redirect '/users/categories'


    # @categories = []
    # if !params[:categories].all?{|c| c.empty?}
    #   params[:categories].map do |name|
    #     category = Category.find_or_create_by(name: name)
    #      if category.save
    #        current_user.categories << category
    #        binding.pry
    #      end
    #   end
    #     current_user.categories = @categories
    # else
    #   redirect '/categories'
    # end
    # @items = []
    # if !params[:items].all?{|i| i.empty?}
    #   params[:items].map do |name|
    #     item = Item.find_or_create_by(name: name)
    #     if item.save
    #       @items << item
    #     # current_user.category_ideas.create(item: item)
    #     end
    #   end
    #   current_user.items = @items
    # end
  end


end
