Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :landing, only: [:index]
  root "sales_management#index"
end
