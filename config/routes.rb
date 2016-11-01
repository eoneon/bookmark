Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users
  resources :users, only: :show
  get 'about' => 'welcome#about'
end
