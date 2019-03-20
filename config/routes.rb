Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations' }

  root to: 'pages#home'

  resources :workstations, only: [:index, :show] do
    get '/accept', to: 'workstations#accept_first'
  end

  resources :requests, only: [] do
    get '/accept', to: 'requests#accept'
  end
end

