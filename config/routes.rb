Rails.application.routes.draw do
  root to: 'lw_cinema_movies#index'
  resources :lw_cinema_movies, only: [:index, :edit, :update, :new, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
