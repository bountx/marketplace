Rails.application.routes.draw do
  get 'profiles/show'
  devise_for :users
  resources :categories
  resources :products do
    resources :reviews
  end
  resources :carts do
    member do
      delete :clear
    end
  end
  resources :cart_items
  resources :profiles, only: [:show,:edit,:update]

  get '/app/javascripts/carousel.js', to: redirect('/app/javascripts/carousel.js')


  root to: 'products#index'
end
