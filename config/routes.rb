# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'products#index'
  # get 'users/sign_in', to: 'devise/sessions#create'
  # resources :devise, only: [:index, :new, :create]
end

# rails g devise:controllers users
