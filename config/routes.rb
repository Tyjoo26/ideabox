Rails.application.routes.draw do



  namespace :admin do
    resources :categories, :ideas
  end

  resources :categories do
    resources :ideas
  end

  resources :ideas do
    resources :images
  end
  
end
