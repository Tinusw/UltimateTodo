Rails.application.routes.draw do
  devise_for :users
  get 'home/index'

  resources :todo_lists, only: [:show]

  # routes for API
  namespace :api, defaults: {format: :json} do
    resources :todo_lists, only: [:index] do 
      resources :todo_items, only: [:index, :create, :update, :destroy]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
end
