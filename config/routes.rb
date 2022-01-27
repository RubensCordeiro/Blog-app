Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'

  #Posts routes
  get 'post/new', to: 'posts#new'
  post 'post/new', to: 'posts#create'
  get 'post', to: 'posts#edit'
  patch 'post', to: 'posts#update'
  delete 'post', to: 'posts#destroy'

  #Users Routes
  get 'user/index', to: 'users#index'
  get 'user/posts', to: 'users#my_posts'
end
