class SnailsController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/snails/?" do
    @snails = Snail.all
    erb :'snails/index'
  end

  get "/snails/:id" do
    @secret = params[:secret]
    @snail = Snail.find_by(id: params[:id])
    erb :'snails/show'
  end
end
