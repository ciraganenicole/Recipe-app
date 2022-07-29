Rails.application.routes.draw do
  devise_for :users

  resources :foods, only: [:index, :show, :new, :create, :destroy]
  resources :inventories, only: [:index, :show, :new, :create, :destroy] do
    resources :inventory_foods, only: [:new, :create, :destroy]
  end
  resources :recipes, except: [:update] do
    resources :recipe_foods, only: [:new, :create, :destroy]
  end
  resources :public_recipes, only: [:index, :show]
  resources :shopping_lists, only: [:index]
  get '/recipes/:recipe_id/generate_shopping_lists', to: 'generate_shopping_lists#index', as: 'generate_shopping_lists'
  # resources :generate_shopping_lists, only: [:index]
  root "public_recipes#index"
end
