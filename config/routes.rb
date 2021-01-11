Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users

  namespace :administration do
    root 'dashboard#home'

    resources :users, only: %i[index show destroy]
  end
end
