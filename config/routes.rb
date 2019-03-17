Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations' }

  root to: 'pages#home'

  resources :workstations, only: [:index, :show]
end

