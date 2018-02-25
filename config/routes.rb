Rails.application.routes.draw do
  resources :restaurant_opinions
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
  resources :hotels
  resources :activities
  resources :restaurant_opinions do
    get '/create/:id', on: :collection, to: 'restaurant_opinions#create', as: :create
    get '/new/:id', on: :collection, to: 'restaurant_opinions#new', as: :new
  end
  resources :hotel_opinions do
    get '/create/:id', on: :collection, to: 'hotel_opinions#create', as: :create
    get '/new/:id', on: :collection, to: 'hotel_opinions#new', as: :new
  end
  resources :activity_opinions do
    get '/create/:id', on: :collection, to: 'activity_opinions#create', as: :create
    get '/new/:id', on: :collection, to: 'activity_opinions#new', as: :new
  end
end
