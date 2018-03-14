class CategoriesController < ApplicationController


  get '/categories' do
    erb :'categories/index'
  end


  get '/categories/new' do
    erb :'categories/new'
  end

  post '/categories' do
    @categories = []
    if !params[:categories].all?{|c| c.empty?}
      params[:categories].map do |name|
        category = Category.find_or_create_by(name: name)
         if category.save
           @categories << category
         end
      end
        current_user.categories = @categories

    else
      redirect '/categories'
    end
    @items = []
    if !params[:items].all?{|i| i.empty?}
      params[:items].map do |name|
        item = Item.find_or_create_by(name: name)
        if item.save
          @items << item
        # current_user.category_ideas.create(item: item)
        end
      end
      current_user.items = @items
    end

    #   current_user.categories.each do |cat|
    #     cat.ideas.each do |idea|
    #       cat.category_ideas.each do |ci|
    #         binding.pry
    #     end
    #   end
    # end


    # current_user.categories.each do |category|
    #   category.items = @items
    # end
    # binding.pry
  end


end
