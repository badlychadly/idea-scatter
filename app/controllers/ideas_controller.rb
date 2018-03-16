class IdeasController < ApplicationController



  get '/ideas' do
    erb :'ideas/index'
  end

  get '/ideas/new' do
    if logged_in?
      erb :'ideas/new'
    else
      redirect '/login'
    end
  end

  post '/ideas' do
    if !params[:idea].empty? && params[:category].size == 1
      binding.pry
      category = Category.find_or_create_by(name: params[:category][:name])
      if category.save
        current_user.ideas.find_or_create_by(content: params[:idea], category: category)
        redirect '/ideas'
      end
    else
      # flash[:message] = "Must fill out all fields"
      redirect '/ideas/new'
    end
  end


end
