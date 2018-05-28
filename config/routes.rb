Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'sort/:method', to 'items#sort'
      get 'search/:keyword', to: 'items#search'
      post '/login', to: "login#login"
      get '/tagged', to: 'items#tagged'
      get '/users/:id', to: 'users#show'
      get '/items_by_city', to: 'items#items_by_city'
      resource :profile, only: [:show, :update]
      resources :items, only: [:index, :show, :create, :update, :destroy] do
        resources :connections, only: [:show, :create, :destroy]
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
