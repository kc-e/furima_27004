Rails.application.routes.draw do
  
  get 'searches/index'
  get 'searches/search'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  root 'items#index'
  get 'sns_credentials/new'
  resources :items do
    resources :purchases, only: %i[index create]
  end
end
