Rails.application.routes.draw do
  resources :taste_testers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/desserts/:id', to: 'desserts#show'
  resources :desserts
  root "desserts#index"
end
