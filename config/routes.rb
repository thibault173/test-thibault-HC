Rails.application.routes.draw do

  devise_for :users

  root to: 'pages#home'

  resources :workstations, only: [:index, :show]
end
