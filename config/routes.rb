Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'

  #Posts routes
  get 'posts/new', to: 'posts#new'
  post 'posts/new', to: 'posts#create'
end
