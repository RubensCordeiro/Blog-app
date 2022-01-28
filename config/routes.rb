Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'
  get 'timeline', to: 'welcome#timeline'

  #Posts routes
  get 'post', to: 'posts#show'
  get 'post/new', to: 'posts#new'
  post 'post/new', to: 'posts#create'
  get 'post/edit', to: 'posts#edit'
  patch 'post', to: 'posts#update'
  delete 'post', to: 'posts#destroy'

  #Users Routes
  get 'user/index', to: 'users#index'
  get 'user/posts', to: 'users#my_posts'

  #Friend Routes
  get 'friend/add', to: 'friends#add'
end
