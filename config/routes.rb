Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'workspace', to: 'workspaces#show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :categories do
    resources :templates, only: [:create, :new]
  end

  resources :templates

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :categories, only: [:index]
    end
  end
end
