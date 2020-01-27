require './config/environment'

class MalonesController < Sinatra::Base
  require './config/environment'

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/malones' do
    @malones = Malone.all
    erb :'/malones/index'
  end

end
