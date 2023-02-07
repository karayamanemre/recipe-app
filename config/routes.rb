Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root to: redirect("recipes#index"), as: :authenticated_root
  end
  unauthenticated do
    root to: redirect("/public_recipes"), as: :unauthenticated_root
  end

  match "/public_recipes", to: "recipes#index", via: :get

  resources :recipes do
    resources :recipe_foods
  end
  resources :foods
  resources :users
end
