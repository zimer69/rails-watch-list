Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  # Defines the root path route ("/")
  # root "articles#index"
  resources :lists, only: %i[index show new create] do
    resources :bookmarks, only: %i[create new]
  end

  resources :movies, only: %i[new create destroy]
end
