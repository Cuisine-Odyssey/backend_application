Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:show, :create]
      resources :recipes, only: [:show]
      post '/users/create', to: 'users#create'
      post 'recipes/create', to: 'recipes#create'
    end
  end


end
