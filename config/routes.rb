# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }
  resources :landing, only: [:index]
  resources :sales_management, only: [:index]

  authenticated :user do
    root 'sales_management#index', as: :authenticated_root
  end

  root 'landing#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
