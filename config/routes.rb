Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root to: redirect("recipes#index"), as: :authenticated_root
  end
  unauthenticated do
    root to: redirect("/public_recipes"), as: :unauthenticated_root
  end

  match "/public_recipes", to: "recipes#index", via: :get

  resources :recipe_foods
  resources :recipes
  resources :foods
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
