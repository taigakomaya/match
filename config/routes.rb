Rails.application.routes.draw do
  get 'rooms/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "tweets/top" => "tweets#top"
  resources :users, :only => [:index, :show]
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show]
  resources :tweets do
    resources :likes, only: [:create, :destroy]
  end
  root to:"tweets#top"


end
