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

  resources :templates, only: [:create, :update]
end
