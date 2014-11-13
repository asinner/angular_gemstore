Rails.application.routes.draw do
  root 'angular#show'

  post '/sign-in' => 'admin/sessions#create'
  delete '/sign-out' => 'admin/sessions#destroy'

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
