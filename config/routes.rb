Rails.application.routes.draw do
  get 'users/show'

  root 'topics#index'
  devise_for :users
  resources :users, only: :show

  resources :topics do
    resources :bookmarks, except: [:index]
  end

  resources :bookmarks, only: [] do
    resources :likes, only: [:index, :create, :destroy]
  end

  get 'about' => 'welcome#about'
  get 'welcome' => 'welcome#index'
end
