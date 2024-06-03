Rails.application.routes.draw do
  get 'profiles/show'
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :categories
  resources :products do
    resources :reviews
  end
  resources :carts
  resources :cart_items
  resources :profiles, only: [:show]

  root to: 'products#index'
end
