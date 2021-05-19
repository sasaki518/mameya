Rails.application.routes.draw do
   
  root to: "homes#hogehoge1"
  resources :items
  
  
   get "/homes", to: "homes#hogehoge1"
   get "/homes_for_shops", to: "homes#hogehoge2"
   
   get "/myshop", to: "shops#show"
    
   get "/users", to: "users#index"
   get "/users/hogehoge", to: "users#show"
   
    devise_for :shops, controllers: {  registrations: 'shops/registrations', sessions: 'shops/sessions' }
    devise_for :users, controllers: { registraions: 'users/registrations', sessions: 'users/sessions' }
    devise_scope :user do
        get '/users/sign_out' => 'devise/sessions#destroy'
        get '/shops/sign_out' => 'devise/sessions#destroy'
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
