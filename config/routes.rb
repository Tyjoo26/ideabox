Rails.application.routes.draw do
  root "welcome#index"

  resources :categories, only: [:show, :index]

  resources :ideas,  only:[:show, :index]

  resources :images, only: [:show, :index]

  resources :users, only: [:new, :create, :show] do
    resources :ideas, only: [:new, :create, :update, :destroy]
  end


  namespace :admin do
    resources :categories, only: [:index, :new,:create, :destroy]
  end

  namespace :admin do
    resources :images, only: [:new, :create]
  end

  delete '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
end
