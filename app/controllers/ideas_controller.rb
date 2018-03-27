require 'rack-flash'

class IdeasController < ApplicationController

use Rack::Flash


  get '/ideas' do
    if logged_in?
      erb :'ideas/index'
    else
      redirect '/'
    end
  end

  get '/ideas/new' do
    if logged_in?
      erb :'ideas/new'
    else
      redirect '/login'
    end
  end

  post '/ideas' do
    @idea = current_user.ideas.build(content: params[:idea].strip)


    params[:category].values.each do |v|
      @category = Category.find_or_create_by(name: v.strip) unless v.empty?
    end
    @idea.category = @category
    if @idea.valid? && @category.valid?
      @idea.save
      redirect '/ideas'
    else
      if @idea.errors.any?
        flash[:notice] = @idea.errors.full_messages
      else
        flash[:notice] = @category.errors.full_messages.map{|c| "Category: " << c}
      end
      redirect '/ideas/new'
    end
  end

  get '/ideas/:id' do
    @idea = Idea.find_by(id: params[:id])
    erb :'ideas/show'
  end

  get '/ideas/:id/edit' do
    if logged_in?
      @idea = Idea.find_by(id: params[:id])
      if !!@idea && @idea.user == current_user
        erb :'ideas/edit'
      else
        flash[:notice] = "Can Only edit your own Ideas"
        redirect "/ideas/#{@idea.id}"
      end
    else
      redirect '/login'
    end
  end

  patch '/ideas/:id' do
    @idea = Idea.find_by(id: params[:id])
    if params[:category][:new].empty? && !params[:category][:id]
      flash[:notice] = "Must add 1 Category"
      redirect "/ideas/#{@idea.id}/edit"
    elsif params[:category][:new].empty?
      category = Category.find_by(id: params[:category][:id])
    else
      category = Category.find_or_create_by(name: params[:category][:new])
    end
    @idea.update(content: params[:idea], category: category)
    redirect "/ideas/#{@idea.id}"
  end

  delete '/ideas/:id/delete' do
    @idea = Idea.find_by(id: params[:id])
    if logged_in? && @idea.user == current_user
      @idea.delete
      redirect "/users/#{current_user.slug}"
    else
      flash[:notice] = "Can Only Delete your own Ideas"
      redirect "/ideas/#{@idea.id}"
    end
  end


end
