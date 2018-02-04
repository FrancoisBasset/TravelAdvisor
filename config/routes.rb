Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'countries#index'
  resources :countries do
    get '/deletecountry', on: :collection, to: 'countries#deletecountry', as: :deletecountry
  end
  resources :cities
end
