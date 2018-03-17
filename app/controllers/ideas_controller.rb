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
    if params[:idea].empty? || params[:category].all? do |k, v|
      binding.pry
        v.empty?
      end
      # flash[:message] = "Must fill out all fields"
      redirect '/ideas/new'
    else
      category = Category.create(name: params[:category][:new]) unless params[:category][:new].empty?

      category = Category.find_or_create_by(name: params[:category][:name]) if params[:category][:new].empty?
      if category.save
        current_user.ideas.create(content: params[:idea], category: category)
        redirect '/ideas'
      end
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

  patch '/ideas/:id' do
    @idea = Idea.find_by(id: params[:id])
    if params[:category][:new].empty?
      category = Category.find_by(id: params[:category][:id])
    else
      category = Category.find_or_create_by(name: params[:category][:new])
    end
    @idea.update(content: params[:content], category: category)
    redirect "/ideas/#{@idea.id}"
  end

  delete '/ideas/:id/delete' do
    @idea = Idea.find_by(id: params[:id])
    if logged_in? && @idea.user == current_user
      @idea.delete
      redirect "/users/#{current_user.slug}"
    else
      # flash[:message] = "Can Only Delete your own Ideas"
      redirect "/ideas/#{@idea.id}"
    end
  end


end
