Rails.application.routes.draw do

  root "homes#top"
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users, only: [:index, :show, :edit, :update]

  get "home/about" => "homes#about", as: "about"
  get "books" => "books#index", as: "books"
  resources :books, only:[:new, :create, :edit, :update, :show, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
