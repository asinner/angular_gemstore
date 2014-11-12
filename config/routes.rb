Rails.application.routes.draw do
  root 'angular#show'

  namespace :api do    
    scope module: :v1, constraints: ApiConstraint.new(version: 1) do
      resources :products
      resources :categories
    end
    
    scope module: :v1 do
      resources :products
      resources :categories
    end
  end
end
