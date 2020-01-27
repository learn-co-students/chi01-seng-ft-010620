require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end



  get "/user-input/:message/?" do
    p params
    "OMG #{params[:message]}"
  end

  get "/" do
    # binding.pry
    erb :welcome
  end


end
