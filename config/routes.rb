Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated do
      root to: "foods#index"
    end

    unauthenticated do
      root to: "devise/sessions#new", as: "unauthenticated_root"
    end
    get "/users/sign_out" => "devise/sessions#destroy"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :new, :create, :destroy, :show] do
    resources :recipe_foods, only: [:new, :edit, :create, :destroy, :update]
  end
  resources :public, only: [:index]
  resources :general, only: [:index]
end
