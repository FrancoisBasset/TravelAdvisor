Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'countries#index'
  resources :countries do
    get '/deletecountry', on: :collection, to: 'countries#deletecountry', as: :deletecountry
    get '/deletecity/:id', on: :collection, to: 'countries#deletecity', as: :deletecity
    get '/modifycity/:id', on: :collection, to: 'countries#modifycity', as: :modifycity
  end
  resources :cities do
    get '/create/:id', on: :collection, to: 'cities#create', as: :create
    get '/new/:id', on: :collection, to: 'cities#new', as: :new
  end
  resources :restaurants
end
