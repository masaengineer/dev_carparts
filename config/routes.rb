Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :landing, only: [:index]
  resources :sales_management, only: [:index]

  authenticated :user do
    root 'sales_management#index', as: :authenticated_root
  end

  root 'landing#index'
end
