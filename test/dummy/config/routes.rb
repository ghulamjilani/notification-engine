Rails.application.routes.draw do
  devise_for :users
  resources :notifications do
    collection do
      delete :destroy_all
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'notifications#index'
end
