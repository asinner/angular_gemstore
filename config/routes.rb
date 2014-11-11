Rails.application.routes.draw do
  root 'angular#show'

  namespace :api do
    resources :products
    resources :categories
  end
end
