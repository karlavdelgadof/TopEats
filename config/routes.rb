Rails.application.routes.draw do
  resources :couriers, :customers do
    resources :orders do
      resources :menu_items
    end
    resources :vehicles
  end

  resources :addresses



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
