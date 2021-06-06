Rails.application.routes.draw do
   
  root to: "homes#hogehoge1"
  resources :items
  
  namespace :shops do 
      resources :items
  end
  

   get "/homes", to: "homes#hogehoge1"
   get "/homes_for_shops", to: "homes#hogehoge2"
   
   get "/myshop/1", to: "shops#show", as: "myshop"
    
   get "/users", to: "users#index"
   get "/users/hogehoge", to: "users#show"

    devise_for :shops, controllers: {  registrations: 'shops/registrations', sessions: 'shops/sessions' }
    devise_for :users, controllers: { registraions: 'users/registrations', sessions: 'users/sessions',confirmations: 'users/confirmations' }
    devise_scope :user do
        get '/users/sign_out' => 'devise/sessions#destroy'
        get '/shops/sign_out' => 'devise/sessions#destroy'
    end
      resources :rooms, only: [:index, :show, :create] do
        resources :messages, only: [:create]
    end
        namespace :shops do
            resources :rooms, only: [:index, :show, :create]
            resources :messages, only: [:create]
        end
        
        namespace :users do
            resources :rooms, only: [:index, :show, :create]
            resources :messages, only: [:create]
        end
      resources :shops, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
