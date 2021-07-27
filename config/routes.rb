Rails.application.routes.draw do
   
  root to: "homes#lp"
  
  get "/homes/users", to: "homes#lp"
  get "/homes/shops", to: "homes#lp2"
    
    
    devise_for :users, controllers: { registraions: 'users/registrations', sessions: 'users/sessions',confirmations: 'users/confirmations' }
    devise_scope :user do
        get '/users/sign_out' => 'devise/sessions#destroy'
    end
    
    resources :users, only: [:new, :create]
    namespace :users do
        resources :shops do
            resources :items
        end
        resources :carts do
            resources :purchases
        end
        resources :cart_items
        resources :rooms do
            resources :messages
        end
    end
    
    devise_for :shops, controllers: {  registrations: 'shops/registrations', sessions: 'shops/sessions' }
    devise_scope :shop do
        get '/shops/sign_out' => 'devise/sessions#destroy'
    end
    
    get "myshop", to: "shops#show"
    namespace :shops do 
        resources :rooms, only: [:index, :show] do
            resources :messages, only: [:create]
        end
        resources :items
    end
    
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
