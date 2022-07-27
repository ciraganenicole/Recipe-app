Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_scope :user do
    authenticated :user do
      root to: 'recipes#public_recipes'
    end
    unauthenticated :user do
      root to: 'devise/registrations#new', as: :unauthenticated_root
    end
  end

  resources :users, only: [:index, :show]
  resources :foods, only: [:index, :show, :new, :create, :destroy]
  resources :inventories, only: [:index, :show, :new, :create, :destroy]
  resources :recipes, except: [:update] do
    resources :recipe_foods, only: [:new, :create]
  end
  resources :shopping_lists, only: [:index]
  get '/public_recipes', to: 'recipes#public_recipes', as: 'public_recipes'

end
