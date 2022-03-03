Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:show, :create]
      resources :recipes, only: [:show]
      get '/users', to: 'users#show'
      post '/users/create', to: 'users#create'
      post '/recipes/like', to: 'recipes#create'
      post '/recipes/dislike', to: 'recipes#create'
      post '/cocktails/like', to: 'cocktails#create'
      post '/cocktails/dislike', to: 'cocktails#create'
    end
  end
end
