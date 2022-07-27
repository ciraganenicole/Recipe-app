# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :recipes, except: [:update]
  
  get '/public_recipes', to: 'recipes#public_recipes', as: 'public_recipes'
end
