Rails.application.routes.draw do
  devise_for :users
  resources :books, only: [:new, :index, :create, :show, :destroy, :update, :edit]
  resources :users, only: [:show, :edit, :update, :index]
  get "/home/about" => "home#about"
  root to: "home#top"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
