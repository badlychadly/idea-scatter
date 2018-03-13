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

  # post '/ideas' do
  #   params[:category_ids].map do |id|
  #     Category.find_by(id: id).items
  #   end
  # end


end
