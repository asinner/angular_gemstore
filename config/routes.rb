Rails.application.routes.draw do
  root 'angular#show'
  
  resources :products
  resources :categories
end
