Rails.application.routes.draw do
  resources :users, only: [:new, :create]
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    get 'welcome', to: 'sessions#welcome'
    get 'authorized', to: 'sessions#page_requires_login'
    get 'logout', to: 'sessions#logout'
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/login'
  # get 'sessions/welcome'
  # get 'users/new'
  # get 'users/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
