Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "malontines#index"
  # TODO: ADD SHOW ROUTE WHEN READY FOR SCREENCAP CHALLENGE
  resources :malontines
end
