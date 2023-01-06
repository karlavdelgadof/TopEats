Rails.application.routes.draw do
  get 'couriers/index'
  get 'couriers/show'
  get 'couriers/create'
  get 'couriers/update'
  get 'couriers/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
