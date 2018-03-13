class IdeasController < ApplicationController



get '/ideas' do
  erb :'ideas/index'
end

end
