Rails.application.routes.draw do
  root "homes#top"
  get "about" => "homes#about", as: "about"
  get "books" => "books#index", as: "books"
  resources :books, only:[:new, :create, :edit, :update, :show, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
