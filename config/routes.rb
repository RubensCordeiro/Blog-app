Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'

  #Posts routes
  get 'posts/new', to: 'posts#new'
  post 'posts/new', to: 'posts#create'
  get 'posts/show', to: 'posts#show'

  #Users Routes
  get 'users/index', to: 'users#index'
  get 'users/posts', to: 'users#my_posts'
end
