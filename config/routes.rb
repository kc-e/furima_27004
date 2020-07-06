# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root 'products#index'
  # get 'users/sign_in', to: 'devise/sessions#create'
  # resources :devise, only: [:index, :new, :create]
end

# rails g devise:controllers users
