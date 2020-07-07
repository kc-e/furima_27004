# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'items#index'
  resources :items, only: %i[index new create]
  # resources
  # get 'users/sign_in', to: 'devise/sessions#create'
  # resources :devise, only: [:index, :new, :create]
end

# rails g devise:controllers users
