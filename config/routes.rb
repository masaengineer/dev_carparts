Rails.application.routes.draw do
  # Deviseのルーティングを最初に配置
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :landing, only: [:index]
  root "sales_management#index"
end
