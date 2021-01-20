Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users

  namespace :administration do
    root 'dashboard#home'

    resources :users, only: %i(index destroy)

    resources :topics
  end

  match '/401', to: 'errors#unauthorized', via: :all, as: :unauthorized
  match '/404', to: 'errors#not_found', via: :all
  match '/422', to: 'errors#unprocessable_entity', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
end
