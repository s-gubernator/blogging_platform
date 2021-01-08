Rails.application.routes.draw do
  namespace :administration do
    resources :users
  end
  root 'static_pages#home'

  devise_for :users

  namespace :administration do
    root 'dashboard#home'

    resources :users
  end
end
