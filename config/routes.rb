Rails.application.routes.draw do
  root 'topics#index'
  devise_for :users
  resources :users, only: :show
  resources :topics
  get 'about' => 'welcome#about'
  get 'welcome' => 'welcome#index'
end
