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
    if !params[:idea].empty?
      category = Category.create(name: params[:category][:new]) unless params[:category][:new].empty?

      category = Category.find_or_create_by(name: params[:category][:name]) if params[:category][:new].empty?
      if category.save
        current_user.ideas.create(content: params[:idea], category: category)
        redirect '/ideas'
      end
    else
      # flash[:message] = "Must fill out all fields"
      redirect '/ideas/new'
    end
  end

  get '/ideas/:id' do
    @idea = Idea.find_by(id: params[:id])
    erb :'ideas/show'
  end

  get '/ideas/edit/:id' do
    if logged_in?
      @idea = Idea.find_by(id: params[:id])
      if !!@idea && @idea.user == current_user
      erb :'ideas/edit'
    else
      redirect "/ideas/#{@idea.id}"
    end
    else
      redirect '/login'
    end
  end


end
