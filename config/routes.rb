Rails.application.routes.draw do
  devise_for :users

  resources :foods, only: [:index, :show, :new, :create, :destroy]
  resources :inventories, only: [:index, :show, :new, :create, :destroy]
  resources :recipes, except: [:update] 
  resources :public_recipes, only: [:index, :show]
  resources :shopping_lists, only: [:index]
  root "public_recipes#index"
end
