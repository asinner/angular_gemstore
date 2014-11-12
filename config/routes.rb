Rails.application.routes.draw do
  devise_for :admins
  root 'angular#show'

  namespace :api do
    scope module: :v1, constraints: ApiConstraint.new(version: 1) do
      resources :products do
        resources :reviews
      end
      resources :categories
    end

    scope module: :v1 do
      resources :products do
        resources :reviews
      end
      resources :categories
    end
  end
end
