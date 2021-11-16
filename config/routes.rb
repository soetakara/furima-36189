Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :items
  ## itemに対して、購入ページがつくため、子のコントローラになる？
  resources :order , only: [:index, :create]
end
