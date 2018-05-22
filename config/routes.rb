Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/:user_id/items', to: "items#index"
      get 'my_items', to: 'items#my_items'
      get 'search/:keyword', to: 'items#search'
      post '/login', to: "login#login"
      resource :profile, only: [:show, :update]
      resources :items, only: [:show, :create, :update, :destroy] do
        resources :connections, only: [:show, :create, :destroy]
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
