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
      get :save
    end
  end

  resources :cart_items
  resources :profiles, only: [:show,:edit,:update]
  resources :checkouts, only: [:show, :create] do
    member do
      patch :finalize
      patch :cancel
    end
  end

  resource :wishlist, only: [:show] do
    post 'add_product/:product_id', to: 'wishlists#add_product', as: 'add_product'
    delete :clear
    get :save
    delete 'remove_product/:product_id', to: 'wishlists#remove_product', as: 'remove_product'
  end

  get '/app/javascripts/carousel.js', to: redirect('/app/javascripts/carousel.js')


  root to: 'products#index'
end
