Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users

  namespace :administration do
    root 'dashboard#home'

    get '/test', to: 'dashboard#test'

    resources :users, only: %i[index destroy]
  end
end
