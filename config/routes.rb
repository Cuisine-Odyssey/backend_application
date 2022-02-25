Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:show]
    end
  end

end

user_id :
likes: [array of recipe ids]
dislikes: [array of recipe ids]

recipe_id :
likes: (integer)
dislikes: (integer)
